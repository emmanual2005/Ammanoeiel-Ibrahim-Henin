import 'dart:io';

void main() {
  List<String> namesList = [];
  List<List<double>> gradesMatrix = [];

  print("Enter number of students: ");
  int numStudents = int.parse(stdin.readLineSync()!);

  int counter = 0;
  while (counter < numStudents) {
    print("Enter student name: ");
    String name = stdin.readLineSync()!;
    namesList.add(name);

    print("Enter number of subjects: ");
    int numSubjects = int.parse(stdin.readLineSync()!);

    List<double> studentDegrees = [];
    
    for (int k = 0; k < numSubjects; k++) {
      print("Enter grade: ");
      double degree = double.parse(stdin.readLineSync()!);
      studentDegrees.add(degree);
    }

    gradesMatrix.add(studentDegrees);
    counter++;
  }

  while (true) {
    print("\n1- Show Results");
    print("2- Search Student");
    print("3- Exit");

    print("Choose: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        for (int i = 0; i < namesList.length; i++) {
          double sum = 0;
          
          for (int j = 0; j < gradesMatrix[i].length; j++) {
            sum = sum + gradesMatrix[i][j];
          }

          double avg = sum / gradesMatrix[i].length;
          String gradeLetter = "";

          if (avg >= 90) {
            gradeLetter = "A";
          } else if (avg >= 75) {
            gradeLetter = "B";
          } else if (avg >= 60) {
            gradeLetter = "C";
          } else {
            gradeLetter = "F";
          }

          print("${namesList[i]} - Average: ${avg.toStringAsFixed(2)} - Grade: $gradeLetter");
        }
        break;

      case 2:
        print("Enter student name: ");
        String searchName = stdin.readLineSync()!;

        int indexFound = -1;
        for (int m = 0; m < namesList.length; m++) {
          if (namesList[m] == searchName) {
            indexFound = m;
            break; 
          }
        }

        if (indexFound == -1) {
          print("Student not found");
        } else {
          double sum = 0;
          for (int j = 0; j < gradesMatrix[indexFound].length; j++) {
            sum = sum + gradesMatrix[indexFound][j];
          }
          double avg = sum / gradesMatrix[indexFound].length;
          print("${namesList[indexFound]} Average: ${avg.round()}");
        }
        break;

      case 3:
        print("Exiting program...");
        return; 
        
      default:
        print("Invalid choice!");
    }
  }
}
