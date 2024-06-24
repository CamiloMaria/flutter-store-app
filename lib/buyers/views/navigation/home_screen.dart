import 'package:flutter/material.dart';
import 'package:project/shared/widget/banner_widget.dart';
import 'package:project/shared/widget/product_carrusel_widget.dart';
import 'package:project/shared/widget/product_text_widget.dart';
import 'package:project/shared/widget/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SearchWidget(),
            BannerWidget(),
            SizedBox(height: 20),
            Text('Welcome to the Home Page'),
            SizedBox(height: 20),
            ProductTextWidget(text: "Todos los productos"),
            ProductCarouselWidget()
          ],
        ),
      ),
    );
  }
}
