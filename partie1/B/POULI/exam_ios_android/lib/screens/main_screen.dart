import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Material(
      color: Color.fromARGB(255, 32, 219, 210),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 32, 219, 210),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'A faire',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Image.asset('ressources/images/logo.png', width: 60),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              child: SizedBox(
                width: size.width,
                height: size.height - 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(36),
                  ),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text("Tâche ${index + 1}"),
                            trailing: IconButton(
                              icon: Icon(Icons.circle_outlined),
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
