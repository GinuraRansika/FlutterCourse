import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

// ! Creating a HomePage.
// * Scaffold - We need a scaffold inside our HomePage widget to make it presentable
/*
      * add an appBar inside the scaffold 
        ? inside the AppBar pass a title parameter 

      * add a button

      * When the button is pressed register a user in the firebase
        ? firebase has anonymous user concept 

      * column with 2 text fields (username and password)

      * To get the values when the button is clicked we need to use a Text Controller
        ? after you create the text editing controllers 
        ? use initState to initialize those
        ? then dispose them
        ? after that assign those controllers to the text fields

      * Added hints for the input text fields

      * Do the Authentication (when click the register button need to do the authentication)
        ? import the firebase (import 'package:firebase_auth/firebase_auth.dart';)
        ? gets the user name and password from the text field
        ? use FirebaseAuth.instance.createUserWithEmailAndPassword() to create a user
        ? put await and save the returned value from it
        ! You need to Initialize firebase before you use firebase
          * import firebase_options.dart
          * then add the firebase.initializeApp(..)
          * then go to your firebase.console site and add the authentication through email
        ? Enables widget binding before Firebase.initializeApp 
          * put WidgetsFlutterBinding.ensureInitialized(); in the main();
          * change the body to a FutureBuilder
        

  */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // * late used to define that although it has no value now but assign a value before it use
  late final TextEditingController _email;
  late final TextEditingController _password;

  // ! in the contract in late you need to assign a value so we can use initState
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  // ! after you create the init states you need create the dispose of them
  @override
  void dispose() {
    // * you created the text editing console so you are in charge of dispose them too
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ), // Create a new instance of AppBar()
      body: FutureBuilder(
        // ! Initialize firebase
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          return Column(
            // column will create an children property which can display list of widgets
            children: [
              TextField(
                // assigning controllers to the text fields
                controller: _email,
                //* below will add a @ sign in keyboard
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                decoration:
                    const InputDecoration(hintText: "Enter your Email here"),
              ),
              TextField(
                controller: _password,
                obscureText:
                    true, // * put the point instead of showing the characters
                enableSuggestions: false,
                autocorrect: false,
                decoration:
                    const InputDecoration(hintText: "Enter your Password here"),
              ),
              TextButton(
                onPressed: () async {
                  // * when the button is pressed need to get the values in the textfield
                  // * way to do that is using text controller

                  /*
                 ? text controller - will grab text information from the text field 
                 ?                   so button can read that information(like a proxy)
                */

                  // * Getting email and password
                  final email = _email.text;
                  final password = _password.text;

                  // * You need to put await in below method call
                  // If you didn't put await you will only get the instance of the future
                  // you won't actually get the work that it's doing
                  // * You need to save the return UserCredential too

                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  print(userCredential);
                },
                child: const Text("Register"),
              ),
            ],
          );
        },
      ),
    );
  }
}
