import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:project/shared/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final totalAmount =
        cart.items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 118,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/cartb.png'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                left: 322,
                top: 52,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/icons/not.png',
                      width: 26,
                      height: 25,
                    ),
                    Positioned(
                      top: -1,
                      right: 3,
                      child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.yellow.shade800,
                        ),
                        badgeContent: Text(
                          '${cart.items.length}',
                          style: GoogleFonts.lato(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 61,
                top: 51,
                child: Text(
                  'My Cart',
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Parte superior del resumen del carrito
          Container(
            width: MediaQuery.of(context).size.width,
            height: 49,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: Color(0xffd7ddff)),
                  ),
                ),
                Positioned(
                  left: 44,
                  top: 19,
                  child: Container(
                    width: 10,
                    height: 10,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Positioned(
                  left: 69,
                  top: 14,
                  child: Text(
                    'You have ${cart.items.length} item(s)',
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.7),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(item.imageUrl[0]),
                  ),
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    'Precio: \$${item.price}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Container(
                    width: 190,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          iconSize: 30,
                          onPressed: () {
                            if (item.quantity > 1) {
                              setState(() {
                                item.quantity -= 1;
                              });
                            }
                          },
                        ),
                        Text(
                          '${item.quantity}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              item.quantity += 1;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              cart.items.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFE0E0E0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SubTotal',
                        style: GoogleFonts.roboto(
                            color: Color(0xFF757575),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$${totalAmount.toStringAsFixed(2)}',
                        style: GoogleFonts.roboto(
                            color: Color(0xffFF7043),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: totalAmount == 0.0
                            ? Colors.grey
                            : Color(0xffFF7043),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Checkout',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
