import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image principale
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            // En-tête
            Text(
              headline,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            // Description principale
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            // Section supplémentaire : contenu détaillé
            const Text(
              "Détails supplémentaires",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF422f96)),
            ),
            const SizedBox(height: 10),
            const Text(
              "Arsenal a démontré une performance impressionnante lors du North London Derby. Le match a captivé les spectateurs, mettant en lumière des moments clés comme les passes précises et les buts décisifs.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            // Liste de faits ou statistiques
            const Text(
              "Faits marquants :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const BulletList(items: [
              "Arsenal a marqué 3 buts en seconde mi-temps.",
              "Le gardien de but a réalisé 5 arrêts cruciaux.",
              "Les deux équipes ont eu une possession de balle presque égale.",
            ]),
            const SizedBox(height: 20),
            // Boutons d'action
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action à définir
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF422f96),
                  ),
                  child: const Text("Partager"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action à définir
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                  child: const Text("En savoir plus"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Section commentaires
            const Text(
              "Commentaires",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF422f96)),
            ),
            const SizedBox(height: 10),
            const CommentWidget(
              user: "Jean Dupont",
              comment: "Un match incroyable, surtout en deuxième mi-temps !",
              time: "Il y a 1 heure",
            ),
            const CommentWidget(
              user: "Marie Lemoine",
              comment: "Arsenal a vraiment mérité cette victoire. Bravo !",
              time: "Il y a 2 heures",
            ),
          ],
        ),
      ),
    );
  }
}

// Widget personnalisé pour afficher une liste avec des puces
class BulletList extends StatelessWidget {
  final List<String> items;

  const BulletList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "• ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// Widget pour les commentaires
class CommentWidget extends StatelessWidget {
  final String user;
  final String comment;
  final String time;

  const CommentWidget({
    Key? key,
    required this.user,
    required this.comment,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(
          comment,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const Divider(thickness: 1),
      ],
    );
  }
}
