import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class category {
  String name;
  String image;

  category(
      {required this.name,
        required this.image});
}
class categoriesScreen extends StatelessWidget
{
  Future<List<category>> fetchProducts() async {
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('category').get();

    return snapshot.docs
        .map((doc) => category(
      name: doc['name'],
      image: doc["image"],
    ))
        .toList();
  }
  Widget build(BuildContext context) {
    return FutureBuilder<List<category>>(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
                color: Colors.indigoAccent,
              ));
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        List<category> categories = snapshot.data!;
        return ListView.separated(
            itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(categories[index].image),
                      height: 70,
                      width: 100,
                      fit:BoxFit.cover,

                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Text(
                        '${categories[index].name}',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              );
            } ,
            separatorBuilder: (context, index) => Divider(),
            itemCount:categories.length,
        );
      },
    );
  }
}

