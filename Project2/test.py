import re

# Expresiones regulares - Categorias
# -> G1
# Keyword (E.g. int, return)         -> G2
# String (E.g. "Hello, world!")      -> G3
# Operator (E.g. +, <, =)            -> G4
# Punctuation (E.g. (), {})          -> G5
# Include (E.g. #include)            -> G6 | Pink
# Tabs 				                 -> G7 | Skip

# Token specializations
G1 = re.compile(r"(#[a-z]+)")
# G2 =
# G3 =
# G4 =
# G5 =
G6 = re.compile(r"#")
G7 = re.compile(r"[ \t]+")


def replace2Html(text, color):
    return f"<span style='color: {color}'>{text}</span>"


def tokenize(file):
    with open(file, 'r') as f:
        copy = ""
        for line in f:
            if (line == ""):
                continue
            else:
                print("--------------------- 1")
                match = re.search(G1, line)
                print(match.string)
                # print(match.group())
                copy += re.sub(G1, replace2Html(match, "pink"), line)
                print("--------------------- 2")
        print(copy)
    # print(matchObject)i


fileURL = "./test.txt"
tokenize(fileURL)
