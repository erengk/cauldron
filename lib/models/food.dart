class Food{
  final String name;
  final String imagePath;
  final String price;


  Food({
    required this.name,
    required this.imagePath,
    required this.price,
  });

  String get _name => name;
  String get _imagePath => imagePath;
  String get _price => price;
}