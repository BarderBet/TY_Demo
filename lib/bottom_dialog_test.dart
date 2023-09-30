import 'package:flutter/material.dart';

import 'widgets/draggable_bottom_sheet.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final List<IconData> icons = const [
    Icons.message,
    Icons.call,
    Icons.mail,
    Icons.notifications,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: () {
              print("btn pressed");
              _showBottomDialog(context);
            },
            child: const Text("showDialog"),
          ),
        ),
      ),
    );
  }

  void _showBottomDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return _homeWidget();
        });
  }

  Widget _homeWidget() {
    return Builder(builder: (context) {
      return Scaffold(
        body: DraggableBottomSheet(
          minExtent: 150,
          useSafeArea: false,
          curve: Curves.easeIn,
          previewWidget: _previewWidget(context),
          expandedWidget: _expandedWidget(),
          // backgroundWidget: _backgroundWidget(),
          maxExtent: MediaQuery.of(context).size.height * 0.9,
          onDragging: (pos) {},
          barrierTap: () {
            print("barrierCustomTap");
            Navigator.pop(context);
          },
        ),
      );
    });
  }

  Widget _backgroundWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Draggable Bottom Sheet Example'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SizedBox(
        height: 400,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 32),
          itemCount: icons.length,
          itemBuilder: (context, index) => Container(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icons[index], color: Colors.white, size: 60),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ),
      ),
    );
  }

  Widget _previewWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Drag Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: icons.map(
                (icon) {
                  int index = icons.indexOf(icon);
                  return Container(
                    width: 50,
                    height: 50,
                    margin: (index == icons.length - 1) ? EdgeInsets.zero : const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: Colors.pink, size: 40),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandedWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          const Icon(Icons.keyboard_arrow_down, size: 30, color: Colors.white),
          const SizedBox(height: 8),
          const Text(
            'Hey...I\'m expanding!!!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              itemCount: icons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icons[index], color: Colors.pink, size: 40),
              ),
            ),
          )
        ],
      ),
    );
  }
}
