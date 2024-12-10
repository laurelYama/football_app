import 'package:flutter/material.dart';
import 'package:football_app/pages/ArticlePage2.dart';

class ForYou extends StatefulWidget {
  const ForYou({super.key});

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  final List<Map<String, String>> articles = [
    {
      'title': 'Match Highlights',
      'headline': 'North London Derby: Arsenal\n Triumphs Over Tottenham',
      'description': 'Arsenal emerged victorious in an intense game...',
      'time': '45 Minutes Ago',
      'image': 'images/american-football.jpg',
    },
    {
      'title': 'Match Highlights',
      'headline': 'City Reigns Supreme in Premier League',
      'description': 'Manchester City triumphed in\n the Premier League...',
      'time': '1 Hour Ago',
      'image': 'images/soccer-ball.jpg',
    },
    {
      'title': 'Top News',
      'headline': 'Real Madrid Secures La Liga Lead',
      'description': 'Real Madrid edges past rivals in a thrilling encounter...',
      'time': '2 Hours Ago',
      'image': 'images/portrait-athlete.jpg',
    },
    {
      'title': 'Breaking News',
      'headline': 'Manchester United Struggles Continue',
      'description': 'Another defeat raises questions about their form...',
      'time': '3 Hours Ago',
      'image': 'images/fan-is-disappointed.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: articles.length,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemBuilder: (context, index) {
            final article = articles[index];
            return _buildDescriptionTile(article, context);
          },
        ),
      ),
    );
  }

  Widget _buildDescriptionTile(Map<String, String> article, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigation vers la page de l'article
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage2(
              title: article['title'] ?? '',
              headline: article['headline'] ?? '',
              description: article['description'] ?? '',
              imageUrl: article['image'] ?? '',
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image à gauche
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              article['image'] ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          // Texte à droite
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article['title'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF422f96),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  article['headline'] ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  article['description'] ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  article['time'] ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
