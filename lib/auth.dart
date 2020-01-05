import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {




  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size sise = MediaQuery.of(context).size;


    return Scaffold(
      key: _globalKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Image(
                    image: AssetImage('assets/login.gif'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: sise.height * 0.4,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "아이디",
                                      icon: Icon(Icons.perm_identity),
                                      hintText: "아이디"),
                                  controller: _idController,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: "비밀번호",
                                      icon: Icon(Icons.security),
                                      hintText: "비밀번호"),
                                  controller: _passwordController,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Material(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  elevation: 8.0,
                                  child: FlatButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.signInWithEmailAndPassword(email: _idController.text, password: _passwordController.text);

                                    },
                                    child: Text(
                                      "로그인",
                                      style: TextStyle(fontSize: 20.0,color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}