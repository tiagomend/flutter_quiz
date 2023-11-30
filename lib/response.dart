import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final void Function() onSelect;

  const Response(this.text, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(235, 176, 44, 216),
            foregroundColor: Colors.white,
          ),
          onPressed: onSelect,
          child: Text(text),
        ),
      ),
    );
  }
}
