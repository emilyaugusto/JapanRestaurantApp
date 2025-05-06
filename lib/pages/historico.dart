import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/BottomNavBar.dart';
import 'package:flutter_sushi_app/components/food_tile.dart';
import 'package:flutter_sushi_app/components/my_button.dart';
import 'package:flutter_sushi_app/models/shop.dart';
import 'package:flutter_sushi_app/pages/food_details_page.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  int _selectedIndex = 1;
  final List<String> _routes = ['/menupage', '/historico', '/profile'];

  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.watch<Shop>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título da página
            Row(
              children: [
                const SizedBox(width: 12),
                Center(
                  child: Text(
                    'Histórico de Pedidos',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Lista de pedidos
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'lib/images/salmon_sushi.jpg', // certifique-se de ter essa imagem no seu projeto
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Sushi Salmon',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        'R\$78,00',
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // ação de pedir novamente
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Pedir novamente',
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                );
              },
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
