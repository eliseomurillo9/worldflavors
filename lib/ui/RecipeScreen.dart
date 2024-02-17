import 'package:flutter/material.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orangeAccent,
        ),
      ),
      home: const RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('search'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Title',
            style: TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          FractionallySizedBox(
            widthFactor: 0.75,
            child: Image.network(
              'https://dxm.dam.savencia.com/api/wedia/dam/transform/fix635d9eidk6p661qfha99t5g7z8g6m3owhnda/original',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
