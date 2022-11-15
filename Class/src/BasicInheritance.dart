class ParentClass {
  int? Value;
  String? Name;

  void ShowValue() {
    print("Value : ${this.Value}");
  }

  void ShowName() {
    print("Name : ${this.Name}");
  }
}

class ChildClassOne extends ParentClass {}

class ChildClassTwo extends ParentClass {
  double? Rate;
  void ShowRate() {
    print("Rate : ${this.Rate}");
  }
}

void main(List<String> args) {
  ChildClassOne c1 = ChildClassOne();
  c1.Name = "Child Class 1";
  c1.Value = 1;
  c1.ShowName();
  c1.ShowValue();

  print("   --------------   ");

  ChildClassTwo c2 = ChildClassTwo();
  c2.Name = "Child Class 2";
  c2.Value = 22;
  c2.Rate = 2.0;
  c2.ShowName();
  c2.ShowValue();
  c2.ShowRate();
}
