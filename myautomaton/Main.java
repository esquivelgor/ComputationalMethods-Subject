package myautomaton;

public class Main {

    public static void main(String[] args) {

        State Q1 = new State(false, false, "Q1");
        State Q2 = new State(true, false, "Integer(Real)");
        State Q3 = new State(true, false, "Float(Real)");
        State Q4 = new State(true, false, "Asignacion");
        State Q5 = new State(true, false, "Suma");
        State Q6 = new State(true, false, "Resta");
        State Q7 = new State(true, false, "Division");
        State Q8 = new State(true, false, "Multiplicacion");
        State Q9 = new State(true, false, "Variable");
        State Q10 = new State(true, false, "Parentesis abertura");
        State Q11 = new State(true, false, "Parentesis cerradura");

        Q1.addTranstition(" ", Q1);
        Q3.addTranstition(" ", Q1);
        Q8.addTranstition(" ", Q1);
        Q6.addTranstition(" ", Q1);
        Q7.addTranstition(" ", Q1);
        Q10.addTranstition(" ", Q1);
        for(int i = 0; i <= 9; i++){
            Q1.addTranstition(Integer.toString(i), Q2);
            Q2.addTranstition(Integer.toString(i), Q2);
            Q3.addTranstition(Integer.toString(i), Q3);
            Q6.addTranstition(Integer.toString(i), Q2);
        }
        Q2.addTranstition(".", Q3);
        Q1.addTranstition("=", Q4);
        Q1.addTranstition("+", Q5);
        Q1.addTranstition("-", Q6);
        Q1.addTranstition("/", Q7);
        Q1.addTranstition("*", Q8);
        Q1.addTranstition("a", Q9);
        Q1.addTranstition("b", Q9);
        Q1.addTranstition("c", Q9);
        Q1.addTranstition("(", Q10);
        Q1.addTranstition(")", Q11);
        Q8.addTranstition("(", Q10);
        Q9.addTranstition("a", Q9);
        Q9.addTranstition("b", Q9);
        Q9.addTranstition("c", Q9);
        Q9.addTranstition(")", Q11);
        Q10.addTranstition("-", Q6);
        Q11.addTranstition("/", Q7);

        Automaton automaton = new Automaton(Q1);

        String word = "32.4 *(-8.6 - b)/       6.1";

        automaton.getToken(word);
    }

}
