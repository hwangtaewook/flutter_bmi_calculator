import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/result/result_view_model.dart';

class ResultScreen extends StatefulWidget {
  final double height;
  final double weight;
  final ResultViewModel resultViewModel;

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
    required this.resultViewModel,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    widget.resultViewModel.calcBMI(widget.height, widget.weight);
  }

  Widget _buildIcon(double bmi) {
    Icon icon = const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.yellow,
      size: 100,
    );

    if (widget.resultViewModel.bmi >= 23) {
      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.yellow,
        size: 100,
      );
    } else if (widget.resultViewModel.bmi >= 18.5) {
      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.green,
        size: 100,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.resultViewModel.result,
              style: const TextStyle(fontSize: 46),
            ),
            _buildIcon(widget.resultViewModel.bmi),
          ],
        ),
      ),
    );
  }
}
