import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class accountScrren extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
                color: Colors.white,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Edit e-mail adress",
                    prefixIcon: Icon(
                      Icons.account_circle_sharp,
                    ),
                    border: OutlineInputBorder(),
                  ) ,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText:  "edit password",
                    prefixIcon: Container(
                      child: Icon(
                        Icons.lock,
                      ),
                    ),
                    suffixIcon: (
                        Icon(Icons.remove_red_eye)
                    ),
                    border: OutlineInputBorder(),
                  ) ,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {

                  },
                  child: const Text(
                    'save changes',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
