import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/components/BottomNavBar.dart';
import 'package:flutter_sushi_app/components/food_tile.dart';
import 'package:flutter_sushi_app/components/my_button.dart';
import 'package:flutter_sushi_app/models/shop.dart';
import 'package:flutter_sushi_app/pages/food_details_page.dart';
import 'package:flutter_sushi_app/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;
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
            // Avatar e nome
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: primaryColor,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 12),
                Text(
                  'Perfil',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Lista de opções
            buildProfileOption(Icons.language, 'Idioma',
                trailingText: 'Português'),
            buildProfileOption(Icons.notifications_none, 'Notificações'),
            buildProfileOption(Icons.favorite_border, 'Favoritos'),
            buildProfileOption(Icons.credit_card, 'Pagamentos'),
            buildProfileOption(Icons.card_giftcard, 'Cupons'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget buildProfileOption(IconData icon, String title,
      {String? trailingText}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingText != null)
                Text(
                  trailingText,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          onTap: () {
            // Adicione ações específicas aqui, se necessário
          },
        ),
        const Divider(
          color: Color(0xffeaeaea),
        ),
      ],
    );
  }
}
