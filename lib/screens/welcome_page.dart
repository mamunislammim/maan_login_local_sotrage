import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? name, email, password;

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      password = prefs.getString('password');
      print(name);
      print(email);
      print(password);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            "MaaN",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            "AcademY",
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Card(
              color: Colors.brown,
              child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name : $name",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Email : $email",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 20)),
                      Text("Password : $password",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
