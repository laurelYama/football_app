import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  // Variables pour le chronomètre
  int _seconds = 1978;
  late Timer _timer;
  

  // Démarrer le timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
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

  // Convertir les secondes en minutes et secondes
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Column(
            children: [
              // Gradient Container
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF422f96), Color(0xFF9575CD)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    
                    children: [
                      // "Live Now" Header
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          
                          SizedBox(width: 10),
                          Text(
                            'Live Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // White Container for Match Details
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              // Match Title and Timer
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Barcelona vs Real Madrid (El Clàsico)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF422f96),
                                    ),
                                  ),
                                  Text(
                                    _formatTime(_seconds),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF422f96),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Teams and Score
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Score
                                  const Column(
                                    children: [
                                      Text(
                                        '0 - 0',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF422f96),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '1st Half Match',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF422f96),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Watch Live Button
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    // Action for button
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFF422f96),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                  ),
                                  child: const Text(
                                    'Watch Live',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // League Info and Reminder
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                      
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'League Premier',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF422f96),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF0F0F0),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xFF422f96),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),

             Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Premier match
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('images/pngegg.png'), // Image de l'arrière-plan
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 233, 233).withOpacity(0.9), // Couche semi-transparente
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Chelsea
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      'images/Logo_Chelsea.svg.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Chelsea',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            // Match Time and Reminder
                            Column(
                              children: [
                                const Text(
                                  '01:00 AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(IconsaxPlusBold.notification, size: 20, color: Color(0xFF422f96)),
                                      SizedBox(width: 5),
                                      Text(
                                        'Reminder',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'roboto',
                                          color: Color(0xFF422f96),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Tottenham Hotspur
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      'images/Logo_Arsenal_FC_2002.svg.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Arsenal',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
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
              ),
              const SizedBox(height: 10),
              // Deuxième match
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('images/pngegg.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 234, 233, 233).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Manchester United
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      'images/Logo_Manchester_united_FC.svg.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Manchester\n United',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            // Match Time and Reminder
                            Column(
                              children: [
                                const Text(
                                  '11:00 AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "roboto",
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(IconsaxPlusBold.notification, size: 20, color: Color(0xFF422f96)),
                                      SizedBox(width: 5),
                                      Text(
                                        'Reminder',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF422f96),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Tottenham Hotspur
                            Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Image.asset(
                                      'images/Logo_Tottenham_Hotspur_Football_Club_2024.svg.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Tottenham\n Hotspur',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
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
              ),
            ],
          ),
              ),
              const SizedBox(height: 10),
              // League Info and Reminder
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                      
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending News',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF422f96),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF0F0F0),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xFF422f96),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
