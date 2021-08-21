import 'package:counter/pages/counter_form.dart';
import 'package:counter/pages/my_home_page.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MyHomePage(),
        '/counters/add': (context) => CounterForm(),
      },
    );
  }
}
