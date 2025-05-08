import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: 'Combo Clássico',
      price: '29,90',
      imagePath: 'lib/images/cclassic.png',
      rating: '5',
      category: 'Combos',
      descricao: '8 peças variadas.',
    ),
    Food(
      name: 'Combo Especial',
      price: '49,90',
      imagePath: 'lib/images/cespecial.jpg',
      rating: '4.9',
      category: 'Combos',
      descricao: '12 peças com sushi e hot roll.',
    ),
    Food(
      name: 'Hot Roll (8 un.)',
      price: '24,90',
      imagePath: 'lib/images/htholl.jpg',
      rating: '4.9',
      category: 'Quentes',
      descricao:
          'Salmão com cream cheese empanado e crocante. Um dos favoritos entre os amantes de sushi quente.',
    ),
    Food(
        name: 'Guioza (4 un.)',
        price: '19,90',
        imagePath: 'lib/images/guioza.jpg',
        rating: '4.9',
        category: 'Quentes',
        descricao:
            'Pastelzinho japonês grelhado com recheio suculento de carne ou legumes.'),
    Food(
      name: 'Salmon Sushi',
      price: '78,00',
      imagePath: 'lib/images/salmon_sushi.jpg',
      rating: '4.9',
      category: 'Frios',
      descricao:
          'Sushi tradicional com arroz e fatias frescas de Salmon, enrolado em alga.',
    ),
    Food(
      name: 'Nigiri Salmão (4 un.)',
      price: '22,90',
      imagePath: 'lib/images/niguiri.jpg',
      rating: '4.8',
      category: 'Frios',
      descricao:
          'Fatia de salmão fresco sobre arroz temperado. Sabor puro e tradicional.',
    ),
    Food(
      name: 'Promo Dupla',
      price: '59,90',
      imagePath: 'lib/images/20pcs.jpg',
      rating: '4.8',
      category: 'Promos',
      descricao:
          '20 peças variadas com sushi e hot rolls. Ideal para dividir e aproveitar com alguém.',
    ),
    Food(
      name: 'Promo do Dia',
      price: '39,90',
      imagePath: 'lib/images/surpresa.jpg',
      rating: '4.8',
      category: 'Promos',
      descricao:
          'Combo surpresa com 12 peças selecionadas do dia, sempre fresquinhas.',
    ),
  ];

  List<Food> _cart = [];

  //method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food food, int qty) {
    for (var i = 0; i < qty; i++) {
      _cart.add(food);
    }
    notifyListeners();
  }

  void removeCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
