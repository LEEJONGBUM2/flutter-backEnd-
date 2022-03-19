// ignore_for_file: file_names

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Disabled Text'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.free_breakfast),
          onPressed: () {
            setState(() {
              _enabled = !_enabled;
            });
          }),
      body: Card(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: _enabled
              ? TextFormField(controller: _controller)
              : FocusScope(
                  node: FocusScopeNode(),
                  child: TextFormField(
                    controller: _controller,
                    style: theme.textTheme.subtitle1!.copyWith(
                      color: theme.disabledColor,
                    ),
                    decoration: InputDecoration(
                      hintText:
                          _enabled ? 'Type something' : 'You cannot focus me',
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
