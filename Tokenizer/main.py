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
        ('Include', r"#[a-z]+"),        # G1 | Pink | Include sentence
        ('Number', r"\d+(\.\d*)?"),     # G2 | Green | Integer of float
        ('Puntuaction', r'([{}()<>.;:=+,!"])'), # G3 | Black | Yeap, puntuaction
        ('Space', r"[ \t]"),           # G4 | | Spacess
        ('Tab', r"\n"),                 # G5 | | Tabs
        ('String', r"[a-zA-Z]+"),       # G6 | Orange | Any string
        ('Keyword', r"[a-zA-Z]+")      # G7 | Brown | Predefined keywords
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
                elif (tok_name == "Space"):
                    copy += "\n"
                elif (tok_name == "Tab"):
                    copy += "<br>"
                elif (tok_text in keywords):
                    copy += replace2Html(tok_text, "red")
                elif (tok_name == "String"):
                    copy += replace2Html(tok_text, "black")
                else:
                    continue

        print(copy)
        writeHtml("./final.html", copy)


fileURL = "./test.txt"
tokenize(fileURL)
