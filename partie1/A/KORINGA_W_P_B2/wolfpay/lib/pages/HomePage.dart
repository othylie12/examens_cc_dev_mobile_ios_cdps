import 'package:flutter/material.dart';

CardOverviewPageclass HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, wolf!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const QuickSendWidget(),
            const SizedBox(height: 20),
            const OverviewWidget(),
            const SizedBox(height: 20),
            const SubscriptionsWidget(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/password');
              },
              child: const Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickSendWidget extends StatelessWidget {
  const QuickSendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Send',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              CircleAvatar(child: Image.assets("assets/images/avat.png")),
              CircleAvatar(child: Image.assets("assets/images/avat.png")),
             CircleAvatar(child: Image.assets("assets/images/avat.png")),
              CircleAvatar(child: Image.assets("assets/images/avat.png")),
            CircleAvatar(child: Image.assets("assets/images/avat.png")),
          CircleAvatar(child: Image.assets("assets/images/avat.png")),
             CircleAvatar(child: Image.assets("assets/images/avat.png")),
            ],
          ),
        ],
      ),
    );
  }
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Graphique placeholder
          Container(
            height: 150,
            color: Colors.grey.shade800,
            child: const Center(child: Text('Graph Placeholder')),
          ),
        ],
      ),
    );
  }
}

class SubscriptionsWidget extends StatelessWidget {
  const SubscriptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Subscriptions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Subscriptions list placeholder
          Container(
            height: 50,
            color: Colors.grey.shade800,
            child: const Center(child: Text('Subscriptions Placeholder')),
          ),
        ],
      ),
    );
  }
}
