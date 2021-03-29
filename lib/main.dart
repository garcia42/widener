import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widener/permitData.dart';
import 'package:widener/permitsRequired.dart';
import 'package:widener/questions.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

//AKIA3T56EN2W5IJC6EGF
//N7xmjyNkSWJjwBQ4myj6pzzs910WBJ8E2LIsz7NI
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSubmitted = false;
  PermitData _permitData = PermitData(
    projectOwnerCityController: TextEditingController(),
    projectOwnerStateController: TextEditingController(),
    projectOwnerCountyController: TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
  }

  void onSubmit(PermitData permitData) {
    this.setState(() {
      _isSubmitted = true;
      _permitData = permitData;
    });
  }

  void onRevert() {
    this.setState(() {
      _isSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Widener Scope and Fee'),
            ),
            body: SafeArea(
              child: !_isSubmitted
                  ? Questions(permitData: _permitData, onSubmit: onSubmit)
                  : PermitsRequired(
                      permitData: _permitData, onRevert: this.onRevert),
            )));
  }
}
