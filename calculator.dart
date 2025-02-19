import 'dart:io';
import 'dart:async';
import 'dart:math'; // Import the math library

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  double divide(double a, double b) {
    if (b == 0) {
      throw Exception('Error: Division by zero is not allowed.');
    }
    return a / b;
  }

  double modulus(double a, double b) {
    if (b == 0) {
      throw Exception('Error: Modulus by zero is not allowed.');
    }
    return a % b;
  }

  double power(double a, double b) =>
      pow(a, b).toDouble(); // Use pow from dart:math
}

Future<void> performCalculation(
  Calculator calc,
  double num1,
  double num2,
  String operator,
) async {
  try {
    double result;

    switch (operator) {
      case '+':
        result = calc.add(num1, num2);
        break;
      case '-':
        result = calc.subtract(num1, num2);
        break;
      case '*':
        result = calc.multiply(num1, num2);
        break;
      case '/':
        result = calc.divide(num1, num2);
        break;
      case '%':
        result = calc.modulus(num1, num2);
        break;
      case '^':
        result = calc.power(num1, num2);
        break;
      default:
        print('Error: Unsupported operator.');
        return;
    }

    print('Calculating...');

    // await Future.delayed(Duration(seconds: 10)); // Simulate processing delay
    print('Result: $result');
  } catch (e) {
    print(e);
  }
}

void main() {
  Calculator calculator = Calculator();

  while (true) {
    try {
      stdout.write('\nEnter first number: ');
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write('Enter an operator (+, -, *, /, %, ^): ');
      String operator = stdin.readLineSync()!;

      stdout.write('Enter second number: ');
      double num2 = double.parse(stdin.readLineSync()!);

      performCalculation(calculator, num1, num2, operator);
    } catch (e) {
      print('Invalid input! Please enter numbers and a valid operator.');
    }

    stdout.write('\nDo you want to perform another calculation? (yes/no): ');
    String? choice = stdin.readLineSync()?.toLowerCase();
    if (choice != 'yes') break;
  }

  print('Goodbye!');
}
