void main() {
  Developer dev = Developer(
    name: "Sara",
    age: 21,
    salary: 8000,
  );

  print("University: ${Person.universityName}");

  dev.showInfo();
  dev.programming();
  dev.communication();
}


class Person {
  String name;
  int _age;

  static String universityName = "Sohag University";

  Person({required this.name, required int age}) : _age = age;

  
  int get age => _age;

 
  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Invalid age");
    }
  }
}


class Employee extends Person {
  double salary;

  Employee({
    required String name,
    required int age,
    required this.salary,
  }) : super(name: name, age: age);

  void showInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Salary: $salary");
  }
}


abstract class Skills {
  void programming();
  void communication();
}


class Developer extends Employee implements Skills {
  Developer({
    required String name,
    required int age,
    required double salary,
  }) : super(name: name, age: age, salary: salary);

  @override
  void programming() {
    print("Programming skill: Dart developer");
  }

  @override
  void communication() {
    print("Communication skill: Good team communication");
  }
}