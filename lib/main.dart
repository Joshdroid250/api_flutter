import 'package:flutter/material.dart';

void main() => runApp(PracticeApp());

class PracticeApp extends StatelessWidget {
  const PracticeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "PracticeApp",
      home: Start(),
    );
  }
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[contendor()],
        ),
      ),
    );
  }
}

/*Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const RegisterPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}*/

Widget top() {
  return Container(
    margin: EdgeInsets.all(0),
    alignment: Alignment.center,
    child: Image.network(
        'https://www.pixelstalk.net/wp-content/uploads/2016/04/Abstract-minimalist-wallpaper-HD-desktop-download.png'),
  );
}

Widget Welcome() {
  return Container(
    margin: EdgeInsets.only(left: 10.0),
    alignment: Alignment.topLeft,
    child: Column(
      children: <Widget>[
        Container(
          child: const Text(
            "Welcome  to Fashion Daily",
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 0.0, top: 20.0),
          alignment: Alignment.centerLeft,
          child: const Text(
            "Sing In",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
        )
      ],
    ),
  );
}

Widget infoHelp() {
  return Container(
    margin: const EdgeInsets.only(bottom: 80.0, right: 20.0),
    alignment: Alignment.centerRight,
    child: const Text(
      "Help",
      style: TextStyle(
          color: Colors.blueAccent,
          fontFamily: 'ProductSans',
          fontWeight: FontWeight.bold,
          fontSize: 15),
    ),
  );
}

Widget hiBox() {
  return Container(
    child: GridView.count(
      crossAxisCount: 2,
      children: <Widget>[Welcome(), infoHelp()],
    ),
  );
}

Widget Form() {
  return Container(
    child: Column(
      children: <Widget>[
        Flexible(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 10.0, bottom: 0.0),
              child: const Text(
                "Phone Number",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )),
        Flexible(
            child: Container(
              height: 50,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'Enter your Number')),
            )),
        Flexible(
            child: Container(
              height: 100,
              width: 500,
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    primary: Colors.blueAccent),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontFamily: "ProductSans", color: Colors.white),
                ),
                onPressed: () {},
              ),
            )),
        Flexible(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              child: const Text(
                "or",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            )),
        Flexible(
            child: Container(
              height: 100,
              width: 500,
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueAccent),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    primary: Colors.white),
                child: const Text(
                  "Google Sing in",
                  style: TextStyle(
                      fontFamily: "ProductSans", color: Colors.blueAccent),
                ),
                onPressed: () {},
              ),
            )),
      ],
    ),
  );
}

class RegisterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              child: const Text(
                "Doesn't have an account?",
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 5.0),
              child: InkWell(
                onTap: () {
                 /* Navigator.of(context).push();*/
                },
                child: const Text(
                  "Register?",
                  style: TextStyle(
                    fontFamily: 'ProductSans',
                    color: Colors.blueAccent,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


Widget contendor() {
  return Container(
    child: Column(
      children: <Widget>[
        top(),
        SizedBox(height: 130, child: Flexible(child: hiBox())),
        SizedBox(height: 250, child: Flexible(child: Form())),
        SizedBox(height: 50, child: Flexible(child: RegisterText())),
      ],
    ),
  );
}