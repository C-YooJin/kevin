import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:kevin/src/saved.dart';

// 상태가 변하는 위젯
class RandomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    final randomWord = WordPair.random();
    return Scaffold(
      appBar: AppBar(
          title: Text("naming app"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SavedList(saved: _saved))
                );
              },
            )
          ]
      ),
      body: _buildList(),
    );
  }

  _buildList() {
    return ListView.builder(itemBuilder: (context, index) {
      // 0, 2, 4, 6, 8.. = real items
      // 1, 3, 5, 7, 9.. = dividers
      if (index.isOdd) {
        return Divider();
      }
      // index를 2로 나눈 몫을 텍스트에 보여줘
      var realIndex = index ~/ 2;

      if (realIndex >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      return _biuldRow(_suggestions[realIndex]);
    });
  }

  Widget _biuldRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved)
            _saved.remove(pair); //true
          else
            _saved.add(pair); //false

          print(_saved.toString());
        });
      },
    );
  }
}
