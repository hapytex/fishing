#!/usr/bin/python3

import ast
import os
import os.path
import sys

import astor


class CheckTypeHints(ast.NodeTransformer):
    IGNORE_PARAMETER_NAMES = {"self", "cls", "klass"}
    ARG_COLLECTIONS = {
        "posonlyargs": False,
        "args": False,
        "kwonlyargs": False,
        "vararg": True,
        "kwarg": True,
    }

    def __init__(self, *args, filename="<unknown>", **kwargs) -> None:
        super().__init__(*args, **kwargs)
        self.filename = filename

    def get_qualfied_name(self, node: ast.AST):
        return f"{self.filename}:{node.lineno}"

    def check_types(self, node) -> ast.AST:
        location = self.get_qualfied_name(node)
        args = node.args
        for arg_col, wrap in self.ARG_COLLECTIONS.items():
            col = getattr(args, arg_col)
            if col is not None:
                if wrap:
                    col = (col,)
                for argi in col:
                    if (
                        not argi.annotation
                        and argi.arg not in self.IGNORE_PARAMETER_NAMES
                    ):
                        print(
                            f"{location}: argument \x1b[1m{argi.arg}\x1b[0m has no type hint"
                        )
        if not node.returns:
            print(f"{location}: no return type hint")
        return self.generic_visit(node)

    def visit_FunctionDef(self, node):
        return self.check_types(node)

    def visit_AsyncFunctionDef(self, node):
        return self.check_types(node)


if __name__ == "__main__":
    for file in sys.argv[1:]:
        converter = CheckTypeHints(filename=file)
        with open(file, "rb") as f:
            tree = ast.parse(f.read(), filename=file)
        converter.visit(tree)
