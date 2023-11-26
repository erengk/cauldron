import 'package:cauldron/models/food.dart';
import 'package:flutter/material.dart';
import '../../models/food_tile.dart';
import '../../utils/customColors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List foodMenu = [
    Food(
        name: "Hamburger",
        imagePath: "assets/food_burger.jpg",
        price: "180.00₺"),
    Food(
        name: "Körili Tavuk",
        imagePath: "assets/food_curry.jpg",
        price: "220.00₺"),
    Food(
        name: "Pilav", imagePath: "assets/food_friedrice.jpg", price: "80.00₺"),
    Food(
        name: "Somon Izgara",
        imagePath: "assets/food_salmon.jpg",
        price: "280.00₺"),
    Food(
        name: "Spagetti",
        imagePath: "assets/food_spaghetti.jpg",
        price: "150.00₺"),
    Food(
        name: "Cupcake", imagePath: "assets/food_cupcake.jpg", price: "95.00₺"),
    Food(name: "Pankek", imagePath: "assets/food_pancake.jpg", price: "56.00₺"),
    Food(name: "Ramen", imagePath: "assets/food_pho.jpg", price: "270.00₺")
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                ),
              ),
            ),],),
      ),
    );
  }
}
