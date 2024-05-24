import 'package:flutter/material.dart';

class ComputationScreen extends StatefulWidget {
  @override
  _ComputationScreenState createState() => _ComputationScreenState();
}

class _ComputationScreenState extends State<ComputationScreen> {
  int result = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _startComputation();
  }

  void _startComputation() {
    const int chunkSize = 1000000;
    int currentSum = 0;
    int currentIndex = 0;
    final int totalIterations = 100000000;

    void computeChunk() {
      setState(() {
        for (int i = 0; i < chunkSize; i++) {
          if (currentIndex < totalIterations) {
            currentSum += currentIndex;
            currentIndex++;
          } else {
            result = currentSum;
            isLoading = false;
            return;
          }
        }
      });

      if (isLoading) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          computeChunk();
        });
      }
    }

    computeChunk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heavy Computation')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text('Result: $result'),
      ),
    );
  }
}
