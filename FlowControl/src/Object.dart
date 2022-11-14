void main(List<String> args) {
  Object a = 123;
  print(a);
  a = "www";
  print(a);

  print((a == "www" ? 123 : 456));
}
