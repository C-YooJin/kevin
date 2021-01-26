import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// 상태가 변하는 위
class RandomList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RandomListState();
    throw UnimplementedError();
  }

}

class _RandomListState extends State<RandomList> {
  @override
  Widget build(BuildContext context) {
    final randomWord = WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: Text("naming app"),
        ),
        body: Center(
            child: Text(randomWord.asPascalCase, textScaleFactor: 1.5,))
    );
  }
}
