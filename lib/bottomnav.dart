import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/product.dart';
import 'package:iti/profile.dart';
import 'package:iti/searrch.dart';
import 'category.dart';
import 'menu.dart';

class BottomNav extends StatefulWidget {
   BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int currentindex = 0;

  List<Widget> screens=[
    ProductsScreen(),
    categoriesScreen(),
    ProfileScreen(),

  ];

  @override
  void initState()
  {

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      drawer: NavBarList(),
      appBar: AppBar(
        title: const Center(
          child: Text(
              "MH11 Store"
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context) => search_screen(),));
            },
            icon:const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: ()
            {
            },
            icon:const Icon(
              Icons.brightness_medium_rounded,
            ),
          ),
        ],
      ),
      body: screens[currentindex],
      bottomNavigationBar:  BottomNavigationBar(
        elevation: 0,
        currentIndex: currentindex,
        onTap: (index){
          setState(() {
            currentindex= index;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            icon:Icon(
                Icons.production_quantity_limits) ,
            label: "product",

          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.category) ,
            label: "category",

          ),
          BottomNavigationBarItem(
            icon:Icon(
                Icons.account_box),
            label: "profile",

          ),
        ],
      ),
    );
  }
}
