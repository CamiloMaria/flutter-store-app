import 'package:flutter/material.dart';
import 'package:project/buyers/views/navigation/widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SearchWidget(),
            Text('Home Navigation Page'),
            SizedBox(height: 20),
            Text('Welcome to the Home Page'),
          ],
        ),
      ),
    );
  }
}
