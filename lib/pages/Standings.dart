import 'package:flutter/material.dart';

class Standings extends StatefulWidget {
  const Standings({super.key});

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  String selectedFilter = 'All'; // Filtre par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Barre des filtres (Tous, Domicile, Extérieur, Trier)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Filtres (Tous, Domicile, Extérieur)
                Row(
                  children: ['All', 'Home', 'Away'].map((filter) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: selectedFilter == filter
                              ? const Color(0xFF422f96)
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: selectedFilter == filter ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // Menu Trier
                PopupMenuButton<String>(
                  icon: const Icon(Icons.sort),
                  onSelected: (value) {
                    // Action pour le tri
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: 'Points', child: Text('Points')),
                    const PopupMenuItem(value: 'Victoires', child: Text('Victoires')),
                    const PopupMenuItem(value: 'Défaites', child: Text('Défaites')),
                  ],
                ),
              ],
            ),
          ),

          // Tableau des classements
          Expanded(
            child: ListView(
              children: [
                // En-tête du tableau
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  color: Colors.grey[100],
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Team',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        
                      ),
                      Text(
                        'Point',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Won',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Lose',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 40),
                      Text(
                        'Draw',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // Liste des équipes avec logos
                ...[
                  {
                    'rank': 1,
                    'team': 'Chelsea',
                    'logo': 'images/Logo_Chelsea.svg.png',
                    'points': 40,
                    'won': 13,
                    'lose': 1,
                    'draw': 1
                  },
                  {
                    'rank': 2,
                    'team': 'Arsenal',
                    'logo': 'images/Logo_Arsenal_FC_2002.svg.png',
                    'points': 38,
                    'won': 12,
                    'lose': 2,
                    'draw': 2
                  },
                  {
                    'rank': 3,
                    'team': 'MU',
                    'logo': 'images/Logo_Manchester_United_FC.svg.png',
                    'points': 34,
                    'won': 11,
                    'lose': 3,
                    'draw': 3
                  },
                  {
                    'rank': 4,
                    'team': 'Tottenham',
                    'logo': 'images/Logo_Tottenham_Hotspur_Football_Club_2024.svg.png',
                    'points': 28,
                    'won': 10,
                    'lose': 5,
                    'draw': 1
                  },
                  {
                    'rank': 5,
                    'team': 'Liverpool',
                    'logo': 'images/liverpool.png',
                    'points': 27,
                    'won': 8,
                    'lose': 5,
                    'draw': 4
                  },
                  {
                    'rank': 6,
                    'team': 'PSG',
                    'logo': 'images/psg.png',
                    'points': 26,
                    'won': 8,
                    'lose': 6,
                    'draw': 6
                  },
                  {
                    'rank': 7,
                    'team': 'Newcastle',
                    'logo': 'images/Logo_Newcastle_United.svg.png',
                    'points': 25,
                    'won': 7,
                    'lose': 8,
                    'draw': 7
                  },
                  {
                    'rank': 8,
                    'team': 'MC',
                    'logo': 'images/mc.png',
                    'points': 24,
                    'won': 7,
                    'lose': 9,
                    'draw': 8
                  },
                ].map((team) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${team['rank']}'),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Row(
                            children: [
                              // Logo de l'équipe
                              Image.asset(
                                team['logo'] as String, // Conversion explicite en String
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                team['team'] as String, // Conversion explicite en String
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        // Ajouter de l'espace entre les colonnes avec SizedBox
                        const SizedBox(width: 60), 
                        Text('${team['points']}'),
                        const SizedBox(width: 60), 
                        Text('${team['won']}'),
                        const SizedBox(width: 60), 
                        Text('${team['lose']}'),
                        const SizedBox(width: 60), 
                        Text('${team['draw']}'),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
