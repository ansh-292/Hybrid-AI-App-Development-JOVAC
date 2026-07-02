import 'dart:io';

class Employee {
  String employeeId = "";
  String employeeName = "";
  String department = "";

  void displayEmployeeInfo() {
    print("Employee ID : $employeeId");
    print("Name        : $employeeName");
    print("Department  : $department");
  }
}

class Salary extends Employee {
  double basicSalary = 0;
  double hra = 0;
  double da = 0;
  double bonus = 0;

  double grossSalary = 0;
  double tax = 0;
  double netSalary = 0;

  double calculateGrossSalary() {
    grossSalary = basicSalary + hra + da + bonus;
    return grossSalary;
  }

  double calculateTax() {
    if (grossSalary > 80000) {
      tax = grossSalary * 0.20;
    } else if (grossSalary > 50000) {
      tax = grossSalary * 0.10;
    } else {
      tax = 0;
    }
    return tax;
  }

  double calculateNetSalary() {
    netSalary = grossSalary - tax;
    return netSalary;
  }

  void displaySalarySlip() {
    print("\n==========================================");
    print("         EMPLOYEE SALARY SLIP");
    print("==========================================\n");

    displayEmployeeInfo();

    print("\nBasic Salary : ₹$basicSalary");
    print("HRA          : ₹$hra");
    print("DA           : ₹$da");
    print("Bonus        : ₹$bonus");

    print("\nGross Salary : ₹$grossSalary");
    print("Tax          : ₹$tax");
    print("Net Salary   : ₹$netSalary");

    print("\n==========================================");
  }
}

class Manager extends Salary {
  double performanceIncentive = 0;

  @override
  double calculateGrossSalary() {
    grossSalary =
        basicSalary + hra + da + bonus + performanceIncentive;
    return grossSalary;
  }
}

void main() {
  Manager emp = Manager();

  print("Enter Employee ID:");
  emp.employeeId = stdin.readLineSync()!;

  print("Enter Employee Name:");
  emp.employeeName = stdin.readLineSync()!;

  print("Enter Department:");
  emp.department = stdin.readLineSync()!;

  print("Enter Basic Salary:");
  emp.basicSalary = double.parse(stdin.readLineSync()!);

  print("Enter HRA:");
  emp.hra = double.parse(stdin.readLineSync()!);

  print("Enter DA:");
  emp.da = double.parse(stdin.readLineSync()!);

  print("Enter Bonus:");
  emp.bonus = double.parse(stdin.readLineSync()!);

  print("Enter Performance Incentive:");
  emp.performanceIncentive =
      double.parse(stdin.readLineSync()!);

  emp.calculateGrossSalary();
  emp.calculateTax();
  emp.calculateNetSalary();

  emp.displaySalarySlip();
}