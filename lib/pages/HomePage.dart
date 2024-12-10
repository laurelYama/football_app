import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:football_app/pages/Matches.dart';
import 'package:football_app/pages/ProfilePage.dart';
import 'package:football_app/pages/SearchPage.dart';
import 'package:football_app/pages/Today_screen.dart';
import 'package:football_app/pages/TrendingNews.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  // Liste des pages à afficher lorsque l'utilisateur navigue
  final List<Widget> _pages = [
    const Center(child: Text('Home')),
    const Trendingnews(),
    const MatchScreen(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: _currentIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ryan Firmansyah',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'roboto',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tue, 21 November 2024',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'roboto',
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            IconsaxPlusLinear.search_normal_1,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IconButton(
                              icon: const Icon(
                                IconsaxPlusLinear.notification,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                            Positioned(
                              right: 10,
                              top: 8,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // TabBar with initial index
                  DefaultTabController(
                    length: 4,
                    initialIndex: 1,
                    child: Expanded(
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
                            buttonMargin:
                                const EdgeInsets.symmetric(horizontal: 10),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 17),
                            tabs: const [
                              Tab(text: 'Yesterday'),
                              Tab(text: 'Today'),
                              Tab(text: 'Tomorrow'),
                              Tab(text: 'Wed, 12 Dec'),
                            ],
                          ),
                          const Expanded(
                            child: TabBarView(
                              children: [
                                Center(child: Text('Yesterday')),
                                Today(),
                                Center(child: Text('Tomorrow')),
                                Center(child: Text('Wed, 12 Dec')),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : _pages[_currentIndex], // Affiche la page sélectionnée pour les autres onglets
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex, // L'index actuel de la page sélectionnée
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Met à jour la page lorsque l'index change
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.home_1),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.note_2),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.cup),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.search_normal_1),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(IconsaxPlusLinear.user),
              label: 'Profile',
            ),
          ],
          selectedItemColor: const Color(0xFF422f96),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
