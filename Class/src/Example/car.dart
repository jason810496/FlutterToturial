class Car {
  int Price;
  String Owner;
  Car(this.Price, this.Owner);
}

class Tesla extends Car {
  bool? electric;
  Tesla(int pri, String own, this.electric) : super(pri, own);
}

class Model3 extends Tesla {
  
}
