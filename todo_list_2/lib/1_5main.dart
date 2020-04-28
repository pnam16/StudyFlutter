//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

// 1. RANDOM WORDS CHECK BOX CHANGE LAYOUT
//void main() => runApp(MyApp());
//
//class RandomWords extends StatefulWidget {
//  @override
//  RandomListWordsState createState() => RandomListWordsState();
//}
//
//class RandomListWordsState extends State<RandomWords> {
//  final _words = <WordPair>[];
//  final _checkedWords = new Set<WordPair>();
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text("List of Eng words"),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.list), onPressed: _pressButton)
//        ],
//      ),
//      body: ListView.builder(itemBuilder: (context, index) {
//        if (index >= _words.length) {
//          _words.addAll(generateWordPairs().take(5));
//        }
//        return _buildRow(_words[index], index);
//      }),
//    );
//  }
//
//  _pressButton() {
//    //show text of line checked
//    final pageRoute = new MaterialPageRoute(builder: (context) {
//      //map convert lisst to another list
//      final listTiles = _checkedWords.map((_words) {
//        return ListTile(
//          title: Text(
//            _words.asPascalCase,
//            style: TextStyle(fontSize: 20.0),
//          ),
//        );
//      });
//      return Scaffold(
//        appBar: AppBar(
//          title: Text('Checked words'),
//        ),
//        body: ListView(
//          children: listTiles.toList(),
//        ),
//      );
//    });
//    Navigator.of(context).push(pageRoute);
//  }
//
//  Widget _buildRow(WordPair word, int index) {
//    final color = index % 2 == 0 ? Colors.red : Colors.blue;
//    final isChecked = _checkedWords.contains(word);
//    return ListTile(
//      //leading = left ,trailing = right
//      trailing: Icon(
//        isChecked ? Icons.favorite : Icons.favorite_border,
//        color: Colors.red,
//      ),
//      leading: Icon(
//        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
//        color: color,
//      ),
//      title: Text(
//        word.asPascalCase,
//        style: TextStyle(fontSize: 20.0, color: color),
//      ),
//      onTap: () {
//        setState(() {
//          //anonymous function
//          if (isChecked)
//            _checkedWords.remove(word);
//          else
//            _checkedWords.add(word);
//        });
//      },
//    );
//  }
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'My App',
//      theme: ThemeData(primarySwatch: Colors.blue),
//      home: RandomWords(),
//    );
//  }
//}

