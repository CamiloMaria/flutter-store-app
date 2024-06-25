import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_swipe/flutter_swipe.dart';
import 'package:project/shared/model/product_model.dart';
import 'package:project/shared/widget/product_details_widget.dart';

class ProductCarouselWidget extends StatelessWidget {
  const ProductCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250, // Adjusted height
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              ProductModel producto = ProductModel.fromFirestore(doc);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(producto: producto)),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          producto.imageUrl.length > 0
                              ? producto.imageUrl[0]
                              : 'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                          height: 140, // Adjusted height
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(producto.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('Cantidad: ${producto.quantity}'),
                            Text('Precio: \$${producto.price}',
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: snapshot.data!.docs.length,
            viewportFraction: 0.8,
            scale: 0.9,
          );
        },
      ),
    );
  }
}
