import 'dart:io';

void main() {
  List<List<dynamic>> masterRegistry = [];
  launchSystem(masterRegistry);
}

void launchSystem(List<List<dynamic>> registry) {
  print("Enter number of students:");
  int limit = getInt();

  for (int a = 0; a < limit; a++) {
    print("Enter student ${a + 1} name:");
    String personName = getStr();

    while (!isTextOnly(personName)) {
      print("Invalid name! Use letters and spaces only:");
      personName = getStr();
    }

    print("Enter number of subjects:");
    int coursesNum = getInt();

    double pointsSum = 0;

    for (int b = 0; b < coursesNum; b++) {
      print("Enter subject ${b + 1} grade:");
      double singleGrade = getDouble();
      while(singleGrade > 100 || singleGrade < 0){
        print("invalid grade , try again :");
        singleGrade = getDouble();
      }
      pointsSum += singleGrade;
    }

    double meanValue = pointsSum / coursesNum;
    registry.add([personName, meanValue]);
  }

  controlManager(registry);
}

void controlManager(List<List<dynamic>> sourceData) {
  while (true) {
    print("\nMenu:");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    int inputKey = getInt();

    if (inputKey == 1) {
      printSummary(sourceData);
    } else if (inputKey == 2) {
      findScholar(sourceData);
    } else if (inputKey == 3) {
      print("Goodbye");
      return;
    } else {
      print("Invalid choice");
    }
  }
}

void printSummary(List<List<dynamic>> dataset) {
  for (var element in dataset) {
    String studentName = element[0];
    double averageVal = element[1];

    String rank = assignLetter(averageVal);

    print("${studentName.toUpperCase()} | Avg: ${averageVal.toStringAsFixed(2)} | Grade: $rank");
  }
}

void findScholar(List<List<dynamic>> group) {
  print("Enter student name to search:");
  String searchKey = getStr();

  bool foundFlag = false;

  for (var member in group) {
    String memberName = member[0];
    double memberAvg = member[1];

    if (memberName.toLowerCase() == searchKey.toLowerCase()) {
      print("Average: ${memberAvg.round()}");
      foundFlag = true;
      break;
    }
  }

  if (!foundFlag) {
    print("Student not found");
  }
}

String assignLetter(double gpa) {
  if (gpa >= 90) return "A";
  if (gpa >= 75) return "B";
  if (gpa >= 60) return "C";
  return "F";
}

String getStr() {
  String? buffer = stdin.readLineSync();
  while (buffer == null || buffer.trim().isEmpty) {
    print("Invalid input, try again:");
    buffer = stdin.readLineSync();
  }
  return buffer;
}

int getInt() {
  String s = getStr();
  int? n = int.tryParse(s);
  while (n == null) {
    print("Invalid number, try again:");
    s = getStr();
    n = int.tryParse(s);
  }
  return n;
}

double getDouble() {
  String s = getStr();
  double? d = double.tryParse(s);
  while (d == null) {
    print("Invalid number, try again:");
    s = getStr();
    d = double.tryParse(s);
  }
  return d;
}

bool isTextOnly(String val) => RegExp(r'^[a-zA-Z\s]+$').hasMatch(val);