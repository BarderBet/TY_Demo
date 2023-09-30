import 'package:bottom_dialog/bottom_model.dart';
import 'package:flutter/material.dart';
import 'package:bottom_dialog/show_bottom_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bottom dialog Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'click on floating action button to show dialog',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Increment',
        child: Text(
          'show dialog',
          textAlign: TextAlign.center,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _showDialog() {
    List<BottomModel> list = [
      BottomModel(
          name: 'One',
          id: '1',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 1),
      BottomModel(
          name: 'Two',
          id: '2',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 2),
      BottomModel(
          name: 'Three',
          id: '3',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 3),
      BottomModel(
          name: 'Four',
          id: '4',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 4),
      BottomModel(
          name: 'Five',
          id: '5',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 5),
      BottomModel(
          name: 'Seven',
          id: '7',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 7),
      BottomModel(
          name: 'Six',
          id: '6',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 6),
      BottomModel(
          name: 'Eight',
          id: '8',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 8),
      BottomModel(
          name: 'Nine',
          id: '9',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 9),
      BottomModel(
          name: 'Ten',
          id: '10',
          selected: false,
          imageWidget: Icon(Icons.confirmation_number_sharp),
          sortId: 10),
    ];
    ShowBottomDialog(
      context: context,
      bottomModelList: list,
      // show or hide image inside list
      showImage: true,
      // list item text style
      itemTextStyle: TextStyle(color: Colors.blue, fontSize: 18.0),
      // title text in center of header
      titleText: const Text(
        'Select which',
        style: TextStyle(color: Colors.black, fontSize: 20.0),
      ),
      // save word text, only showed when multiSelect = true,
      saveWord: '',
      // save text style
      saveTextStyle: const TextStyle(color: Colors.blueAccent, fontSize: 18.0),
      // background color
      widgetColor: Colors.white,
      // allow use search inside dialog
      useSearch: true,
      // search text
      searchWord: 'Search...',
      // search text style
      searchTextStyle: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
      // search hint text style
      searchHintTextStyle: TextStyle(color: Colors.grey, fontSize: 16.0),

      // custom widget for search icon as prefix
      prefixSearchIcon: Icon(
        Icons.search,
        color: Colors.blueAccent,
      ),
      // if true => return onSave function, else return onItemSelected
      multiSelect: true,
      onSave: (List<BottomModel> returnedList) {},
      // return
      onItemSelected: (BottomModel item) {},
      // allow to show shadow at top and bottom of dialog
      hasShadow: true,
      // make custom dialog
      customBoxShadow: [
        BoxShadow(
          color: Colors.blueAccent,
          blurRadius: 5.0,
          spreadRadius: 5.0,
          offset: Offset(2.0, 2.0), // shadow direction: bottom right
        )
      ],
      // divider after header (cancel, title text...)
      hasDividerAfterHeader: true,
      // divider color
      dividerColor: Colors.blueGrey,
      // cancel text
      cancelWord: 'Cancel',
      // cancel text style , will throw error if it's null
      cancelTextStyle: TextStyle(color: Colors.red, fontSize: 16.0),
      // dialog top left and right radius
      dialogRadius: 30.0,
    );
  }
}