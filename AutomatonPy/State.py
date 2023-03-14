import collections
class State:
    def __init__(self, isFinalState, isDeathState, name):
        self.isFinalState = isFinalState
        self.isDeathState = isDeathState
        self.name = name
        self.transitions = collections.defaultdict(State)

    def addTransition(self, symbol, state):
        self.transitions[symbol] = state

    def getNextState(self, symbol):
        return self.transitions[symbol]