import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  @override
  RandomListWordsState createState() => RandomListWordsState();
}

class RandomListWordsState extends State<RandomWords> {
  final _words = <WordPair>[];
  final _checkedWords = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("List of Eng words"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pressButton)
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(5));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }
    _pressButton() {
      final pageRoute = new MaterialPageRoute(builder: (context) {
        //map convert lisst to another list
        final listTiles = _checkedWords.map((_words) {
          return ListTile(
            title: Text(
              _words.asPascalCase,
              style: TextStyle(fontSize: 20.0),
            ),
          );
        });
        return Scaffold(
          appBar: AppBar(
            title: Text('Checked words'),
          ),
          body: ListView(
            children: listTiles.toList(),
          ),
        );
      });
      Navigator.of(context).push(pageRoute);
    }

  Widget _buildRow(WordPair word, int index) {
    final color = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkedWords.contains(word);
    return ListTile(
      //leading = left ,trailing = right
      trailing: Icon(
        isChecked ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      leading: Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: color,
      ),
      title: Text(
        word.asPascalCase,
        style: TextStyle(fontSize: 20.0, color: color),
      ),
      onTap: () {
        setState(() {
          //anonymous function
          if (isChecked)
            _checkedWords.remove(word);
          else
            _checkedWords.add(word);
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RandomWords(),
    );
  }
}
