class Base {
  int num = 12;
  String Name = "Base Class";

  void OrigMethod() {

  }
}

class Child extends Base {
  void Modify() {
    this.Name = "Child Class";
  }

  void Check() {
    print(this.Name);
  }
}

void main(List<String> args) {
  Child c = Child();
  print(c.Name);
  c.Modify();
  c.Check();
  c.OrigMethod();
  
}
