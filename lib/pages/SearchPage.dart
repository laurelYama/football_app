import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Liste des articles disponibles
  final List<Map<String, String>> articles = [
    {
      'title': 'Match Highlights',
      'headline': 'North London Derby: Arsenal Triumphs Over Tottenham',
      'description': 'Arsenal emerged victorious in an intense game...',
      'image': 'images/american-football.jpg',
    },
    {
      'title': 'Match Highlights',
      'headline': 'City Reigns Supreme in Premier League',
      'description': 'Manchester City triumphed in the Premier League...',
      'image': 'images/soccer-ball.jpg',
    },
    {
      'title': 'Top News',
      'headline': 'Real Madrid Secures La Liga Lead',
      'description': 'Real Madrid edges past rivals in a thrilling encounter...',
      'image': 'images/portrait-athlete.jpg',
    },
    {
      'title': 'Breaking News',
      'headline': 'Manchester United Struggles Continue',
      'description': 'Another defeat raises questions about their form...',
      'image': 'images/fan-is-disappointed.jpg',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Liste des articles filtrés selon la recherche
    final List<Map<String, String>> filteredArticles = articles
        .where((article) =>
            article['title']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            article['headline']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            article['description']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
        backgroundColor: const Color(0xFF422f96),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Champ de recherche
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Color(0xFF422f96)),
                hintText: 'Rechercher un article...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Liste des résultats filtrés
            Expanded(
              child: filteredArticles.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredArticles.length,
                      itemBuilder: (context, index) {
                        final article = filteredArticles[index];
                        return _buildArticleCard(article);
                      },
                    )
                  : const Center(
                      child: Text(
                        'Aucun résultat trouvé.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleCard(Map<String, String> article) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            article['image'] ?? '',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          article['headline'] ?? '',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          article['description'] ?? '',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          // Naviguer vers la page de détails de l'article
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlePage2(
                title: article['title']!,
                headline: article['headline']!,
                description: article['description']!,
                imageUrl: article['image']!,
              ),
            ),
          );
        },
      ),
    );
  }
}

// Exemple de page d'article à utiliser
class ArticlePage2 extends StatelessWidget {
  final String title;
  final String headline;
  final String description;
  final String imageUrl;

  const ArticlePage2({
    Key? key,
    required this.title,
    required this.headline,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF422f96),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(
              headline,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
