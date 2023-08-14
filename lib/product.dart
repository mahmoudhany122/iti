import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  int price;
  int discount;
  int oldprice;
  String imageUrl;
  String details;

  Product(
      {required this.name,
      required this.price,
      required this.discount,
      required this.oldprice,
      required this.imageUrl,
      required this.details,
      });
}

class ProductsScreen extends StatefulWidget {
   ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('product').get();

    return snapshot.docs
        .map((doc) => Product(
              name: doc['name'],
              price: doc['price'],
              discount: doc["discount"],
              oldprice: doc["oldprice"],
              imageUrl: doc["imageUrl"],
              details: doc["details"],

            ))
        .toList();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
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
        List<Product> products = snapshot.data!;
        return GridView.builder(
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns as per your requirement
            crossAxisSpacing: 3.0,
            mainAxisSpacing: 3.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title:  Center(child: Text(products[index].name,
                                  style: const TextStyle(
                                    fontSize: 30
                                  )),),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,),
                                      Image(
                                        image: NetworkImage(
                                          products[index].imageUrl
                                      ),),
                                      const SizedBox(
                                        height: 5,),
                                      Text(' ${ products[index].details}',
                                      style: TextStyle(
                                        fontSize: 25,
                                      )),
                                      const SizedBox(
                                        height: 5,),
                                      Row(
                                        children: [
                                          Text('Price : ',
                                            style: const TextStyle(
                                              fontSize: 40,
                                            ),),
                                          Text('${ products[index].price}',
                                          style: TextStyle(
                                            fontSize: 37,
                                            color: Colors.blue,
                                          ),),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,),
                                      Row(
                                        children: [
                                          Text('oldPrice : ',
                                            style: const TextStyle(
                                              fontSize: 27,
                                            ),),
                                          Text(' ${ products[index].oldprice}',
                                            style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                            ),),
                                        ],
                                      ),
                                      // Add more information about the product here
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                        },
                        child: Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: [
                              Image.network(
                                products[index].imageUrl,
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 80,
                              ),
                              Container(
                                color: Colors.red.withOpacity(
                                  .8,
                                ),
                                width: 90,
                                child: Text(
                                  " disc : ${products[index].discount} ",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " ${products[index].name} ",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                            },
                            icon:
                            Icon(
                              Icons.favorite_border,
                            )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              "Price",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                  " ${products[index].price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "${products[index].oldprice}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
