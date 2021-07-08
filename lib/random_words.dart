import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _saveWordsPairs = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;
          if (index >= _randomWordPairs.length) {
            _randomWordPairs.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_randomWordPairs[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final allReadySave = _saveWordsPairs.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(
        allReadySave ? Icons.favorite : Icons.favorite_border,
        color: allReadySave ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (allReadySave) {
            _saveWordsPairs.remove(pair);
          } else {
            _saveWordsPairs.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    


  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPAir Generator'),
        actions: <Widget>[
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.list),
          )
        ],
      ),
      body: _buildList(),
    );
  }
}
