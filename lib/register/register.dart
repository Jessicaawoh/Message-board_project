import 'package:flutter/material.dart';
import 'package:project_2/forum.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: new Text("Register"),
      ),
      body: new Container(
        color: Colors.indigo,
        padding: const EdgeInsets.all(30.0),
        child: new Column(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(
                new Radius.circular(30.0),
              )),
              height: 200.0,
              alignment: Alignment.center,
              child: new Icon(Icons.library_books,
                  size: 100.0, color: Colors.black),
            ),
            new TextField(
              controller: new TextEditingController(),
              obscureText: true,
              decoration: new InputDecoration(
                  hintText: "Create Username",
                  filled: true,
                  fillColor: Colors.white),
            ),
            new TextField(
              controller: new TextEditingController(),
              obscureText: true,
              decoration: new InputDecoration(
                  hintText: " Create Password",
                  filled: true,
                  fillColor: Colors.white),
            ),
            new Container(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Container(
                    margin: new EdgeInsets.symmetric(vertical: 8.0),
                    child: new RaisedButton(
                      child: new Text("Register"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForumPage()),
                        );
                      },
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {}
}
