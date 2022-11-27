import 'package:flutter/material.dart';
// ignore_for_file: avoid_print

void main() {
  runApp(const MyApp());
}

/*
  ! Enumerations
  * Names list of related items
  enumeration is kind of like equivalent of making a string written programmatically 
  so that it becomes an entity 
*/
// * List of related things such as fName, lName which are categorized under PersonProperty
enum PersonProperties { firstName, lastName, age }

void enumerationTest() {
  // * Below both the same name but there are not the same identity
  // * enumeration make sure that a value has a name that can be programmatically referred to
  const name = "Ginura";
  const otherName = "Ginura";

  print(PersonProperties.firstName);
}

/* 
  ! Switch Statement 
  * To avoid if else over enumerations
*/
enum AnimalType { cat, dog, bunny }

void switchEnumerationTest(AnimalType animalType) {
  print(animalType);

  // ? Using if else
  if (animalType == AnimalType.cat) {
    print("Oh I love cats");
  } else if (animalType == AnimalType.dog) {
    print("Dogs are so fluffy");
  } else if (animalType == AnimalType.bunny) {
    print("I wish I had a bunny");
  }

  // ? Using Switch
  switch (animalType) {
    case AnimalType.bunny:
      print("Bunny");
      break;
    // * if you use break it will break out from the switch and continue with the rest
    case AnimalType.cat:
      print("Cat");
      return;
    // * it will break from the current method
    case AnimalType.dog:
      print("Dog");
  }
  print(
      "FUNCTION IS FINISHED"); // ? if you use return above it wont get executed
}

/*
  ! Classes
  * Grouping of various functionalities into one package
  * To work with a class you need to create an instance of that class and
  * instance are objects and objects are created from classes
*/
class Person {
  void run() {
    print("Running");
  }

  void breathe() {
    print("Breathing");
  }
}

/*
  ! Objects
  * Object is an instance of a class
*/
void objectTest() {
  Person(); // * Instantiates a class
  final person = Person(); // * person is an object of type of Person
  person.breathe();
}

/*
  ! Constructors
  * Allow you to create an instance of a class with optional parameters
*/
class Student {
  final String name;
  Student(this.name);
}

/*
  ! Methods
  * a function on the class 
*/
class Teacher {
  final String name;
  Teacher(this.name);

  void printName() {
    // * this means current instance of the class
    print(name);
  }
}

/*
  ! Inheritance and Subclass
*/
class LivingThing {
  void breathe() {
    print("Living thing is breathing");
  }

  void move() {
    print("I am moving");
  }
}

class Cat extends LivingThing {
  void jump() {
    print("Cat Jumps");
  }
}

/*
  ! Abstract Classes
  * Abstract cannot have instances
  * Codes that is supposed to be used in other normal classes 
*/
abstract class Vehicle {
  void moveForward();
  void stop();
}

class Car extends Vehicle {
  @override
  void moveForward() {
    print("Move Forward");
  }

  @override
  void stop() {
    print("Stop Moving");
  }
}

/*
  ! Factory Constructors
  * Can return instances that are not of the same class
  * is a way for you to construct instances of your classes and using convenience functions

  ? It means,
    * If you are creating instances of this class (Rose) like 20 or 30 times 
    * different places in your application using this exact same name(redRose) 
    * Then you need create a factory constructor 
*/
class Rose {
  final String name;
  Rose(this.name);

  // * Let's create a factory constructor that gives us an instance of a Rose
  // * who is name is always blueRose
  factory Rose.blueRose() {
    return Rose("Blue Rose");
  }
  /* 
    * Any class called Rose has a function called 
    * blueRose (Which is the factory constructor) and 
  */
}

/*
  ! Custom Operators
  * Can define custom Operators on your own Classes 
*/
class Food extends Object {
  final String name;
  Food(this.name);

  /*
    * In below what happens is,
      ? we are going to change(override) the functionality of == operator
      ? that is defined at the object level with our own implementation 
      
      ? In the parenthesis you get the value that operator is comparing class with

    * covariant -  
    * it says Forget what the super class which is object class defines as the 
    * parameter type for this parameter

    * It tells Dart that although at the object level we said that 
    * the parameter that comes in is the type of object, 
    * but in our case we are sure that the value that comes in this function is actually "food."
  */
  @override
  bool operator ==(covariant Food other) => other.name == name;

  /* 
    * hashCode is a special identifier that you assign to your instance of classes
    * that then used inside collections for instance 
    *  if you put instance of your Food inside a map or a set 

    * then the way dart knows that 'the keys inside its map' or 'the values inside the set' are
    * unique it's using this hash value
  */
  @override
  int get hashCode => name.hashCode;
  /*
    * In here we create an identifier for our Food class which allows dart to understand
    * that is this Food class instances are placed inside collections (sets or maps) 
    * then it will know if they're unique or not
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    enumerationTest();
    switchEnumerationTest(AnimalType.cat);

    // * How to create an instance of a class in Dart
    final person = Person();
    person.breathe();

    final student = Student("Ginura Ransika");
    print(student.name);

    final teacher = Teacher("Chamath Sura");
    teacher.printName();

    // * Test Inheritance
    final fluffers = Cat();
    fluffers.breathe();
    fluffers.jump();

    // * Abstract Class Test
    final car = Car();
    car.moveForward();

    // * Factory Constructors Test
    final redRose = Rose("Red Rose");
    print(redRose.name);
    final blueRose = Rose.blueRose();
    print(blueRose.name);

    // * Custom Operator Test
    final food1 = Food("Foo");
    final food2 = Food("Foo");
    if (food1 == food2) {
      print("Food is Equal");
    } else {
      print("Food is not equal");
      // * above will say it is not equal but if the food name is equal it should be equal
      // * but after you override the operator and add the hash code it will be equal
    }

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
