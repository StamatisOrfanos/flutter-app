import 'package:flutter/material.dart';


class TextInputWidget extends StatefulWidget {
  final Function(String) callback;
  const TextInputWidget(this.callback, {super.key});

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
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
          controller: controller, 
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.message), 
            labelText: "Type a message:", 
            suffixIcon: IconButton(
              icon: const Icon(Icons.send), splashColor: Colors.blue, tooltip: "Send Massage", onPressed: click,
              )
            ), 
          );
  }
}

