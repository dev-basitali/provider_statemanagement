import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/counter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0 ;
  Timer? timer ;
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<Counter>(context, listen: false);
    timer = Timer.periodic(const Duration(seconds : 1), (timer) {
      provider.addCounter();
    });
  }
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build${count.toString()}');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(builder: (context , value , child){
              return  Text(value.counter.toString(),style: const TextStyle(fontSize: 35),);
            })

          ],
        ),
      ),
    );
  }
}
