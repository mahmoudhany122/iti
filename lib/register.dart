import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti/login.dart';

class ResighterScreen extends StatefulWidget {

  ResighterScreen({Key? key}) : super(key: key);

  @override
  State<ResighterScreen> createState() => _ResighterScreenState();
}

class _ResighterScreenState extends State<ResighterScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isShowed =true;

  IconData suffix = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        return emailController.text.isEmpty
                            ? "Enter your e-mail address "
                            : null;
                      },
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        hintText: "E-mail address ",
                        prefixIcon: Container(
                          child: Icon(
                            Icons.email,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: isShowed,
                      validator: (value) {
                        return passwordController.text.isEmpty
                            ? "Enter your password"
                            : null;
                      },
                      onFieldSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Container(
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                        suffixIcon:IconButton(
                          icon:Icon(suffix),
                          onPressed: () {
                            setState(() {
                              isShowed=!isShowed;
                              suffix=isShowed? Icons.remove_red_eye:Icons.visibility_off;
                            });
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    color: Colors.blue,
                    child: MaterialButton(
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);

                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim())
                              .then((value) {
                            print(value.user?.email);
                            print(value.user?.uid);
                          }).catchError((error) {
                            print(error.tostring());
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        };
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "I agree with all terms of usage",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account ? ",
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Login ",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
