class Parent {
  Method1() {
    print("Method from Parent");
  }
  Method2(){}
}

class Child extends Parent{

  @override
  Method1() {
    // TODO: implement Method1
    return super.Method1();
  }

  @override
  Method2() {
    // TODO: implement Method2
    return super.Method2();
  }
}


void main(List<String> args) {
  
}