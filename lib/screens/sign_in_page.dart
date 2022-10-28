

import 'package:flutter/material.dart';
import 'package:local_data_store/screens/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

     SharedPreferences? prefs ;
     String? _name, _email, _password;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:  AssetImage('image/maan.jpg'))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Card(
              color: Color(0xffD5F0F2),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.transparent)),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    _name = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(18)),
                    labelText: "Enter Your Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Card(
              color: Color(0xffD5F0F2),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.transparent)),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(18)),
                    labelText: "Enter Email Address"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Card(
              color: Color(0xffD5F0F2),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.transparent)),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(18)),
                    labelText: "Enter Password"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: InkWell(
              onTap: () async {
                prefs = await SharedPreferences.getInstance();
                setState((){
                  prefs?.setString('name', _name!);
                  prefs?.setString('email', _email!);
                  prefs?.setString('password', _password!);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomePage()));
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18)
                ),
                height: 40,
                width: double.infinity,
                child: Center(child: Text("Sign up")),
              ),
            ),
          ),

          // ElevatedButton(
          //   onPressed: ()async{
          //    prefs = await SharedPreferences.getInstance();
          //     setState(() {
          //         String? action = prefs?.getString('name');
          //         String? action_1 = prefs?.getString('email');
          //         String? action2 = prefs?.getString('password');
          //     });
          //   },
          //   child: Text("Show"),
          //
          // )
        ],
      ),
    );
  }
}
