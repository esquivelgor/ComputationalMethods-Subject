# -------------------------------------------
# Instituto Tecnologico de Estudios Superiores de Monterrey
# Project 1. Programming an Automaton
# Guillermo Esquivel Ortiz | A01625621
# Moises Hiram Pineda Campos | A01625510
# <------------------------------------------->
# To compile and execute in sh: 
# python3 main.py
# <------------------------------------------->
# Our replit code
# https://replit.com/@MoisesH/Project1#main.py
# <------------------------------------------->

from Automaton import Automaton
from State import State

def main():
    Q1 = State(False, False, "Q1")
    Q2 = State(True, False, "Integer")
    Q3 = State(True, False, "Real")
    Q4 = State(True, False, "Asignacion")
    Q5 = State(True, False, "Suma")
    Q6 = State(True, False, "Resta")
    Q7 = State(True, False, "Division")
    Q8 = State(True, False, "Multiplicacion")
    Q9 = State(True, False, "Variable")
    Q10 = State(True, False, "Parentesis abertura")
    Q11 = State(True, False, "Parentesis cerradura")

    for i in range(10):
        Q1.addTransition(str(i), Q2)
        Q2.addTransition(str(i), Q2)
        Q3.addTransition(str(i), Q3)
        Q6.addTransition(str(i), Q2)
    Q1.addTransition(" ", Q1)
    Q3.addTransition(" ", Q1)
    Q8.addTransition(" ", Q1)
    Q6.addTransition(" ", Q1)
    Q7.addTransition(" ", Q1)
    Q9.addTransition(" ", Q1)
    Q10.addTransition(" ", Q1)
    Q2.addTransition(".", Q3)
    Q1.addTransition("=", Q4)
    Q1.addTransition("+", Q5)
    Q1.addTransition("-", Q6)
    Q1.addTransition("/", Q7)
    Q1.addTransition("*", Q8)
    Q1.addTransition("a", Q9)
    Q1.addTransition("b", Q9)
    Q1.addTransition("c", Q9)
    Q1.addTransition("(", Q10)
    Q1.addTransition(")", Q11)
    Q8.addTransition("(", Q10)
    Q9.addTransition("a", Q9)
    Q9.addTransition("b", Q9)
    Q9.addTransition("c", Q9)
    Q9.addTransition(")", Q11)
    Q10.addTransition("-", Q6)
    Q11.addTransition("/", Q7)

    automaton = Automaton(Q1)
    print("<------------------> First Word <-------------------->")
    b = "7"
    automaton.getToken(b)

    print("<------------------> Second Word <-------------------->")
    a = "32.4 *(-8.6 - b)/       6.1"
    automaton.getToken(a)
    
    print("<------------------> Third Word <-------------------->")
    d = "a * b"
    automaton.getToken(d)

main()