//===================================
//2. Add image, Col, Row, Container, padding, add a long text...
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    Widget textWidget = Container(
//      padding: EdgeInsets.only(left: 15.0, top: 5.0),
//      child: Row(
//        children: <Widget>[
//          Expanded(
//            //wrap-content
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  "Col 1",
//                  style: TextStyle(
//                    fontSize: 18.0,
//                  ),
//                ),
//                Container(
//                  child: Text(
//                    "b1b1b1b1b1b",
//                    style:
//                        TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
//                  ),
//                  padding: EdgeInsets.only(bottom: 10.0),
//                ),
//                Text(
//                  "C1C1C1C1C1",
//                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
//                ),
//              ],
//            ),
//          ),
//          Icon(
//            Icons.favorite,
//            color: Colors.red,
//            size: 50.0,
//          ),
//          Text(
//            " 99",
//            style: TextStyle(fontSize: 30.0),
//          ),
//        ],
//      ),
//    );
//    // TODO: implement build
//    Widget buttonRow = Container(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround, //flex on row
//        children: <Widget>[
//          Column(
//            children: <Widget>[
//              Icon(
//                Icons.home,
//                size: 30,
//                color: Colors.blue,
//              ),
//              Container(
//                  child: Text(
//                "Home",
//                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
//              )),
//            ],
//          ),
//          Column(
//            children: <Widget>[
//              Icon(
//                Icons.arrow_back,
//                size: 30,
//                color: Colors.blue,
//              ),
//              Container(
//                  child: Text(
//                "Back",
//                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
//              )),
//            ],
//          ),
//          Column(
//            children: <Widget>[
//              Icon(
//                Icons.arrow_forward,
//                size: 30,
//                color: Colors.blue,
//              ),
//              Container(
//                  child: Text(
//                "Next",
//                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
//              )),
//            ],
//          ),
//          Column(
//            children: <Widget>[
//              Icon(
//                Icons.share,
//                size: 30,
//                color: Colors.blue,
//              ),
//              Container(
//                  child: Text(
//                "Share",
//                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
//              )),
//            ],
//          ),
//        ],
//      ),
//    );
//    Widget textDescription = Container(
//      padding: EdgeInsets.all(10.0),
//      child: Text(
//          '''     Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.''',
//          style: TextStyle(
//            fontSize: 16.0,
//            color: Colors.grey[800],
//          )),
//    );
//
//    return MaterialApp(
//      title: "",
//      home: Scaffold(
////        appBar: AppBar(
////          title: Text("Fluter App"),
////        ),
//        body: ListView(
//          children: <Widget>[
//            Image.asset(
//              'images/image.png',
////              fit: BoxFit.cover,
//            ),
//            textWidget,
//            buttonRow,
//            textDescription,
//          ],
//        ),
//      ),
//    );
//  }
//}

//==========================================================
//3. Exemple about GridView
//void main() => runApp(MyApp());
//
//class MainPage extends StatefulWidget {
//  String title;
//
//  MainPage(this.title) : super();
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return MainPageState(); //return a State
//  }
//}
//
//class MainPageState extends State<MainPage> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: GridView.extent(
//        maxCrossAxisExtent: 222.0,
//        mainAxisSpacing: 5.0,
//        children: _buildGridImage(9),
//      ),
//    );
//  }
//}
//
//List<Widget> _buildGridImage(numberOfImage) {
//  List<Container> container =
//  new List<Container>.generate(numberOfImage, (int index) {
//    final imageName = 'images/icon${index + 1}.png';
//    return Container(
//      child: Image.asset(imageName),
//    );
//  });
//  return container;
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: "",
//      home: MainPage("GridViewTitle"),
//    );
//  }
//}
//====================================================
//4. Ex of SnackBar(//Toast)
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//    _showSnackBar() {
//      final snackBar = SnackBar(
//        content: Text("This is SnackBar"),
//        duration: Duration(seconds: 3), //delay show SnackBar
//        backgroundColor: Colors.grey[700],
//        action: SnackBarAction(
//          label: "Ok",
//          onPressed: () {},
//        ),
//      );
//      _scaffoldKey.currentState.showSnackBar(snackBar);
//    }
//
//    return MaterialApp(
//      title: "SnackBar",
//      home: Scaffold(
//        key: _scaffoldKey,
//        appBar: AppBar(
//          title: Text('An example of SnackBar'),
//          actions: <Widget>[
//            IconButton(icon: Icon(Icons.info), onPressed: _showSnackBar)
//          ],
//        ),
//      ),
//    );
//  }
//}
//==============================================================
//5. Tabs in Flutter (TabLayout)
//import 'tab1.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final tabController = DefaultTabController(
//        length: 4,
//        child: Scaffold(
//          appBar: AppBar(
//            title: Text("These are tabs"),
//            bottom: TabBar(
//              //  indicatorColor: Colors.red,//tab onpessed
//              tabs: <Widget>[
//                Tab(
//                  icon: Icon(
//                    Icons.home,
//                    size: 32.0,
//                  ),
//                  text: 'Home',
//                ),
//                Tab(
//                  icon: Icon(
//                    Icons.group,
//                    size: 32.0,
//                  ),
//                  text: 'Group',
//                ),
//                Tab(
//                  icon: Icon(
//                    Icons.chat,
//                    size: 32.0,
//                  ),
//                  text: 'Chat',
//                ),
//                Tab(
//                  icon: Icon(
//                    Icons.cloud_upload,
//                    size: 32.0,
//                  ),
//                  text: 'Upload',
//                ),
//              ],
//            ),
//          ),
//          body: TabBarView(children: [Tab1(), Tab1(), Tab1(), Tab1()]),
//        ));
//    return MaterialApp(title: "Tabs Ex", home: tabController);
//  }
//}
