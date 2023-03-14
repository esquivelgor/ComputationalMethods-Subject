package myautomaton;

import java.util.HashMap;

public class State {

    boolean isFinal;
    boolean isDeathState;
    String name;
    HashMap<String, State> transitions;

    public State(boolean isFinal, boolean isDeathState,
            String name) {
        this.isFinal = isFinal;
        this.isDeathState = isDeathState;
        this.name = name;
        transitions = new HashMap<>();
    }

    public void addTranstition(String symbol, State state){
        transitions.put(symbol, state);
    }
    
    public State getNextState(String symbol){
        return transitions.get(symbol);
    }
    
    @Override
    public String toString() {
        return "State{" + "isFinal=" + isFinal + ", isDeathState=" + isDeathState + ", name=" + name + ", transitions=" + transitions.size() + '}';
    }
    
}
