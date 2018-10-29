import sys
from antlr4 import *
from pddlLexer import pddlLexer
from pddlParser import pddlParser
from pddlListener import pddlListener
from model import *

class ModelBuilder(pddlListener):
    def exitTypedVariableList(self, ctx):
        print(ctx.name().getText())

def main(argv):
    input = FileStream(argv[1])
    lexer = pddlLexer(input)
    stream = CommonTokenStream(lexer)
    parser = pddlParser(stream)
    tree = parser.pddlDoc()
    printer = ModelBuilder()
    walker = ParseTreeWalker()
    walker.walk(printer, tree)


if __name__ == '__main__':
    main(sys.argv)
