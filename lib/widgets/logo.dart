import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String title;

  const Logo({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: 170,
      child: Column(
        children: <Widget>[
          Image.asset('assets/tag-logo.png'),
          const SizedBox(height: 20),
          Text(this.title, style: const TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
