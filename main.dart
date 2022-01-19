import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Животные',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: 'Тест создания классов животных, их наследования и методов'),
    );
  }
}

class Animal {
  String name = '';
  int weight = 0;
  int height = 0;

  Animal(this.name, this.weight, this.height) {}

  String getInfo() => 'my animal $name weights $weight, its height is $height';
}

class DogAnimal extends Animal {
  String breed;

  DogAnimal(this.breed, name, weight, height) : super(name, weight, height);

  @override
  String getInfo() {
    return 'my dog $breed ' + super.getInfo();
  }
}

class CatAnimal extends Animal {
  String color;
  int taleLength;

  CatAnimal(this.color, this.taleLength, name, weight, height)
      : super(name, weight, height);

  void feed() {
    taleLength++;
  }

  @override
  String getInfo() {
    return 'cat $name tale Length is $taleLength';
  }
}

String infoAnimal(Animal a) => a.getInfo();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DogAnimal dog1 = DogAnimal('мопс', 'джек', 5, 10);
  CatAnimal cat1 = CatAnimal('серая ', 7, 'мурка', 5, 10);
  CatAnimal cat2 = CatAnimal('белая ', 8, 'мурзик', 3, 5);

  //List<Animal> _animals = [];
  List<Animal> _animals = [
    DogAnimal('мопс', 'джек', 5, 10),
    DogAnimal('овчарка', 'люси', 15, 10),
    CatAnimal('серая ', 7, 'мурлыка', 5, 100),
    CatAnimal('белая ', 8, 'мурзик', 3, 50),
  ];

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.centerLeft,
      child: Text(_animals[index].getInfo(),
          style: Theme.of(context).textTheme.caption),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: _animals.length,
        //itemExtent: 60.0,
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemBuilder: _listItemBuilder,
      ),
    );
  }
}
