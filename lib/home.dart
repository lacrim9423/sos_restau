import 'package:flutter/material.dart';

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
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('Second Text',
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.end),
                    ),
                  ],
                )),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryCard(
                    image: 'assets/images/fruits.jpg',
                    title: 'Fruits',
                  ),
                  _CategoryCard(
                    image: 'assets/images/veggies.jpg',
                    title: 'Veggies',
                  ),
                  _CategoryCard(
                    image: 'assets/images/bread.jpg',
                    title: 'Bread',
                  ),
                  _CategoryCard(
                    image: 'assets/images/drinks.jpg',
                    title: 'Drinks',
                  ),
                  _CategoryCard(
                    image: 'assets/images/grocery.jpg',
                    title: 'Grocery',
                  ),
                  _CategoryCard(
                    image: 'assets/images/meat.jpg',
                    title: 'Meat',
                  ),
                  _CategoryCard(
                    image: 'assets/images/dairy.jpg',
                    title: 'Dairy',
                  ),
                  _CategoryCard(
                    image: 'assets/images/hygiene.jpg',
                    title: 'Hygiene',
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

class _CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  const _CategoryCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
