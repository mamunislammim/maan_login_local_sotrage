import 'package:flutter/material.dart';
import 'package:local_data_store/screens/sign_in_page.dart';
import 'login_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:   AssetImage('image/maan.jpg'))),
          ),
          Center(child: Text("MaaN",style: TextStyle(color: Colors.redAccent,fontSize: 35,fontWeight: FontWeight.bold),)),
          Center(child: Text("AcademY",style: TextStyle(color: Colors.redAccent,fontSize: 35,fontWeight: FontWeight.bold),)),

          Padding(
            padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18)),
                height: 40,
                width: double.infinity,
                child: Center(child: Text("signIn")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignInPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18)),
                height: 40,
                width: double.infinity,
                child: Center(child: Text("SignUp")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
