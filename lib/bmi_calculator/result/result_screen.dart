import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: Text(
          '결과',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '정상',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              Icons.sentiment_satisfied_alt,
              color: Colors.green,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
