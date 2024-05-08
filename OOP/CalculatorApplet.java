import java.awt.*;
import java.awt.event.*;
import java.applet.*;

@SuppressWarnings("removal")
public class CalculatorApplet extends Applet implements ActionListener {
    TextField textField;
    Button[] buttons;
    String[] buttonLabels = {
        "7", "8", "9", "/",
        "4", "5", "6", "*",
        "1", "2", "3", "-",
        "C", "0", "=", "+"
    };
    String input = "";
    
    public void init() {
        textField = new TextField(20);
        add(textField);
        
        Panel buttonPanel = new Panel(new GridLayout(4, 4));
        buttons = new Button[buttonLabels.length];
        
        for (int i = 0; i < buttonLabels.length; i++) {
            buttons[i] = new Button(buttonLabels[i]);
            buttons[i].addActionListener(this);
            buttonPanel.add(buttons[i]);
        }
        
        add(buttonPanel);
    }
    
    public void actionPerformed(ActionEvent e) {
        String actionCommand = e.getActionCommand();
        
        if (actionCommand.equals("=")) {
            // Evaluate the expression and display result
            try {
                input = String.valueOf(eval(input));
                textField.setText(input);
            } catch (Exception ex) {
                textField.setText("Error");
            }
        } else if (actionCommand.equals("C")) {
            // Clear the input field
            input = "";
            textField.setText(input);
        } else {
            // Append button label to input
            input += actionCommand;
            textField.setText(input);
        }
    }
    
    // Evaluate the arithmetic expression
    private double eval(String expression) {
        return new Object() {
            int pos = -1, ch;

            void nextChar() {
                ch = (++pos < expression.length()) ? expression.charAt(pos) : -1;
            }

            boolean eat(int charToEat) {
                while (ch == ' ') nextChar();
                if (ch == charToEat) {
                    nextChar();
                    return true;
                }
                return false;
            }

            double parse() {
                nextChar();
                double x = parseExpression();
                if (pos < expression.length()) throw new RuntimeException("Unexpected: " + (char)ch);
                return x;
            }

            double parseExpression() {
                double x = parseTerm();
                for (;;) {
                    if      (eat('+')) x += parseTerm(); // Addition
                    else if (eat('-')) x -= parseTerm(); // Subtraction
                    else return x;
                }
            }

            double parseTerm() {
                double x = parseFactor();
                for (;;) {
                    if      (eat('*')) x *= parseFactor(); // Multiplication
                    else if (eat('/')) x /= parseFactor(); // Division
                    else return x;
                }
            }

            double parseFactor() {
                if (eat('+')) return parseFactor(); // Unary plus
                if (eat('-')) return -parseFactor(); // Unary minus

                double x;
                int startPos = this.pos;
                if (eat('(')) { // Parentheses
                    x = parseExpression();
                    eat(')');
                } else if ((ch >= '0' && ch <= '9') || ch == '.') { // Numbers
                    while ((ch >= '0' && ch <= '9') || ch == '.') nextChar();
                    x = Double.parseDouble(expression.substring(startPos, this.pos));
                } else {
                    throw new RuntimeException("Unexpected: " + (char)ch);
                }

                if (eat('^')) x = Math.pow(x, parseFactor()); // Exponentiation

                return x;
            }
        }.parse();
    }
}
