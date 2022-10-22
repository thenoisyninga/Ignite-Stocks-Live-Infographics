import 'package:flutter/material.dart';

class StockGraph extends StatelessWidget {
  const StockGraph({super.key, required this.industryName, required this.delGroupName});

  final String industryName;
  final String delGroupName;

  @override
  Widget build(BuildContext context) {
    return Text(
      'The Stock Graph for $industryName for Group $delGroupName.'
    );
  }
}