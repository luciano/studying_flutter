import 'package:flutter/material.dart';
import './other_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String mainProfilePicture = "https://avatars3.githubusercontent.com/u/15818343?s=460&v=4";
  String otherProfilePicture = "https://cdn.iconscout.com/icon/free/png-256/avatar-369-456321.png";

  void switchUser() {
    String backupPicture = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupPicture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Drawer App"), backgroundColor: Colors.redAccent),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Luciano Silva"),
              accountEmail: Text("luciano.tj2011@gmail.com"),
              currentAccountPicture: GestureDetector(
                onTap: () => print("Showing something in the logs - User 1"),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => switchUser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(otherProfilePicture),
                  ),
                ),
//                GestureDetector( // if needed a third one
//                  onTap: () => print("Showing something in the logs - User 3"),
//                  child: CircleAvatar(
//                    backgroundImage: NetworkImage(otherProfilePicture),
//                  ),
//                )
              ],
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.fill, image: NetworkImage("http://www.nhurley.com/photos/WhatsApp_cap-01.jpg"))
              ),
            ),
            ListTile(
              title: Text("First Page"),
              trailing: Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OtherPage("First Page")));
              },
            ),
            ListTile(
              title: Text("Second Page"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => OtherPage("Second Page")));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("HomePage", style: TextStyle(fontSize: 35.0)),
      ),
    );
  }
}