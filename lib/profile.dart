import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'account.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "change my profile settings",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => accountScrren(),
                          ));
                    },
                    child: Container(
                      height: 70,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey[300],
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40.0,
                          ),
                          Icon(
                            Icons.account_circle_sharp,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Center(
                            child: Text(
                              "my account ",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 70,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey[300],
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 40.0,
                          ),
                          Icon(
                            Icons.logout,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 35.0,
                          ),
                          Center(
                            child: Text(
                              "log out",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
