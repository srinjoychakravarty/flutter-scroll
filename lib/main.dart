import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: RandomCompanyWords(),
    );
  }
}

class RandomCompanyWords extends StatefulWidget
{
  @override
  _RandomCompanyWordsState createState() => _RandomCompanyWordsState();
}

class _RandomCompanyWordsState extends State<RandomCompanyWords>
{
  final _userSuggestions = <WordPair>[];
  final _largerFont = TextStyle(fontSize: 20.0);
  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Blockchain Startup Top 10'),
      ),
      body: _constructSuggestions(),
    );
  }

  Widget _constructSuggestions()
  {
    return ListView.builder(
        padding: EdgeInsets.all(18.0),
        itemBuilder: (context, i)
        {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _userSuggestions.length)
          {
            _userSuggestions.addAll(generateWordPairs().take(10));
          }
          return _constructRow(_userSuggestions[index]);
        });
  }

  Widget _constructRow(WordPair currentPair)
  {
    return ListTile(
      title: Text(
        currentPair.asPascalCase,
        style: _largerFont,
      ),
    );
  }
}