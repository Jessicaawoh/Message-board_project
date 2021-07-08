import 'package:flutter/material.dart';

class MessageDetailPage extends StatefulWidget {
  const MessageDetailPage({Key? key}) : super(key: key);

  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

var ForumPostArr = [
  new ForumPostEntry("User123231", "2 Days ago", 0, 0,
      "Hello,\n\n Many of us will never be great even after reading all programming books. Many programmers are not bookish. They create things of value no matter how imperfect that program is"),
  new ForumPostEntry("User243542", "23 Hours ago", 1, 0,
      "As you advance past the basics, look to the later chapters of your books for more advanced ideas. If your books don't take you fast enough, you may need more books. Also, listen to Podcasts on coding. I like JavaScript Jabber. Learn about client frameworks, or React, or real time access using Socket.io, or connecting Node to third party services like Facebook."),
  new ForumPostEntry("User353453", "2 Hours ago", 5, 0,
      "With the advent of the latest technologies and automation combined with artificial intelligence, there has been a dramatic change in how we interact with devices around us. While computers keep their interactions together, it is the code written in a specific programming language that holds the key for their functioning and processing; thus, programming becomes an integral part of every device that we encounter in our daily lives."),
  new ForumPostEntry("User456767", "5 minutes ago", 0, 0,
      "As Computer programming is a vast domain to understand and learn, if someone wants to become an expert in programming, the first thing that they should start with is introspecting themselves on why they want to become a programmer and what they want to do after learning those skills, thus making it easy to choose their path in the world of programming. After this, one can start learning a specific programming language, understand the core concepts, and practice solving various codes that can be implemented over practical applications."),
];

class _MessageDetailPageState extends State<MessageDetailPage> {
  @override
  Widget build(BuildContext context) {
    var questionSection = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Text(
            "How do I become a expert in programming as well as design ??",
            textScaleFactor: 1.5,
            style: new TextStyle(fontWeight: FontWeight.bold),
          ),
          new Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconWithText(
                  Icons.laptop_mac,
                  "Technology",
                  iconColor: Colors.blue,
                ),
                new IconWithText(
                  Icons.check_circle,
                  "Answered",
                  iconColor: Colors.green,
                ),
                new IconWithText(
                  Icons.remove_red_eye,
                  "54",
                  iconColor: Colors.blue,
                )
              ],
            ),
          ),
          new Divider()
        ],
      ),
    );
    var responses = new Container(
        padding: const EdgeInsets.all(8.0),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              new ForumPost(ForumPostArr[index]),
          itemCount: ForumPostArr.length,
        ));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Technology"),
      ),
      body: new Column(
        children: <Widget>[
          questionSection,
          new Expanded(
              child: new Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: responses,
          ))
        ],
      ),
    );
  }
}

class ForumPostEntry {
  final String username;
  final String hours;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry(
      this.username, this.hours, this.likes, this.dislikes, this.text);
}

class ForumPost extends StatelessWidget {
  final ForumPostEntry entry;

  ForumPost(this.entry);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: new BoxDecoration(
        color: Colors.blue[200],
        borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.blue[100],
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            child: new Row(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  size: 50.0,
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(entry.username),
                      new Text(entry.hours),
                    ],
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_up),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Text(entry.likes.toString()),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: new Icon(Icons.thumb_down),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 2.0),
                      child: new Text(entry.dislikes.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 2.0),
            padding: const EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(20.0),
                    bottomRight: const Radius.circular(20.0))),
            child: new Text(entry.text),
          ),
        ],
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color iconColor;

  IconWithText(this.iconData, this.text, {required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Icon(
            this.iconData,
            color: this.iconColor,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(this.text),
          ),
        ],
      ),
    );
  }
}
