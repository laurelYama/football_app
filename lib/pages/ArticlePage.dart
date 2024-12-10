import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final String author;
  final String publishDate;

  // Constructor to receive the article data
  const ArticlePage({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.publishDate, required String headline, required String description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF422f96),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with a rounded border
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              // Article Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF422f96),
                ),
              ),
              const SizedBox(height: 10),
              // Author and Publish Date
              Row(
                children: [
                  const Icon(Icons.person, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    author,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    publishDate,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Content of the article
              Text(
                content,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Reaction buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: Colors.blue),
                    onPressed: () {},
                  ),
                  Text('Like', style: TextStyle(fontSize: 16, color: Colors.blue)),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.comment, color: Colors.green),
                    onPressed: () {},
                  ),
                  Text('Comment', style: TextStyle(fontSize: 16, color: Colors.green)),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.orange),
                    onPressed: () {},
                  ),
                  Text('Share', style: TextStyle(fontSize: 16, color: Colors.orange)),
                ],
              ),
              const SizedBox(height: 20),
              // Divider
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 20),
              // Recommended Articles Section (optional)
              const Text(
                'Recommended Articles',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF422f96),
                ),
              ),
              const SizedBox(height: 10),
              // Recommended article list (can be dynamic based on actual data)
              _recommendedArticleCard('The Best Football Players of 2024', 'images/Vinícius.jpeg'),
              _recommendedArticleCard('Top 5 Memorable Matches in History', 'images/team.jpg'),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to represent each recommended article
  Widget _recommendedArticleCard(String title, String imageUrl) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imageUrl, width: 70, height: 70, fit: BoxFit.cover),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF422f96),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          // Navigate to the full article (you can add navigation to another ArticlePage here)
        },
      ),
    );
  }
}
