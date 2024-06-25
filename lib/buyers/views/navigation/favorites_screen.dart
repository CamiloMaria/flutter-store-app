import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import 'package:project/shared/model/favorite_model.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteModel>(context);
    final totalFavorites = favorites.totalItems;

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
                          totalFavorites.toString(),
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
                  'My Favorites',
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
                    'You have $totalFavorites item(s)',
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
              itemCount: totalFavorites,
              itemBuilder: (context, index) {
                final item = favorites.items[index];
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
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        favorites.remove(item.id);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
