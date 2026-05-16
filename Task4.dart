class Individual {
  String fullTitle;
  int _currentAge;

  Individual(this.fullTitle, this._currentAge);

  int get currentAge {
    return _currentAge;
  }

  set currentAge(int ageVal) {
    if (ageVal <= 0) {
      print("Age must be greater than zero.");
    } else {
      _currentAge = ageVal;
    }
  }

  static String campusName = "Sohag University";
}

class Staff extends Individual {
  double income;

  Staff(String name, int age, this.income) : super(name, age);

  void printStaffData() {
    print("University: ${Individual.campusName}");
    print("Name: $fullTitle");
    print("Age: $currentAge");
    print("Salary: $income");
  }
}

abstract class CoreDuties {
  void coding();
  void teamwork();
}

class AppDeveloper extends Staff implements CoreDuties {
  AppDeveloper(String name, int age, double income) : super(name, age, income);

  @override
  void coding() {
    print("Programming skill: Dart developer");
  }

  @override
  void teamwork() {
    print("Communication skill: Strong team collaboration");
  }
}

void main() {
  AppDeveloper engineer = AppDeveloper("Wael", 25, 8000);

  engineer.printStaffData();
  engineer.coding();
  engineer.teamwork();
}
