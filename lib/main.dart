import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());  // Le point d'entrée de l'application Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // La méthode build retourne une application MaterialApp, qui est la structure principale de l'app.
    return MaterialApp(
      title: 'Transport+',  // Titre de l'application
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),  // Thème de l'application basé sur une couleur verte
        useMaterial3: true,  // Utilisation de Material3 (nouvelle version des widgets Material Design)
      ),
      home: const MyHomePage(),  // Page d'accueil de l'application
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();  // Crée l'état pour la page d'accueil
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;  // Index de la page actuellement sélectionnée (par défaut, 0 pour "Accueil")

  static const List<String> _titles = [
    'Accueil',  // Titre pour l'onglet "Accueil"
    'Activités',  // Titre pour l'onglet "Activités"
    'Profil',  // Titre pour l'onglet "Profil"
  ];

  // Liste des pages associées à chaque onglet du menu en bas
  static final List<Widget> _pages = [
    const AccueilPage(),  // Page d'accueil
    const ActivitesPage(),  // Page des activités
    const ProfilPage(),  // Page du profil
  ];

  // Fonction déclenchée quand un élément du BottomNavigationBar est sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Met à jour l'index de la page sélectionnée
    });
  }

  @override
  Widget build(BuildContext context) {
    // Construction de l'interface principale de la page d'accueil
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),  // Affiche le titre de l'onglet actif
        backgroundColor: Colors.green,  // Couleur verte pour l'AppBar
        centerTitle: true,  // Centre le titre dans l'AppBar
      ),
      body: _pages[_selectedIndex],  // Affiche la page correspondant à l'onglet sélectionné
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),  // Icône de maison pour "Accueil"
            label: 'Accueil',  // Texte du bouton "Accueil"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),  // Icône de liste pour "Activités"
            label: 'Activités',  // Texte du bouton "Activités"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),  // Icône de profil pour "Profil"
            label: 'Profil',  // Texte du bouton "Profil"
          ),
        ],
        currentIndex: _selectedIndex,  // Indique l'onglet actuellement sélectionné
        selectedItemColor: Colors.green,  // Couleur verte pour l'icône sélectionnée
        onTap: _onItemTapped,  // Gère le changement d'onglet quand un utilisateur clique sur un élément
      ),
    );
  }
}

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Page d'accueil de l'application, affichant plusieurs cartes d'information
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),  // Ajout d'un padding autour du contenu
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,  // Centrer le contenu horizontalement
        children: [
          // Ligne pour afficher le nom et le numéro gozem
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Espacer les éléments aux extrémités
            children: const [
              Text('ADOYI A.'),  // Nom de l'utilisateur
              Text('numero gozem'),  // Numéro Gozem de l'utilisateur
            ],
          ),
          const SizedBox(height: 16),  // Ajout d'un espace de 16 pixels
          
          // Deux cartes pour "Non affecté" et "Semaine"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.directions_car_filled,  // Icône de voiture
                text1: 'Non affecté',  // Texte principal
                text2: '',  // Texte secondaire (vide ici)
                color: Colors.yellow[200],  // Couleur jaune clair
              ),
              _buildCard(
                icon: Icons.calendar_today,  // Icône de calendrier
                text1: 'Semaine',  // Texte principal
                text2: '52',  // Texte secondaire indiquant le numéro de la semaine
                color: Colors.yellow[200],  // Couleur jaune clair
              ),
            ],
          ),
          const SizedBox(height: 16),  // Espace entre les éléments
          
          // Deux cartes pour "Gains" et "Momo"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.wallet,  // Icône de portefeuille
                text1: 'Gains',  // Texte principal
                text2: '0 FCFA',  // Texte secondaire indiquant le montant des gains
                color: Colors.green[100],  // Couleur verte claire
              ),
              _buildCard(
                icon: Icons.account_balance_wallet,  // Icône de portefeuille mobile
                text1: 'Momo',  // Texte principal
                text2: '0 FCFA',  // Texte secondaire indiquant le solde mobile money
                color: Colors.yellow[200],  // Couleur jaune clair
              ),
            ],
          ),
          const SizedBox(height: 16),  // Espace entre les éléments
          
          // Deux cartes pour "Distance" et "Montant"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.speed,  // Icône de vitesse
                text1: 'Distance',  // Texte principal
                text2: '0 km',  // Texte secondaire indiquant la distance
                color: Colors.orange[100],  // Couleur orange claire
              ),
              _buildCard(
                icon: Icons.oil_barrel,  // Icône de carburant
                text1: 'Montant',  // Texte principal
                text2: '0 FCFA',  // Texte secondaire indiquant le montant de carburant
                color: Colors.yellow[200],  // Couleur jaune clair
              ),
            ],
          ),
          const SizedBox(height: 16),  // Espace entre les éléments
          
          // Deux cartes pour "Performance" et "Objectif"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCard(
                icon: Icons.show_chart,  // Icône de performance (graphique)
                text1: 'Performance',  // Texte principal
                text2: '0%',  // Texte secondaire indiquant la performance
                color: Colors.blue[100],  // Couleur bleue claire
              ),
              _buildCard(
                icon: Icons.flag,  // Icône de drapeau (objectif)
                text1: 'Objectif',  // Texte principal
                text2: '0%',  // Texte secondaire indiquant l'objectif
                color: Colors.grey[200],  // Couleur grise claire
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Méthode pour générer une carte avec une icône, un texte principal, un texte secondaire, et une couleur de fond
  Widget _buildCard({required IconData icon, required String text1, required String text2, required Color? color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),  // Ajout de marge horizontale
        padding: const EdgeInsets.all(16),  // Ajout de padding interne
        decoration: BoxDecoration(
          color: color,  // Couleur de fond de la carte
          borderRadius: BorderRadius.circular(10),  // Bords arrondis
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // Centrer les éléments verticalement
          children: [
            Icon(icon, size: 50),  // Afficher l'icône avec une taille de 50 pixels
            Text(text1, style: const TextStyle(fontSize: 18)),  // Texte principal avec taille 18
            if (text2.isNotEmpty) ...[  // Si le texte secondaire n'est pas vide, l'afficher
              const SizedBox(height: 8),  // Espace entre les textes
              Text(text2, style: const TextStyle(fontSize: 16)),  // Texte secondaire avec taille 16
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
    // Liste des activités sous forme de texte
    final List<String> activites = [
      "Louer une voiture",
      "Réserver une voiture",
      "Mettre en location une voiture",
      "Fixer les lieux de déplacement",
      "Fixer les emplacements de départ et d'arrivée"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voici la liste des activités'),  // Titre de la page
      ),
      // Utilisation de ListView.builder pour construire la liste
     body: ListView.builder(
  itemCount: activites.length,  // Le nombre total d'activités
  itemBuilder: (context, index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,  // Ajoute une ombre pour l'effet d'élévation
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: ListTile(
        leading: Icon(
          Icons.check_circle,
          color: Colors.blueAccent,  // Change la couleur de l'icône
          size: 30.0,  // Augmente la taille de l'icône
        ),
        title: Text(
          activites[index],
          style: TextStyle(
            fontSize: 18.0,  // Taille du texte augmentée
            fontWeight: FontWeight.bold,  // Texte en gras pour un meilleur contraste
            color: Colors.black87,  // Couleur légèrement atténuée pour l'élégance
          ),
        ),
        subtitle: Text(
          'Activité #${index + 1}',  // Ajoute un sous-titre avec un numéro d'ordre
          style: TextStyle(
            color: Colors.grey[600],  // Couleur du sous-titre discrète
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),  // Icône à droite pour indication visuelle
        onTap: () {
          // Lorsqu'on tape sur l'activité, afficher un SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Vous avez sélectionné: ${activites[index]}'),
              behavior: SnackBarBehavior.floating,  // Affiche le SnackBar au-dessus du contenu
              backgroundColor: Colors.blueAccent,  // Change la couleur du SnackBar
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


// Page de profil (vide pour le moment)


class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Mr Pascal"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo de profil avec icône caméra
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images.jpeg'), // Image de profil
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.camera_alt, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Liste des options de menu
            Expanded(
              child: ListView(
                children: [
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


 
