import 'package:flutter/material.dart';
import 'package:local_data_store/screens/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? name,email,password;
  String? lName,lEmail,lPassword;

  getData()async{
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
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:   AssetImage('image/maan.jpg'))),
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Card(
              color: Color(0xffD5F0F2),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.transparent)),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    lEmail = value;
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
                    lPassword = value;
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
              onTap: (){
                  setState(() {

                    print("M $email  M $password");
                    print("M $lEmail  M $lPassword");


                    if(lEmail == email && lPassword == password){
                      print("dhet");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> WelcomePage()));
                    }
                  });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(18)
                ),
                height: 40,
                width: double.infinity,
                child: Center(child: Text("Login")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
