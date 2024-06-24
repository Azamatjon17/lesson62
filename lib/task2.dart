import 'package:flutter/material.dart';
import 'dart:async';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  late List<Widget> items;
  late ScrollController _scrollController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currentIndex < items.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollToIndex(_currentIndex);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * (MediaQuery.of(context).size.width - 50), // item width + margin
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    items = [
      Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 250,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.red,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 250,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width - 50,
        height: 250,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.chalet_outlined),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < items.length; i++) items[i],
            ],
          ),
        ),
      ),
    );
  }
}
