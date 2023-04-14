import 'package:flutter/material.dart';
import 'package:sos_restau/categories.dart';
import 'package:sos_restau/fruits.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            SizedBox(width: 8),
            Text('Grocery Delivery'),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/1.jpg',
            ),
          ),
          Text('John Doe'),
          SizedBox(width: 16),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Catégories',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AllCategoriesPage()),
                            );
                          },
                          child: const Text('Voir Tout',
                              style: TextStyle(color: Colors.blue),
                              textAlign: TextAlign.end),
                        )),
                  ],
                )),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _CategoryCard(
                    image: 'assets/images/fruits.jpg',
                    title: 'Fruits',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/veggies.jpg',
                    title: 'Veggies',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/bread.jpg',
                    title: 'Bread',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/drinks.jpg',
                    title: 'Drinks',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/grocery.jpg',
                    title: 'Grocery',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/meat.jpg',
                    title: 'Meat',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/dairy.jpg',
                    title: 'Dairy',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                  _CategoryCard(
                    image: 'assets/images/hygiene.jpg',
                    title: 'Hygiene',
                    onTap: () => _goToFruitsCategoryPage(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange.shade50,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

void _goToFruitsCategoryPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FruitsCategoryPage()),
  );
}

class _CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const _CategoryCard({
    Key? key,
    required this.image,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ));
  }
}
