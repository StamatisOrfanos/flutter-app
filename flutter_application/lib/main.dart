import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Social Media App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 114, 113, 112)), 
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello")), 
      body: Column(
        children: [TextInputWidget(), Text(this.text)],
        )
      );
  }

}


class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  
  @override
  void dispose() { 
    super.dispose(); 
    controller.dispose();
  }

  // Callback to get the value from the text of this widget.
  // TextInputWidget() -> class TextInputWidget extends StatefulWidget -> class _TextInputWidgetState extends State<TextInputWidget>
  void click() {

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
          controller: controller, 
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message), 
            labelText: "Type a message:", 
            suffixIcon: IconButton(
              icon: Icon(Icons.send), splashColor: Colors.blue, tooltip: "Send Massage", onPressed: click,
              )
            ), 
          );
  }
}