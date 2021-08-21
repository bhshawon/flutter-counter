import 'package:counter/models/counter.dart';
import 'package:counter/pages/counter_item.dart';
import 'package:counter/services/counter_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Counters extends StatefulWidget {
  @override
  _CountersState createState() => _CountersState();
}

class _CountersState extends State<Counters> {
  final CounterService _counterService = GetIt.instance.get<CounterService>();

  Future<List<Counter>> listCounters() async {
    return _counterService.listCounters();
  }

  Widget countersWidget() {
    return FutureBuilder<List<Counter>>(
      builder: (context, countersSnap) {
        if (countersSnap.connectionState == ConnectionState.none ||
            countersSnap.hasData == false) {
          return Container();
        }
        return ListView.builder(
          itemCount: countersSnap.data.length,
          itemBuilder: (context, index) {
            Counter counter = countersSnap.data[index];
            return CounterItem(counter: counter);
          },
        );
      },
      future: listCounters(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      margin: EdgeInsets.all(10),
      child: countersWidget(),
    );
  }
}
