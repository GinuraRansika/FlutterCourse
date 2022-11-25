import 'package:flutter/material.dart';
// ignore_for_file: avoid_print

void main() {
  runApp(const MyApp());
}

// ! Making variables Nullable
void nullTest1() {
  // * Use the question mark after the data type such as "String?"
  String? name = null;
  // * I have a variable, it's a String but sometimes String value may be absent
  print(name);

  name = "Ginura";
  print(name);

  name = null;
  print(name);
}

// ! Making variables Nullable
void nullTest2() {
  // * If you want to make list itself is nullable you need to write as below
  List<String>? names1 = ["Ginura", "Ransika"];
  names1 = null;
  // names[1] = null; You cant do this
  print(names1);

  // * If you want to make list items are nullable you need to write as below
  List<String?>? names2 = ["Ginura", "Ransika", null];
  names2[1] = null;
  print(names2);
}

// ! Cherry-picking non-null values
// * means - we can ask dart to give values that are not null
void cherryPickingTest(
    String? firstName, String? middleName, String? lastName) {
  // ? To pick the first non-null value
  if (firstName != null) {
    print("First Name is the first non-null value");
  } else if (middleName != null) {
    print("Middle Name is the first non-null value");
  } else if (lastName != null) {
    print("Last name is the first non-null value");
  }

  // ? We can do the above process in a much better way
  // * if the value in the left side is null pick the value on my right side
  final firstNonNullValue = firstName ?? middleName ?? lastName;
  print(firstNonNullValue);
}

// ! Null-aware assignment operator
// * try to resolve a variable to make sure it is not null
void nullAwareTest(String? firstName, String? middleName, String? lastName) {
  // * In the below if the firstName is null, might wanna assign another value to name
  String? name = firstName;
  name ??= middleName; // if name is null assign middleName to it
  name ??= lastName;
  print(name);
}

// ! Conditional invocation
void conditionalInvocationTest(List<String>? names1, List<String>? names2) {
  // * Old way of overcoming above problem is (Type promotion way)
  int length = 0;
  if (names1 != null) {
    length = names1.length;
  }
  print(length);

  // * Better way - using conditionally invoke a method or property inside an optional if the optional value is present
  // * if the names2 list is present (if it is not null) grab his length and saved it in newLength otherwise take the value of 0
  final newLength = names2?.length ?? 0;
  print(newLength);
}

/*
  ?     infix operator                  : ??    : that will pick right or left side value depending on which one is not null 
  ?     invocation operator             : obj?. : object which may be null then do something on it 
  ?     Null-aware assignment operator  :  ??=  : assign the value on the right to the variable on the left (but left variable should be null)
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    nullTest1();
    nullTest2();
    cherryPickingTest(null, null, "Ransika");
    nullAwareTest(null, "chamath", "Seram");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
