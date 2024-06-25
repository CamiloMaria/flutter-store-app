import 'package:flutter/material.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:project/shared/model/cart_model.dart';
import 'package:project/shared/model/favorite_model.dart';
import 'package:project/shared/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel producto;

  const ProductDetailsScreen({Key? key, required this.producto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.name),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<FavoriteModel>(context).isInFavorites(producto.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
                  Provider.of<FavoriteModel>(context).isInFavorites(producto.id)
                      ? Colors.red
                      : null,
            ),
            onPressed: () {
              final favoriteModel =
                  Provider.of<FavoriteModel>(context, listen: false);
              if (favoriteModel.isInFavorites(producto.id)) {
                favoriteModel.remove(producto.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Producto removido de favoritos')),
                );
              } else {
                favoriteModel.add(
                  FavoriteItem(
                    id: producto.id,
                    name: producto.name,
                    price: producto.price,
                    imageUrl: producto.imageUrl,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Producto añadido a favoritos')),
                );
              }
            },
          ),
        ],
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
                // Acceder al modelo del carrito usando Provider y añadir el producto
                Provider.of<CartModel>(context, listen: false).add(producto);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Producto añadido al carrito')),
                );
              },
              child: const Text('Añadir al carrito'),
            )
          ],
        ),
      ),
    );
  }
}
