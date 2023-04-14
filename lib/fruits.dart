import 'package:flutter/material.dart';

class FruitsCategoryPage extends StatelessWidget {
  final List<Fruit> fruits = [
    Fruit(
      name: 'Apple',
      reference: 'APL001',
      price: 1.99,
      available: true,
      image: 'assets/images/apple.jpg',
    ),
    Fruit(
      name: 'Banana',
      reference: 'BNN001',
      price: 0.99,
      available: false,
      image: 'assets/images/banana.jpg',
    ),
    Fruit(
      name: 'Grape',
      reference: 'GRP001',
      price: 2.99,
      available: true,
      image: 'assets/images/grape.jpg',
    ),
    Fruit(
      name: 'Kiwi',
      reference: 'KWI001',
      price: 1.49,
      available: true,
      image: 'assets/images/kiwi.jpg',
    ),
    Fruit(
      name: 'Mango',
      reference: 'MNG001',
      price: 3.99,
      available: true,
      image: 'assets/images/mango.jpg',
    ),
    Fruit(
      name: 'Orange',
      reference: 'ORG001',
      price: 1.29,
      available: true,
      image: 'assets/images/orange.jpg',
    ),
    Fruit(
      name: 'Pineapple',
      reference: 'PNP001',
      price: 4.99,
      available: true,
      image: 'assets/images/pineapple.jpg',
    ),
    Fruit(
      name: 'Strawberry',
      reference: 'STB001',
      price: 2.49,
      available: false,
      image: 'assets/images/strawberry.jpg',
    ),
    Fruit(
      name: 'Watermelon',
      reference: 'WML001',
      price: 5.99,
      available: true,
      image: 'assets/images/watermelon.jpg',
    ),
    Fruit(
      name: 'Peach',
      reference: 'PCH001',
      price: 1.79,
      available: true,
      image: 'assets/images/peach.jpg',
    ),
  ];

  FruitsCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fruits'),
        ),
        body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            final fruit = fruits[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        fruit.image,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fruit.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Ref: ${fruit.reference}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '\$${fruit.price}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            fruit.isAvailable ? 'Available' : 'Out of stock',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '0',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove),
                              )
                            ]),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text('Add to cart'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
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
            ]));
  }
}

class _FruitCard extends StatelessWidget {
  final Fruit fruit;

  const _FruitCard({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  fruit.image,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruit.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ref: ${fruit.reference}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${fruit.price}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      fruit.isAvailable ? 'In stock' : 'Out of stock',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color:
                                fruit.isAvailable ? Colors.green : Colors.red,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add to cart'),
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

class Fruit {
  final String name;
  final String reference;
  final double price;
  final bool available;
  final String image;

  Fruit({
    required this.name,
    required this.reference,
    required this.price,
    required this.available,
    required this.image,
  });

  get isAvailable => true;
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String reference;
  final double price;
  final bool isAvailable;

  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.reference,
    required this.price,
    required this.isAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Ref: $reference',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  '\$$price',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  isAvailable ? 'Available' : 'Out of stock',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 32,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 32,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.shopping_cart),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
