import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:project/shared/model/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel producto;

  const ProductDetailsScreen({Key? key, required this.producto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    producto.imageUrl[index],
                    fit: BoxFit.cover,
                  );
                },
                itemCount: producto.imageUrl.length,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Descripción: ${producto.description}',
                      style: TextStyle(fontSize: 16)),
                  Text('Precio: \$${producto.price}',
                      style: TextStyle(fontSize: 16, color: Colors.green)),
                  Text('Descuento: ${producto.discount}%',
                      style: TextStyle(fontSize: 16)),
                  Text('Cantidad disponible: ${producto.quantity}',
                      style: TextStyle(fontSize: 16)),
                  Text('Categoría: ${producto.category}',
                      style: TextStyle(fontSize: 16)),
                  Text('Tallas disponibles: ${producto.sizes.join(", ")}',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar lógica para añadir al carrito
              },
              child: Text('Añadir al carrito'),
            )
          ],
        ),
      ),
    );
  }
}
