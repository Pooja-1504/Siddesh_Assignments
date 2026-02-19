import java.util.Scanner;

public class Calculator {

    // Function for calculation
    static double calculate(double a, double b, char operator) {
        switch(operator) {
            case '+': return a + b;
            case '-': return a - b;
            case '*': return a * b;
            case '/': 
                if(b != 0)
                    return a / b;
                else {
                    System.out.println("Cannot divide by zero");
                    return 0;
                }
            default:
                System.out.println("Invalid operator");
                return 0;
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter first number: ");
        double num1 = sc.nextDouble();

        System.out.print("Enter operator (+, -, *, /): ");
        char op = sc.next().charAt(0);

        System.out.print("Enter second number: ");
        double num2 = sc.nextDouble();

        double result = calculate(num1, num2, op);
        System.out.println("Result = " + result);
        
        sc.close();
    }
}
