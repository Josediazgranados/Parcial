import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.util.Scanner;

public class MainMaclaurin {
    public static void main(String[] args) throws Exception {
        Scanner scanner = new Scanner(System.in);
        System.out.println("=== Serie de Maclaurin para e^x ===");
        System.out.println("Ejemplo: maclaurin(x=2,n=5)");

        while (true) {
            System.out.print("> ");
            String input = scanner.nextLine();
            if (input.trim().isEmpty()) break;

            CharStream cs = CharStreams.fromString(input);
            MaclaurinLexer lexer = new MaclaurinLexer(cs);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            MaclaurinParser parser = new MaclaurinParser(tokens);

            ParseTree tree = parser.prog();
            EvalVisitor eval = new EvalVisitor();
            Double result = eval.visit(tree);

            System.out.println("≈ " + result);
        }
        scanner.close();
    }
}

