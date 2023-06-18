from State import State


class Automaton:
    def __init__(self, S):
        self.S = S

    def getToken(self, word):
        currentState = self.S
        skip = 0
        for i in range(len(word)):
            symbol = word[i]

            nextState = currentState.getNextState(symbol)
            currentState = nextState

            if currentState.name == "Q1":
                continue
            else:
                print("\nToken:", symbol, "\nTipo:", currentState.name)
