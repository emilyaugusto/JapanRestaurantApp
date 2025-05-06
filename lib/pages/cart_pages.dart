import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/my_button.dart';
import 'package:flutter_sushi_app/models/food.dart';
import 'package:flutter_sushi_app/models/shop.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 2;

  final List<String> _routes = ['/menupage', '/cartpage', '/profilepage'];

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: tertiaryColor,
        appBar: AppBar(
          foregroundColor: const Color(0xff000000),
          elevation: 0,
          title: const Text("Carrinho"),
          centerTitle: true,
          backgroundColor: tertiaryColor,
        ),
        body: value.cart.isEmpty
            ? Container(
                padding: const EdgeInsets.all(25),
                alignment: Alignment.center,
                child: const Text(
                  'Sem itens no carrinho',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        final Food food = value.cart[index];
                        final String foodName = food.name;
                        final String foodPrice = food.price;
                        final String foodImage = food
                            .imagePath; // Supondo que você tenha o link ou caminho da imagem.

                        return Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          decoration: BoxDecoration(
                              color: Color(0xffececec),
                              borderRadius: BorderRadius.circular(8)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: Image.asset(
                              foodImage, // Caminho da imagem do produto
                              width:
                                  60, // Ajuste o tamanho da imagem conforme necessário
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              foodName,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              'R\$ $foodPrice',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () => value.removeCart(food),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(38),
                    child: MyButton(
                      text: "Continuar",
                      onTap: () {},
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
