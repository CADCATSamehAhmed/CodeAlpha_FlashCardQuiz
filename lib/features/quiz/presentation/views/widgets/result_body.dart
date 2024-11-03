import 'package:flutter/material.dart';

class ResultBody extends StatelessWidget {
  final int score;
  const ResultBody({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$score points",style: const TextStyle(fontSize: 20,color: Colors.black),)
        ],
      ),
    );
  }
}
