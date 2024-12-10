import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:football_app/pages/ArticlePage.dart';
import 'package:football_app/pages/Foryou.dart';

import 'package:iconsax_plus/iconsax_plus.dart';

class Trendingnews extends StatefulWidget {
  const Trendingnews({Key? key}) : super(key: key);

  @override
  _TrendingnewsState createState() => _TrendingnewsState();
}

class _TrendingnewsState extends State<Trendingnews> {
  int _currentIndex = 1;

  // Définir les données de l'article (exemple)
  final String articleTitle = 'Bayern Munich Defeats Dortmund in a Classic Bundesliga Clash';
  final String articleContent = '''
    In a thrilling match, Bayern Munich defeated Borussia Dortmund...
    (plus de détails sur l'article ici)
  ''';
  final String articleImageUrl = 'images/soccer-game.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // Row with icons on the top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(padding: EdgeInsets.all(10)),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Trending News',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'roboto',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.more_vert,
                          size: 30,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Latest News',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF422f96),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF422f96),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // Navigation vers l'article complet
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticlePage(
                                title: articleTitle,
                                content: articleContent,
                                imageUrl: articleImageUrl, author: '', publishDate: '', headline: '', description: '',
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            articleImageUrl,
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                                Icon(IconsaxPlusLinear.heart, size: 20),
                                SizedBox(width: 10),
                                Text("32", style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 10),
                                Icon(IconsaxPlusLinear.message, size: 20),
                                SizedBox(width: 10),
                                Text("14", style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 10),
                                Icon(IconsaxPlusLinear.share, size: 20),
                                Text("11", style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Match Highlights. 45 minutes ago',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                                            const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigation vers l'article complet
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticlePage(
                                title: articleTitle,
                                content: articleContent,
                                imageUrl: articleImageUrl,
                                author: '',
                                publishDate: '',
                                headline: '',
                                description: '',
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Bayern Munich Defeats Dortmund in a\n Classic Bundesliga Clash',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF422f96),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 5,
                child: Column(
                  children: [
                    ButtonsTabBar(
                      backgroundColor: const Color(0xFF422f96),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedBackgroundColor: Colors.white,
                      unselectedLabelStyle: const TextStyle(
                        color: Color(0xFF422f96),
                        fontWeight: FontWeight.bold,
                      ),
                      buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 17),
                      tabs: const [
                        Tab(text: 'For You'),
                        Tab(text: 'Latest'),
                        Tab(text: 'Transfer'),
                        Tab(text: 'Matches'),
                        Tab(text: 'Leagues'),
                      ],
                    ),
                    const SizedBox(
                      height: 500,
                      child: TabBarView(
                        children: [
                          ForYou(),
                          Center(child: Text('Latest')),
                          Center(child: Text('Transfer')),
                          Center(child: Text('Matches')),
                          Center(child: Text('Leagues')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
