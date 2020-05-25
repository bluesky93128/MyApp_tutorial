import 'package:flutter/material.dart';
import 'package:MyApp/bottomAppBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.black,
          primaryVariant: Colors.black,
          secondary: Colors.red,
        ),
        cardTheme: CardTheme(
          color: Colors.black,
        ),
        iconTheme: IconThemeData(
          color: Colors.white54,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
          ),
          bodyText2: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
          ),
        ),
      ),
      home: MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ],
      ),
    );
  }
}
