class RevCon {
  int? data0;
  String? data1;

  RevCon(int d0, String d1) {
    this.data0 = d0;
    this.data1 = d1;
  }
}

class SimpleCon {
  int? data0;
  String? data1;

  SimpleCon(this.data0, this.data1);
}

class ConDefualtVal {
  int? data0;
  String? data1;

  ConDefualtVal( {this.data0 = 123,this.data1 = "contructor with default value"} );
}
