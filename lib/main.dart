import 'package:flutter/material.dart';
import 'package:tabbed/pages/firstpage.dart';
import 'package:tabbed/pages/secondpage.dart';
import 'package:tabbed/pages/thirdpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // custom tab bar controller
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // SingleTockerProviderStateMixin is used to control the animation of the tab bar controller
    controller = TabController(length: 3, vsync: this);
    // refresh the state of the tab bar to display index on app bar and tab bar controller on app bar
    controller.addListener(() {
      setState(() {});
    });
  }

  // dispose the tab controller when the app is closed to avoid memory leaks
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Tab ${controller.index + 1}"),
            centerTitle: true,
            bottom: TabBar(controller: controller, tabs: [
              Tab(
                child: Text(
                  "Tab 1",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              Tab(
                child: Text(
                  "Tab 2",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.star,
                  size: 30,
                ),
              ),
              Tab(
                child: Text(
                  "Tab 3",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
            ]),
          ),
          // no of widgets must be same as parent (TabBar)
          body: TabBarView(
              controller: controller,
              children: [FirstPage(), SecondPage(), ThirdPage()]),
        ),
      );
}
