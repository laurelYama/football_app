import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
        backgroundColor: const Color(0xFF422f96),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Photo de profil
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        ),
              ),
            ),
            const SizedBox(height: 15),
            // Nom de l'utilisateur
            const Text(
              'Ryan Firmansyah',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            // Email de l'utilisateur
            const Text(
              'ryanfirmansyah@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Informations utilisateur
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informations personnelles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF422f96),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildInfoRow(Icons.phone, 'Téléphone', '+241 123 456 789'),
                  _buildInfoRow(Icons.calendar_today, 'Date de naissance', '15 Août 1995'),
                  _buildInfoRow(Icons.location_on, 'Adresse', 'Libreville, Gabon'),
                  const SizedBox(height: 30),
                  // Boutons d'action
                  ElevatedButton.icon(
                    onPressed: () {
                      // Logique pour modifier le profil
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Modifier le profil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF422f96),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Logique pour déconnexion
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Déconnexion'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF422f96)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
