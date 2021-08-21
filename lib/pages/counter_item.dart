import 'package:counter/constants/ui.dart';
import 'package:counter/models/counter.dart';
import 'package:counter/services/counter_service.dart';
import 'package:counter/utils/format_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'counter_form.dart';

class CounterItem extends StatefulWidget {
  final Counter counter;

  CounterItem({Key key, this.counter}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<CounterItem> {
  final CounterService _counterService = GetIt.instance.get<CounterService>();

  @override
  Widget build(BuildContext context) {
    var counter = widget.counter;
    var progress = 0.0;

    if (counter.goal != null && counter.goal > 0) {
      progress = counter.value / counter.goal;
    }

    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: UiElements.counterItemBorderRadius,
            child: LinearProgressIndicator(
              value: progress,
              valueColor:
                  AlwaysStoppedAnimation<Color>(UiColors.progressBarValue),
              backgroundColor: UiColors.progressBarBackground,
            ),
          )),
          buildItemContainer(counter)
        ]));
  }

  Container addOnTapEvent(Widget widget, Counter counter) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            CounterForm(counter: counter, isEditing: true)))
                .then((value) => setState(() {}));
          },
          child: widget),
    );
  }

  Container decorateItemContainer(Container container, double progress) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: UiElements.counterItemBorderRadius,
            child: LinearProgressIndicator(
              value: progress,
              valueColor:
                  AlwaysStoppedAnimation<Color>(UiColors.progressBarValue),
              backgroundColor: UiColors.progressBarBackground,
            ),
          )),
          container
        ]));
  }

  Container buildItemContainer(Counter counter) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: UiColors.itemBorder),
          borderRadius: UiElements.counterItemBorderRadius,
          color: Colors.white10),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(UiIcons.minusButton, color: Colors.red),
              onPressed: () async {
                counter.value -= 1;
                await _counterService.updateCounter(counter);
                this.setState(() {});
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: addOnTapEvent(
                Column(children: [
                  Text(
                    counter.title,
                    textScaleFactor: UiElements.counterTitleScaleFactor,
                    style: TextStyle(color: UiColors.counterTitle),
                  ),
                  Text(
                    FormatUtils.formatDouble(counter.value),
                    textScaleFactor: UiElements.counterValueScaleFactor,
                    style: TextStyle(color: UiColors.counterValue),
                  )
                ]),
                counter),
            flex: 5,
          ),
          Expanded(
            child: IconButton(
              icon: Icon(UiIcons.plusButton, color: Colors.green),
              onPressed: () async {
                counter.value += 1;
                await _counterService.updateCounter(counter);
                this.setState(() {});
              },
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
