import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final games = [
    {'name': 'Aviator', 'icon': Icons.flight, 'route': '/aviator', 'color': Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Casino App')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16,
        ),
        itemCount: games.length,
        itemBuilder: (ctx, i) {
          final game = games[i];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, game['route'] as String),
            child: Card(
              color: (game['color'] as Color).withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(game['icon'] as IconData, size: 50, color: game['color'] as Color),
                  SizedBox(height: 10),
                  Text(game['name'] as String, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
