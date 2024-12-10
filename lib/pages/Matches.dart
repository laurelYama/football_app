import 'dart:async'; // Pour utiliser le Timer
import 'package:flutter/material.dart';
import 'package:football_app/pages/Standings.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  // Variables pour le chronomètre
  int _seconds = 2100;
  late Timer _timer;

  // Démarrer le timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  // Convertir les secondes en minutes et secondes
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _startTimer(); // Démarrer le timer lors de l'initialisation
  }

  @override
  void dispose() {
    _timer.cancel(); // Arrêter le timer lorsqu'on quitte l'écran
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Nombre d'onglets
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: const Color(0xFF422f96),
        body: Column(
          children: [
            // AppBar section with background image
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pngegg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back and actions buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.black),
                            onPressed: () {},
                          ),
                        ),
                        // Save and More buttons
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.save, color: Colors.black),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(Icons.more_horiz, color: Colors.black),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Title or score section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Real Madrid
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF0F0F0),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                'images/Logo_Real_Madrid.svg.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Real Madrid',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // Score
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '7',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  _formatTime(_seconds),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  '0', // Example score for Barcelona
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'First Match',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        // Barcelona
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF0F0F0),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                'images/Logo_FC_Barcelona.svg.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Barcelona',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // TabBar Section
            Container(
              color: const Color(0xFF422f96), // Background color for TabBar
              child: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                indicatorColor: Colors.white,
                indicatorWeight: 3.0,
                tabs: [
                  Tab(text: 'Details'),
                  Tab(text: 'Standings'),
                  Tab(text: 'News'),
                  Tab(text: 'Season'),
                  Tab(text: 'Statistics'),
                ],
              ),
            ),

            // TabBarView content
            const Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('Details Content', style: TextStyle(color: Colors.white))),
                  Standings(),
                  Center(child: Text('News Content', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Season Content', style: TextStyle(color: Colors.white))),
                  Center(child: Text('Statistics Content', style: TextStyle(color: Colors.white))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
