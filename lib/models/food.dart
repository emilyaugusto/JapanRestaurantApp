class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  String category;
  String descricao; // Novo campo

  Food({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.category,
    required this.descricao, // Incluído no construtor
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _category => category; // Getter para category
}
