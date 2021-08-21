import 'package:counter/constants/ui.dart';
import 'package:counter/pages/counter_form.dart';
import 'package:counter/pages/counters.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Statistics'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ),
      body: Center(
        child: Counters(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CounterForm(isEditing: false)))
              .then((value) => setState(() {}));
        },
        label: Text('+'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: UiColors.backGround,
    );
  }
}
