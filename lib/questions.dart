import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widener/permitData.dart';

import 'enumFile.dart';

class Questions extends StatefulWidget {
  final Function onSubmit;
  final PermitData permitData;

  Questions({required this.permitData, required this.onSubmit});

  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late PermitData _permitData;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    _permitData = widget.permitData;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [
      this._renderFundingSection(),
      ...this._renderAllQuestionsSection(),
      ...this._renderNewImperviousSurface(),
      this._renderProjectOwner(),
      ...this._renderWatersOfTheUS(),
      ...this._renderConstructionTypeSection()
    ];
    return Scrollbar(
        isAlwaysShown: true,
        child: Column(children: [
          Center(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: const Text(
                  'Scope and Fee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          ),
          Flexible(
              child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            padding: EdgeInsets.all(10.0),
            itemCount: rows.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(8.0),
              child: rows[index],
            ),
          )),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                onPressed: () => widget.onSubmit(_permitData),
                child: Text('Submit')),
          ),
        ]));
  }

//  List<Row> _renderRoadSection() {
//    return [
//      Row(
//        children: [
//          Expanded(
//              child: const Text('Is this a new road or widening an '
//                  'existing road?')),
//          Expanded(
//              child: ListTile(
//            title: Text(describeEnum(RoadType.New)),
//            leading: Radio(
//              value: RoadType.New,
//              groupValue: _permitData.roadType,
//              onChanged: (RoadType? value) {
//                setState(() {
//                  _permitData.roadType = value;
//                });
//              },
//            ),
//          )),
//          Expanded(
//              child: ListTile(
//            title: Text(describeEnum(RoadType.Widening)),
//            leading: Radio(
//              value: RoadType.Widening,
//              groupValue: _permitData.roadType,
//              onChanged: (RoadType? value) {
//                setState(() {
//                  _permitData.roadType = value;
//                });
//              },
//            ),
//          ))
//        ],
//      ),
//      if (_permitData.roadType == RoadType.Widening)
//        this._renderSwitchSection(_permitData.isWideningMoreThan15Percent,
//            SwitchType.RoadWideningFifteen)
//    ];
//  }

  Row _renderFundingSection() {
    return Row(children: [
      Expanded(child: const Text('What is the funding for this Project?')),
      Expanded(
          child: ListTile(
        title: const Text('Federal'),
        leading: Radio(
          value: FundingType.federal,
          groupValue: _permitData.fundingType,
          onChanged: (FundingType? value) {
            setState(() {
              _permitData.fundingType = value;
            });
          },
        ),
      )),
      Expanded(
          child: ListTile(
        title: const Text('State'),
        leading: Radio(
          value: FundingType.state,
          groupValue: _permitData.fundingType,
          onChanged: (FundingType? value) {
            setState(() {
              _permitData.fundingType = value;
            });
          },
        ),
      ))
    ]);
  }

  List<Row> _renderAllQuestionsSection() {
    return [
      this._renderSwitchSection(
          _permitData.isByACriticalArea, SwitchType.CriticalArea),
      this._renderSwitchSection(_permitData.adjacentOrOverFishBearingWater,
          SwitchType.AdjacentOrOverFishBearingWater),
      this._renderSwitchSection(
          _permitData.isRowOrEasementRequired, SwitchType.RowOrEasement),
      this._renderSwitchSection(_permitData.halfAcreSoilDisturbance,
          SwitchType.HalfAcreSoilDisturbance),
    ];
  }

  Row _renderSwitchSection(bool switchBool, SwitchType switchType) {
    Switch switchy = Switch(
      value: switchBool,
      onChanged: (value) {
        setState(() {
          switch (switchType) {
            case SwitchType.DredgeOrFillWetland:
              _permitData.willDredgeOrFillWetland = value;
              break;
            case SwitchType.CriticalArea:
              _permitData.isByACriticalArea = value;
              break;
            case SwitchType.RoadWideningFifteen:
              _permitData.isWideningMoreThan15Percent = value;
              break;
            case SwitchType.AdjacentOrOverFishBearingWater:
              _permitData.adjacentOrOverFishBearingWater = value;
              break;
            case SwitchType.BelowOrdinaryHighWaterMark:
              _permitData.isWorkBelowOrdinaryHigh = value;
              break;
            case SwitchType.StructuresBelowHighWaterMark:
              _permitData.structuresBelowOrdinaryHigh = value;
              break;
            case SwitchType.HalfAcreSoilDisturbance:
              _permitData.halfAcreSoilDisturbance = value;
              break;
            case SwitchType.RowOrEasement:
              _permitData.isRowOrEasementRequired = value;
              break;
            case SwitchType.ImperviousSurface:
              _permitData.newImperviousSurface = value;
              break;
            case SwitchType.IsPollutantGenerating:
              _permitData.isPollutantGenerating = value;
              break;
            case SwitchType.StormWaterFishBearingWaters:
              _permitData.stormWaterWillReachFishBearingWaters = value;
              break;
            case SwitchType.WatersOfTheUS:
              _permitData.impactsWatersOfUS = value;
              break;
            case SwitchType.OpenFishBearingWaters:
              _permitData.openFishBearingWaters = value;
              break;
            case SwitchType.WetlandOrDitches:
              _permitData.wetlandOrDitches = value;
              break;
          }
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
    return Row(
      children: [
        Expanded(child: Text(textForSwitch(switchType))),
        switchy,
      ],
    );
  }

  List<Row> _renderConstructionTypeSection() {
    DropdownButton dropdownButton = DropdownButton<ConstructionType>(
      value: _permitData.constructionType,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (ConstructionType? newValue) {
        setState(() {
          _permitData.constructionType = newValue;
        });
      },
      items: ConstructionType.values
          .map<DropdownMenuItem<ConstructionType>>((ConstructionType value) {
        return DropdownMenuItem<ConstructionType>(
          value: value,
          child: Text(describeEnum(value)),
        );
      }).toList(),
    );

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Is it a built road, bridge, building, water structure?'),
          dropdownButton
        ],
      ),
    ];
  }

  List<Row> _renderNewImperviousSurface() {
    List<Row> rows = [
      this._renderSwitchSection(
          _permitData.newImperviousSurface, SwitchType.ImperviousSurface)
    ];
    if (_permitData.newImperviousSurface) {
      rows.add(this._renderSwitchSection(
          _permitData.isPollutantGenerating, SwitchType.IsPollutantGenerating));
      if (_permitData.isPollutantGenerating) {
        rows.add(this._renderSwitchSection(
            _permitData.stormWaterWillReachFishBearingWaters,
            SwitchType.StormWaterFishBearingWaters));
      }
    }
    return rows;
  }

  List<Row> _renderWatersOfTheUS() {
    List<Row> rows = [
      this._renderSwitchSection(
          _permitData.impactsWatersOfUS, SwitchType.WatersOfTheUS),
    ];
    if (_permitData.impactsWatersOfUS) {
      rows.add(this._renderSwitchSection(_permitData.isWorkBelowOrdinaryHigh,
          SwitchType.BelowOrdinaryHighWaterMark));
      rows.add(this._renderSwitchSection(
          _permitData.openFishBearingWaters, SwitchType.OpenFishBearingWaters));
      rows.add(this._renderSwitchSection(
          _permitData.wetlandOrDitches, SwitchType.WetlandOrDitches));
    }
    return rows;
  }

  Widget _renderProjectOwner() {
    return Column(
      children: [
        Row(
          children: [const Text('Who is the project owner?')],
        ),
        Row(
          children: [
            SizedBox(
              width: 70,
              child: const Text('State'),
            ),
            Expanded(
                child: TextField(
              controller: _permitData.projectOwnerStateController,
              decoration: InputDecoration(
                labelText: 'Enter the State',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
              ),
            )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 70,
              child: const Text('County'),
            ),
            Expanded(
                child: TextField(
              controller: _permitData.projectOwnerCountyController,
              decoration: InputDecoration(
                labelText: 'Enter the County',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
              ),
            )),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 70,
              child: const Text('City'),
            ),
            Expanded(
                child: TextField(
              controller: _permitData.projectOwnerCityController,
              decoration: InputDecoration(
                labelText: 'Enter the City',
                errorText: _validate ? 'Value Can\'t Be Empty' : null,
              ),
            )),
          ],
        ),
      ],
    );
  }
}
