
class Points2D {
  double? x;
  double? y;
  Points2D(double px, double py) {
    this.x = px;
    this.y = py;
  }
}

class Points3D extends Points2D {
  double? z;
  Points3D(double px, double py, this.z) : super(px, py);
}
