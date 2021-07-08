import 'package:flutter/material.dart';
import 'package:project_2/message_detail.dart';

class ForumPage extends StatefulWidget {
  var topCategoryIcons = new Container(
    alignment: Alignment.center,
    decoration: new BoxDecoration(
      gradient: new LinearGradient(
        colors: [],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp,
      ),
    ),
    child: new Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 0.0,
      ),
      decoration: new BoxDecoration(
        color: Colors.orange[100],
        // border: new Border.all(color: Colors.black, width: 1.0),
        borderRadius: new BorderRadius.only(
          topLeft: new Radius.circular(30.0),
          topRight: new Radius.circular(30.0),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new CategoryIcon(Icons.landscape, "Nature", true),
          new CategoryIcon(Icons.headset, "Music", false),
          new CategoryIcon(Icons.movie, "Movies", false),
          new CategoryIcon(Icons.place, "Places", false),
        ],
      ),
    ),
  );

  @override
  _ForumPageState createState() => _ForumPageState();
}

final listItemsData = [
  new ListEntry(
      "Technology", "test", "Questions about technology", 54, 2, true),
  new ListEntry("Music", "test", "Thoughts on Music", 154, 3, false),
  new ListEntry("Games", "test", "What's your favorite game?", 971, 0, false),
  new ListEntry("Sports", "test", "List your favorite players", 124, 2, true),
  new ListEntry("Fashion", "test", "What's your best style?", 412, 5, true),
];
var listView = new ListView.builder(
  itemBuilder: (BuildContext context, int index) =>
      new EntryItem(listItemsData[index]),
  itemCount: listItemsData.length,
  shrinkWrap: true,
);

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: new Text(
          "Message Board",
          textScaleFactor: 1.3,
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.account_circle_outlined),
            onPressed: _onSearchPressed,
          ),
    new IconButton(
    icon: new Icon(Icons.settings),
    onPressed: _onSearchPressed,
    ),
        ],


      ),
      body: new Container(
        child: new Column(
          children: <Widget>[listView],
        ),
      ),
    );
  }

  void _onSearchPressed() {
    Navigator.pop(context);
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses,
      this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected);

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: new Icon(icon),
            onPressed: _onSearchPressed,
            color: Colors.blueAccent,
          ),
          new Text(iconText)
        ],
      ),
    );
  }
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final ListEntry entry;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: new BoxDecoration(
        color: Colors.black12,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      child: new ListTile(
        title: new Text(entry.title),
        subtitle: new Text(entry.description),
        leading: new Icon(
          Icons.account_circle_outlined,
          color: Colors.black54,
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageDetailPage(),
            ),
          );
        },
      ),
    );
  }
}

void _onSearchPressed() {}
