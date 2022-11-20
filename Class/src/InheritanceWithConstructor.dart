
class ParentClass {
  ParentClass() {
    print("This is Parent Constructor");
  }
}

class ChildClass extends ParentClass {
  ChildClass() {
    print("This is Child Constructor");
  }
}






class ParentClassWithProperties {
  String? status;
  ParentClassWithProperties() {
    this.status = "Parent";
    print("This is Parent Constructor");
    print("Current Value : ${this.status}");
  }
}

class ChildClassWithProperties extends ParentClassWithProperties {
  ChildClassWithProperties() {
    this.status = "Child";
    print("This is Child Constructor");
    print("Current Value : ${this.status}");
  }
}

class ParentPara {
  String Name;
  int Value;
  ParentPara(this.Name, this.Value);
}

class ChildPara extends ParentPara {
  double? Rate;
  ChildPara(String nm, int val, this.Rate) : super(nm, val);
}

void main(List<String> args) {
  print("\n");
  ChildClass test = ChildClass();
  
  // print("-------------");
  // ChildClassWithProperties test2 = ChildClassWithProperties();
}
