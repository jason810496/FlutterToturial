class Points2D {
  int? x;
  int? y;
  Points2D(int px, int py) {
    this.x = px;
    this.y = py;
  }
}

class Points3D extends Points2D {
  int? z;
  Points3D(int px, int py, this.z) : super(px, py);
}

class 