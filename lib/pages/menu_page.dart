import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/BottomNavBar.dart'; // Importa a Navbar
import 'package:flutter_sushi_app/components/food_tile.dart';
import 'package:flutter_sushi_app/components/my_button.dart';
import 'package:flutter_sushi_app/models/shop.dart';
import 'package:flutter_sushi_app/pages/food_details_page.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;
  final List<String> _routes = ['/menupage', '/historico', '/profile'];

  // CATEGORIAS
  final List<String> categories = ['Combos', 'Quentes', 'Frios', 'Promos'];
  String selectedCategory = 'Combos';

  // PESQUISA
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  void navigateToFoodDetailsPage(int index, List filteredMenu) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: filteredMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<Shop>();

    // Filtra por categoria e termo de pesquisa
    final filteredFoodMenu = shop.foodMenu.where((food) {
      final matchesSearch =
          food.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory = food.category == selectedCategory;
      // Se estiver pesquisando, ignora a categoria
      return searchQuery.isNotEmpty ? matchesSearch : matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'lib/images/logo.png',
                height: 40,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá,',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                      Text(
                        'Bem-vindo!',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/cartpage');
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xffffffff)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xffd0d0d0)),
                  ),
                  hintText: "Pesquisar",
                ),
              ),
            ),

            // PROMO
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('30% off',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 24)),
                      Text('Em compra acima de \nR200,00',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 14)),
                      const SizedBox(height: 10),
                      Text('Somente hoje',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            // CATEGORIAS
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('Categorias menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? primaryColor : Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'lib/images/${category.toLowerCase()}.png',
                              height: 35,
                              width: 35,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.grey,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // FOOD MENU

            const SizedBox(height: 10),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredFoodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  onTap: () =>
                      navigateToFoodDetailsPage(index, filteredFoodMenu),
                  food: filteredFoodMenu[index],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
