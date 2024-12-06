import 'package:flutter/material.dart';
import 'package:gamehunt/search/screens/list_gameentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color(0xFFF44336),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.games,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Text(
                  'GameHunt',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('News'),
            onTap: () {
              // Belum diimplementasi - Placeholder
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("News belum diimplementasi")),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Browse Games'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameEntryPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Wishlist'),
            onTap: () {
              // Belum diimplementasi - Placeholder
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Wishlist belum diimplementasi")),
              );
            },
          ),
        ],
      ),
    );
  }
}
