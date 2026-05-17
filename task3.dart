void main() {
  Set<String> attendeeSet = {};

  enroll(attendeeSet, "saed");
  enroll(attendeeSet, "soha");
  enroll(attendeeSet, "mohamed");

  enroll(attendeeSet, "saed");

  print("Students (Recursive) ");
  showAllRecursive(attendeeSet.toList(), 0);

  print("\n Students (Lambda forEach) ");
  attendeeSet.forEach((p) => print(p));

  Set<String> extraGroup = {"omar", "mai"};
  attendeeSet = {...attendeeSet, ...extraGroup};

  print("\n After Merging ");
  attendeeSet.forEach((p) => print(p));

  Map<String, List<double>> scoreMap = {};

  addResult(scoreMap, "saed", "Math", val: 90);
  addResult(scoreMap, "saed", "Science", val: 80);
  addResult(scoreMap, "saed", "English", val: 70);

  addResult(scoreMap, "soha", "Math", val: 100);
  addResult(scoreMap, "soha", "Science", val: 85);

  print("\n=== Averages ===");
  showFinalMean(scoreMap, "saed");
  showFinalMean(scoreMap, "soha");
}

void enroll(Set<String> set, String person) {
  set.add(person);
}

void showAllRecursive(List<String> arr, int i) {
  if (i == arr.length) return;

  print(arr[i]);
  showAllRecursive(arr, i + 1);
}

void addResult(
  Map<String, List<double>> map,
  String name,
  String topic, {
  double val = 0,
}) {
  if (!map.containsKey(name)) {
    map[name] = [];
  }

  map[name]!.add(val);
}

double calculateAvg(List<double> nums, double Function(double, double) mathOp) {
  return nums.reduce(mathOp) / nums.length;
}

void showFinalMean(Map<String, List<double>> database, String searchName) {
  if (!database.containsKey(searchName)) {
    print("Student not found");
    return;
  }

  var marksList = database[searchName]!;

  double avgResult = calculateAvg(marksList, (n1, n2) => n1 + n2);

  print("$searchName average = ${avgResult.toStringAsFixed(2)}");
}