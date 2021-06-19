import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/nav_bar.dart';
import 'package:project/texts.dart';
import 'package:project/tools.dart';
import 'registrationPage.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    "lib/assets/Logo-01.png",
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 2),
                              color: Colors.black,
                              blurRadius: 5)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 20, left: 20),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            texts(
                              text: "Hello",
                              color: blue,
                              size: 35,
                              fsize: FontWeight.bold,
                            ),
                            Text(
                              "Login Now",
                              style: TextStyle(
                                  color: blue, letterSpacing: 2, fontSize: 22),
                            ),
                            TextFormField(
                              validator: (email_value) => email_value.isEmpty
                                  ? "please Enter Valid Email"
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    color: Color(0xffB4B4B2), fontSize: 20),
                              ),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              validator: (password_value) =>
                                  password_value.isEmpty
                                      ? "please Enter Your Password"
                                      : null,
                              decoration: InputDecoration(
                                labelText: "Passsword",
                                labelStyle: TextStyle(
                                    color: Color(0xffB4B4B2), fontSize: 20),
                              ),
                              controller: _passwordController,
                              obscureText: true,
                               
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 150,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                splashColor: Color(0xff0F102C),
                                color: Color(0xffF7901E),
                                onPressed: () {
                                  login();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.login),
                                    texts(
                                      text: "Login",
                                      size: 25,
                                      fsize: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  texts(
                    text: "If You Don't Have Account",
                    color: blue,
                    size: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => registrationPage()));
                      }, child: texts(text: "Registre Now",fsize: FontWeight.bold,size: 20,))
                ],
              ),
            ),
          ),
        
      ),
    );
  }

  Future login() async {
    var valid =_formkey.currentState;
    if (valid.validate())
    {
    Uri url = Uri.parse("http://192.168.137.1/client/clientLogin.php") ;
    var response = await http.post(url, body: {
      "email": _emailController.text,
      "password": _passwordController.text,
    });

    var data = await json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Username or password invalid",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      setState(() 
      {id_client=data[0]['id_user'];});
      FlutterSession().set("token", id_client.toString());
      print("id client ="+id_client);
      
      Fluttertoast.showToast(
          msg: "Login Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green, 
          textColor: Colors.white,
          fontSize: 16.0);
         Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => nav_bar(),
        ),
      );
    }
    }
  }
 
}
