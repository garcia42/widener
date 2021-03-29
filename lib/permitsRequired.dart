import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widener/permitData.dart';

import 'enumFile.dart';

class PermitsRequired extends StatelessWidget {
  final PermitData? permitData;
  final Function onRevert;
  const PermitsRequired({required this.permitData, required this.onRevert});

  List<Row> _renderPermits() {
    Set<Permits> permits = permitData!.permitsFromPermitData();
    List<Row> permitRows = [];
    for (Permits permit in permits) {
      permitRows.add(Row(
        children: [Text(describeEnum(permit))],
      ));
    }
    return permitRows;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
      Center(
          child: Column(
        children: [
          const Text('Scope and Fee Components',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          ...this._renderPermits(),
          ElevatedButton(onPressed: () => {onRevert()}, child: Text('Revert')),
        ],
      ))
    ]);
  }
}
