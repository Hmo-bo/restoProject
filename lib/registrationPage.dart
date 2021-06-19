import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:project/nav_bar.dart';
import 'package:project/tools.dart';
import 'LoginPage.dart';
import 'package:http/http.dart' as http;


class registrationPage extends StatefulWidget {

  @override
  _registrationPageState createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  Future register() async {
    var valid =_formkey.currentState;
    if (valid.validate())
    {
    Uri url = Uri.parse("http://192.168.137.1/client/regestration.php") ;
    var response = await http.post(url, body: {
      "email": _emailController.text,
      "password": _passwordController.text,
      "name": _nameController.text,
      "phoneNumber": _phoneNumberController.text
    });
    //var data = json.decode(response.body);
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "You Alredy Have Account",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
      
    
      
    } else {
      id_client=data[0]['id_user'];
      Fluttertoast.showToast(
        msg: "Registration Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
    Navigator.push(context,
      new MaterialPageRoute(builder: (context) => nav_bar()));
      }
    }
  }



  /*
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }*/

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF7901E),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                child: Image(image: AssetImage("lib/assets/Logo-01.png",),),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20.0),
                  color: Colors.transparent,
                ),
                // ),
                width: 350,
                child: Column(
                  children: [
                    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              
                        Text(
                          "Create Acccount",
                          style: TextStyle(
                              color: Color(0xff0F102C),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
              SizedBox(
                height: 10,
              ),
              Material(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: TextFormField(
                    
                    validator: (name_value)=>name_value.isEmpty?
                    "Enater Your Name":null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: "Full Name",
                      labelStyle:
                          TextStyle(color: Color(0xffB4B4B2), fontSize: 18),
                      filled: true,
                    ),
                    controller: _nameController,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                child: TextFormField(

                    validator: (email_value)=>EmailValidator.validate(email_value)?null:
                    "Enater A valid Email Adress",
                    
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Color(0xffB4B4B2), fontSize: 18),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: TextFormField(
                    validator: (phone_value)=>phone_value.trim().isEmpty||phone_value.length<10?
                    "Enter A Valide Phone Number":null
                    ,
                    decoration: InputDecoration(
                      labelText: "Pone Number",
                      labelStyle:
                          TextStyle(color: Color(0xffB4B4B2), fontSize: 18),
                    ),
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey )),
                  ),
                  child: TextFormField(
                    
                    validator: (password_value)=>
                    password_value.trim().isEmpty||password_value.length<8?
                    "Insert a Password More Then 8 Characters":null
                    ,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Color(0xffB4B4B2), fontSize: 18),
                    ),
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 50,
                child: registerbut(),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0)),
              )
            ],
          ),
        ),
      ),
    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If You Already Have Account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),

                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Log In!",
                            style: TextStyle(
                                color: Color(0xff0F102C),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerbut() {
  return RaisedButton(
    onPressed: () {
      register();
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    color: Color(0xff0F102C),
    textColor: Colors.white,
    child: Text(
      "Register",
      style: TextStyle(fontSize: 20),
    ),
  );
}
}

