import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());  // Le point d'entrée de l'application Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport+',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;  // Index de la page sélectionnée

  final PageController _pageController = PageController();  // Pour contrôler le swipe entre les pages

  static const List<String> _titles = [
    'Accueil',
    'Activités',
    'Profil',
  ];

  static final List<Widget> _pages = [
    const AccueilPage(),
    const ActivitesPage(),
    const ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);  // Naviguer à la page correspondante en tapant sur le BottomNavigationBar
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;  // Met à jour l'onglet sélectionné quand on fait un swipe
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,  // Gère le changement de page par swipe
        children: _pages,  // Affiche les pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Activités',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,  // Gère le changement de page par le BottomNavigationBar
      ),
    );
  }
}

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('ADOYI A.'),
              Text('numero gozem'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.directions_car_filled,
                text1: 'Non affecté',
                text2: '',
                color: Colors.yellow[200],
              ),
              _buildCard(
                icon: Icons.calendar_today,
                text1: 'Semaine',
                text2: '52',
                color: Colors.yellow[200],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.wallet,
                text1: 'Gains',
                text2: '0 FCFA',
                color: Colors.green[100],
              ),
              _buildCard(
                icon: Icons.account_balance_wallet,
                text1: 'Momo',
                text2: '0 FCFA',
                color: Colors.yellow[200],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.speed,
                text1: 'Distance',
                text2: '0 km',
                color: Colors.orange[100],
              ),
              _buildCard(
                icon: Icons.oil_barrel,
                text1: 'Montant',
                text2: '0 FCFA',
                color: Colors.yellow[200],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.show_chart,
                text1: 'Performance',
                text2: '0%',
                color: Colors.blue[100],
              ),
              _buildCard(
                icon: Icons.flag,
                text1: 'Objectif',
                text2: '0%',
                color: Colors.grey[200],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String text1, required String text2, required Color? color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            Text(text1, style: const TextStyle(fontSize: 18)),
            if (text2.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(text2, style: const TextStyle(fontSize: 16)),
            ],
          ],
        ),
      ),
    );
  }
}

class ActivitesPage extends StatelessWidget {
  const ActivitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> activites = [
      "Louer une voiture",
      "Réserver une voiture",
      "Mettre en location une voiture",
      "Fixer les lieux de déplacement",
      "Fixer les emplacements de départ et d'arrivée"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voici la liste des activités'),
      ),
      body: ListView.builder(
        itemCount: activites.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            elevation: 4.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.blueAccent,
                size: 30.0,
              ),
              title: Text(
                activites[index],
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text('Activité #${index + 1}', style: TextStyle(color: Colors.grey[600])),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Vous avez sélectionné: ${activites[index]}'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blueAccent,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Mr Pascal")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images.jpeg'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.camera_alt, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("My Account"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text("Notifications"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                   ListTile(
                    leading: Icon(Icons.help),
                    title: Text("Help Center"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log Out"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
