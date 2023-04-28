import re


def replace2Html(text, color):
    return f"<span style='color: {color}'>{text}</span>"


def writeHtml(file, text):
    with open(file, "w") as f:
        f.write(text)


def tokenize(file):
    keywords = {'int', 'main', 'std', 'cout',
                'return', 'endl', 'if', 'true', 'false'}
    tokenSpecifications = [
        ('Include', r"#include+"),        # G1 | Pink | Include sentence
        ('Number', r"\d+(\.\d*)?"),     # G2 | Green | Integer of float
        ('Puntuaction', r'([{}()<>.;:=,!"])'), # G3 | Purple | Puntuaction
        ('Operators', r'[+*-]'),        #G4 | Red | Any Operator
        ('Space', r"[ \t]"),           # G5 | | Spaces
        ('Tab', r"\n"),                 # G6 | | Tabs
        ('String', r"[a-zA-Z]+"),       # G7 | Orange | Any string
        ('Keyword', r"[a-zA-Z]+"),      # G8 | Brown | Predefined keywords
        ('Comments', r"//.*")        # G9 | Yellow | Include sentence
    ]

    tok_regex = '|'.join('(?P<%s>%s)' % pair for pair in tokenSpecifications)

    with open(file, 'r') as f:
        copy = ""
        for line in f:
            for tok in re.finditer(tok_regex, line):
                tok_name = tok.lastgroup
                tok_text = tok.group()

                if (tok_name == "Include"):
                    copy += replace2Html(tok_text, "pink")
                elif (tok_name == "Number"):
                    copy += replace2Html(tok_text, "green")
                elif (tok_name == "Puntuaction"):
                    copy += replace2Html(tok_text, "#6a329f")
                elif (tok_name == "Operators"):
                    copy += replace2Html(tok_text, "red")
                elif (tok_name == "Space"):
                    copy += "\n"
                elif (tok_name == "Tab"):
                    copy += "<br>"
                elif (tok_text in keywords):
                    copy += replace2Html(tok_text, "brown")
                elif (tok_name == "String"):
                    copy += replace2Html(tok_text, "orange")
                elif (tok_name == "Comments"):
                    copy += replace2Html(tok_text, "yellow")
                else:
                    continue

        print(copy)
        writeHtml("./final.html", copy)


fileURL = "./entrada.txt"
tokenize(fileURL)