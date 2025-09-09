"""@coderabbitai generate docstrings"""

import ast
import os
import os.path
import sys

import astor


class AddDocString(ast.NodeTransformer):
    """@coderabbitai generate docstrings"""

    def __init__(self, *args, docstring: str, **kwargs):
        """@coderabbitai generate docstrings"""
        super().__init__(*args, **kwargs)
        self.docstring = docstring

    def add_docstring(self, node):
        """@coderabbitai generate docstrings"""
        if ast.get_docstring(node) is None:
            node.body.insert(0, ast.Expr(value=ast.Constant(self.docstring)))
        return self.generic_visit(node)

    def visit_FunctionDef(self, node):
        """@coderabbitai generate docstrings"""
        return self.add_docstring(node)

    def visit_AsyncFunctionDef(self, node):
        """@coderabbitai generate docstrings"""
        return self.add_docstring(node)

    def visit_ClassDef(self, node):
        """@coderabbitai generate docstrings"""
        return self.add_docstring(node)

    def visit_Module(self, node):
        """@coderabbitai generate docstrings"""
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
