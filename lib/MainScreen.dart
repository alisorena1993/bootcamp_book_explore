import 'package:bootcamp_book_explore/MyLibrary.dart';
import 'package:bootcamp_book_explore/res/colors.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';
import 'Comunity.dart';
import 'Explore.dart';

int selectedIndex = 0;

class page_index {
  static const int mylibraryindedx = 0;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Map StackIndexes = {
    "My Library": {
      "index": 0,
      "selectedimage": "assets/images/icons/ion_library_selected.png",
      "unselectedimage": "assets/images/icons/ion_library.png",
      "text": "My Library"
    },
    "Explore": {
      "index": 1,
      "selectedimage": "assets/images/icons/fluent_book-20-filled.png",
      "unselectedimage": "assets/images/icons/fluent_book-20.png",
      "text": "Explore"
    },
    "Cart": {
      "index": 2,
      "selectedimage": "assets/images/icons/mdi_cart-variant.png",
      "unselectedimage": "assets/images/icons/mdi_cart-variant.png",
      "text": "Cart"
    },
    "Comunity": {
      "index": 3,
      "selectedimage": "assets/images/icons/mdi_cart-variant.png",
      "unselectedimage":
          "assets/images/icons/fluent_people-community-16-filled.png",
      "text": "Comunity"
    },
  };

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: IndexedStack(
          index: selectedIndex,
          children: [MyLibrary(), explore(), cart(), comunity()]),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: MyColors.grey,
                offset: Offset(0, 1),
              ),
            ],
          ),
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = StackIndexes["My Library"]["index"];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage(selectedIndex ==
                                StackIndexes["My Library"]["index"]
                            ? StackIndexes["My Library"]["selectedimage"]
                            : StackIndexes["My Library"]["unselectedimage"])),
                    Text(
                      StackIndexes["My Library"]["text"],
                      style: TextStyle(color: MyColors.green, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = StackIndexes["Explore"]["index"];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage(
                            selectedIndex == StackIndexes["Explore"]["index"]
                                ? StackIndexes["Explore"]["selectedimage"]
                                : StackIndexes["Explore"]["unselectedimage"])),
                    Text(
                      StackIndexes["Explore"]["text"],
                      style: TextStyle(color: MyColors.green, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = StackIndexes["Cart"]["index"];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage(
                            selectedIndex == StackIndexes["Cart"]["index"]
                                ? StackIndexes["Cart"]["selectedimage"]
                                : StackIndexes["Cart"]["unselectedimage"])),
                    Text(
                      StackIndexes["Cart"]["text"],
                      style: TextStyle(color: MyColors.green, fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = StackIndexes["Comunity"]["index"];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        image: AssetImage(
                            selectedIndex == StackIndexes["Comunity"]["index"]
                                ? StackIndexes["Comunity"]["selectedimage"]
                                : StackIndexes["Comunity"]["unselectedimage"])),
                    Text(
                      StackIndexes["Comunity"]["text"],
                      style: TextStyle(color: MyColors.green, fontSize: 12.0),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
