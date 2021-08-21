import 'dart:developer';

import 'package:counter/models/counter.dart';
import 'package:counter/models/stat.dart';
import 'package:counter/services/counter_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class StatsPage extends StatefulWidget {
  final Counter counter;
  final CounterService _counterService = GetIt.instance.get<CounterService>();

  StatsPage({key, this.counter}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  final CounterService _counterService = GetIt.instance.get<CounterService>();

  Future<List<Stat>> getCounterStats() async {
    return _counterService.getCounterStats(widget.counter.id);
  }

  var dropdownValue = "One";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: statsWidget(),
      ),
    );
  }

  Widget statsWidget() {
    return FutureBuilder<List<Stat>>(
      builder: (context, statsSnap) {
        if (statsSnap.connectionState == ConnectionState.none ||
            statsSnap.hasData == false) {
          return Container();
        }
        return ListView.builder(
          itemCount: statsSnap.data.length,
          itemBuilder: (context, index) {
            Stat stat = statsSnap.data[index];
            return Text(
                "${new DateTime.fromMillisecondsSinceEpoch(stat.date)} ${stat.value}");
          },
        );
      },
      future: getCounterStats(),
    );
  }
}
