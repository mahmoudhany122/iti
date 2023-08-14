import 'package:flutter/material.dart';

class search_screen extends StatelessWidget {

  var searchController= TextEditingController();

  search_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.grey[300],
              child: TextFormField(
                keyboardType: TextInputType.text,

                onFieldSubmitted: (value){
                  print(value);
                },
                onChanged:(value){
                  print(value);
                } ,
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ) ,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
