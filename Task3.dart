import 'dart:io';

void addNewStudent(Set<String> targetSet, String name) {
  targetSet.add(name);
}

void printNamesRecursive(List<String> list, [int index = 0]) {
  if (index >= list.length) return;

  print(list[index]);
  printNamesRecursive(list, index + 1);
}

void addSubjectRecord(Map<String, Map<String, double>> registry, String student, String subject, [double grade = 0]) {
  if (!registry.containsKey(student)) {
    registry[student] = {}; 
  }
  registry[student]![subject] = grade;
}

double computeStudentAverage(Map<String, Map<String, double>> registry, String student) {
  var subjectsMap = registry[student];

  if (subjectsMap == null || subjectsMap.isEmpty) {
    return 0;
  }

  double sum = 0;
  for (var score in subjectsMap.values) {
    sum += score;
  }

  return sum / subjectsMap.length;
}

void showStudentReport(Map<String, Map<String, double>> registry, String student) {
  var subjectsMap = registry[student];

  if (subjectsMap == null || subjectsMap.isEmpty) {
    print("No courses found for $student");
    return;
  }

  print("\nCourses for $student:");
  for (var entry in subjectsMap.entries) {
    print("${entry.key} : ${entry.value}");
  }
}

void main() {
  Set<String> studentsRegistry = {};

  addNewStudent(studentsRegistry, "Wael");
  addNewStudent(studentsRegistry, "Kero");
  addNewStudent(studentsRegistry, "Toni");

  print("Students using recursion:");
  printNamesRecursive(studentsRegistry.toList());

  print("\nStudents using lambda:");
  for (var studentName in studentsRegistry) {
    print(studentName);
  }

  Set<String> additionalStudents = {"Mona", "Omar"};

  studentsRegistry.addAll(additionalStudents);

  print("\nAfter merging sets:");
  for (var student in studentsRegistry) {
    print(student);
  }

  Map<String, Map<String, double>> academicLog = {};

  addSubjectRecord(academicLog, "Wael", "Math", 90);
  addSubjectRecord(academicLog, "Wael", "Programming", 95);
  addSubjectRecord(academicLog, "Toni", "Math", 80);

  showStudentReport(academicLog, "Wael");

  print("\nAverage grade of Wael:");
  print(computeStudentAverage(academicLog, "Wael"));
}
