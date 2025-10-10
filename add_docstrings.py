#!/usr/bin/python3

import ast
import os
import os.path
import sys

import astor


class AddDocString(ast.NodeTransformer):
    def __init__(self, *args, docstring: str, **kwargs):
        """
        Initialize the AddDocString transformer with the docstring text to insert.

        The provided `docstring` value is stored on the instance as `self.docstring` and will be inserted into any Module, ClassDef, FunctionDef, or AsyncFunctionDef that lacks a docstring.
        Any additional positional and keyword arguments are forwarded to the superclass initializer.
        """
        super().__init__(*args, **kwargs)
        self.docstring = docstring

    def add_docstring(self, node):
        """
        Insert the configured docstring into the given AST node if it has no existing docstring.

        If the node (Module, ClassDef, FunctionDef, or AsyncFunctionDef) has no docstring, this function inserts the value of self.docstring as the first statement of node.body. If a docstring already exists, the node is left unchanged. The node is then traversed with generic_visit and returned.

        Parameters:
            node (ast.AST): An AST node that has a `body` sequence (module, class, or function node).

        Returns:
            ast.AST: The (possibly modified) node after applying generic visitation.
        """
        if ast.get_docstring(node) is None:
            node.body.insert(0, ast.Expr(value=ast.Constant(self.docstring)))
        return self.generic_visit(node)

    def visit_FunctionDef(self, node):
        """
        Ensure an ast.FunctionDef node has a docstring, inserting the transformer's configured docstring if one is missing, then continue generic traversal.

        Delegates to add_docstring(node) and returns the possibly modified ast.FunctionDef node.
        """
        return self.add_docstring(node)

    def visit_AsyncFunctionDef(self, node):
        """
        Visit an async function definition node and ensure it has a docstring.

        If the async function node has no existing docstring, inserts self.docstring
        as the first statement in the node's body. Continues generic AST traversal
        and returns the (possibly modified) node.

        Parameters:
            node (ast.AsyncFunctionDef): The async function AST node to visit.

        Returns:
            ast.AST: The visited (and possibly modified) node.
        """
        return self.add_docstring(node)

    def visit_ClassDef(self, node):
        """
        Visit a class definition node and ensure it has a docstring.

        If the class has no docstring, insert the transformer's configured docstring as the first statement. Returns the (possibly modified) AST ClassDef node for further traversal.

        Parameters:
            node (ast.ClassDef): The class definition AST node to visit and potentially modify.

        Returns:
            ast.AST: The transformed ClassDef node.
        """
        return self.add_docstring(node)

    def visit_Module(self, node):
        """
        Ensure the given module AST node has a docstring. If the module lacks a docstring, insert the transformer's configured docstring as the first statement, then continue a generic visit of the node's children.

        Parameters:
            node (ast.Module): The module AST node to process.

        Returns:
            ast.AST: The module node after potential modification and traversal.
        """
        return self.add_docstring(node)


if __name__ == "__main__":
    converter = AddDocString(
        docstring=os.environ.get("PY_DOCSTRING", "@coderabbitai generate docstrings")
    )
    for file in sys.argv[1:]:
        with open(file, "rb") as f:
            tree = ast.parse(f.read())
        result = astor.to_source(converter.visit(tree))
        file, ext = os.path.splitext(file)
        with open(f"{file}_modified{ext}", "w") as f:
            f.write(result)
