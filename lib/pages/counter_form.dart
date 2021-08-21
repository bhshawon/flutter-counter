import 'package:counter/models/counter.dart';
import 'package:counter/pages/stats_page.dart';
import 'package:counter/services/counter_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CounterForm extends StatefulWidget {
  final Counter counter;
  final bool isEditing;

  CounterForm({Key key, this.counter, this.isEditing}) : super(key: key);

  @override
  _CounterFormState createState() => _CounterFormState();
}

class _CounterFormState extends State<CounterForm> {
  final CounterService _counterService = GetIt.instance.get<CounterService>();

  final _formKey = GlobalKey<FormState>();

  List<Widget> getFormChildren(
      TextEditingController nameController,
      TextEditingController numberController,
      TextEditingController goalController,
      Counter counter) {
    var children = new List<Widget>();

    if (widget.isEditing) {
      children.add(ElevatedButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => StatsPage(counter: counter)));
        },
        child: Text('View Stats'),
      ));
    }

    children.addAll([
      TextFormField(
        decoration: InputDecoration(labelText: "Title"),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        controller: nameController,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: "Initial value (Optional)"),
        keyboardType: TextInputType.number,
        controller: numberController,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: "Goal (Optional)"),
        keyboardType: TextInputType.number,
        controller: goalController,
      ),
      ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            counter.title = nameController.text;
            counter.value = numberController.text.isNotEmpty
                ? double.parse(numberController.text)
                : 0.0;
            counter.goal = goalController.text.isNotEmpty
                ? double.parse(goalController.text)
                : 0.0;

            if (widget.isEditing) {
              await _counterService.updateCounter(counter);
            } else {
              await _counterService.addCounter(counter);
            }

            Navigator.pop(context);
          }
        },
        child: Text('Submit'),
      )
    ]);

    return children;
  }

  @override
  Widget build(BuildContext context) {
    var counter = widget.isEditing
        ? widget.counter
        : new Counter(title: '', value: 0, goal: 0);
    TextEditingController nameController =
        TextEditingController(text: counter.title);
    TextEditingController numberController =
        TextEditingController(text: counter.value.toString());
    TextEditingController goalController =
        TextEditingController(text: counter.goal.toString());
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.all(5),
          child: Form(
            key: _formKey,
            child: Column(
              children: getFormChildren(
                  nameController, numberController, goalController, counter),
            ),
          ),
        ));
  }
}
