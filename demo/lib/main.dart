import 'package:demo/data/use_case.dart';
import 'package:demo/data/use_cases/navigation/navigation_use_case.dart';
import 'package:demo/demo/demo_page.dart';
import 'package:demo/theme_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Backdrop Gallery",
      theme: GalleryThemeData.darkThemeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<UseCase> _useCases = [NavigationUseCase()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Backdrop Gallery"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child:
                Text("This app shows some use cases for the backdrop widget. "
                    "Open any one to show information about it, preview it and "
                    "look at its code."),
          ),
          ListView.separated(
            itemCount: _useCases.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text(_useCases[index].name),
              onTap: () => _openDemoPage(context, _useCases[index]),
            ),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(),
          ),
        ],
      ),
    );
  }

  _openDemoPage(BuildContext context, UseCase useCase) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DemoPage(useCase)));
  }
}