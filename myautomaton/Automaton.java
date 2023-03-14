package myautomaton;
import java.util.Queue;
import java.util.LinkedList;

public class Automaton {

    // Initial state.
    State S;

    public Automaton(State S) {
        this.S = S;
    }

    public boolean accept(String word) {

        boolean result = false;

        if (word.length() == 0) {
            if (S.isFinal) {
                return true;
            } else {
                return false;
            }
        }
        System.out.println("Is: " + S);
        State currentState = S;

        for (int i = 0; i < word.length(); i++) {

            String symbol = word.substring(i, i + 1);

            State nextState = currentState.getNextState(symbol);

            // System.out.println("****" + nextState);

            if (nextState == null)
                return false;

            if (nextState.isDeathState)
                return false;

            currentState = nextState;

        }

        System.out.println("Is: " + currentState.toString());
        if (currentState.isFinal) {
            result = true;
        }

        return result;
    }

    public void getToken(String word) {

        if (word.length() == 0) {
            if (S.isFinal) {
                System.out.println("It's final state");
            } else {
                System.out.println("It isn't final state");
            }
        }
        State currentState = S;

        Queue<String> tokens = new LinkedList<>();

        for (int i = 0; i < word.length(); i++) {

            String symbol = word.substring(i, i + 1);
            tokens.add(symbol);

            State nextState = currentState.getNextState(symbol);

            currentState = nextState;

            if (currentState.name == "Q1"){
                System.out.println("\nToken: Void" + "\nTipo: " + currentState.name);    
            } else {
                System.out.println("\nToken: " + symbol + "\nTipo: " + currentState.name);
            }
        }
        System.out.println("-------------------------------");
        System.out.println(tokens);
        System.out.println("-------------------------------");
        if (currentState.isFinal) {
            System.out.println("It's final state");
        }
    }

}
