class ParentClass {
  int Val = 100;
  void ShowName() {
    print("Name : parent");
  }

  void ShowName2() {
    print("Name : still parent");
  }
}

class ChildClassOne extends ParentClass {
  int Sum = 199;
  void ShowName() {
    super.ShowName();
    print("Name : child");
  }

  void ShowName2() {
    super.ShowName2();
    print("Name : still child");
  }

  void PrintVal() {
    print("Par Val : ${super.Val}");
    print("Sum Var : ${this.Sum}");
  }
}

class ChildClassTwo extends ParentClass {
  @override
  void ShowName() {
    super.ShowName();
    print("Child 2");
  }
}

void main(List<String> args) {
  ChildClassOne c1 = ChildClassOne();
  c1.ShowName();
  c1.ShowName2();
  c1.PrintVal();

  ChildClassTwo c2 = ChildClassTwo();
  c2.ShowName();
}
