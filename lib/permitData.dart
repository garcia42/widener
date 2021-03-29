import 'package:flutter/cupertino.dart';

import 'enumFile.dart';

class PermitData {
  FundingType? fundingType;
  ConstructionType? constructionType;
  RoadType? roadType;
  bool isWideningMoreThan15Percent = false;
  bool isWorkBelowOrdinaryHigh = false;
  bool structuresBelowOrdinaryHigh = false;
  bool willDredgeOrFillWetland = false;
  bool isByACriticalArea = false;
  bool adjacentOrOverFishBearingWater = false;
  bool halfAcreSoilDisturbance = false;
  bool isPollutantGenerating = false;
  bool isRowOrEasementRequired = false;
  bool stormWaterWillReachFishBearingWaters = false;
  bool newImperviousSurface = false;
  bool impactsWatersOfUS = false;
  bool openFishBearingWaters = false;
  bool wetlandOrDitches = false;

  TextEditingController projectOwnerCountyController;
  TextEditingController projectOwnerStateController;
  TextEditingController projectOwnerCityController;

  PermitData(
      {required this.projectOwnerStateController,
      required this.projectOwnerCountyController,
      required this.projectOwnerCityController});

  Set<Permits> permitsFromPermitData() {
    Set<Permits> permits = Set();
    if (this.fundingType == FundingType.federal) {
      permits.add(Permits.National_Environmental_Policy_Act_CE);
      permits.add(Permits.Section_106_Cultural_Resources);
    }
    if (this.newImperviousSurface) {
      if (this.isPollutantGenerating) {
        if (this.stormWaterWillReachFishBearingWaters) {
          permits.add(Permits.Section_7_Biological_Assessment);
          permits.add(Permits.National_Environmental_Policy_Act_EIS);
        } else {
          permits.add(Permits.National_Environmental_Policy_Act_EA);
        }
      } else {
        permits.add(Permits.National_Environmental_Policy_Act_CE);
      }
    }
    if (this.willDredgeOrFillWetland) {
      permits.add(Permits.US_Army_Section_404_Core_Permit);
    }
    if (this.halfAcreSoilDisturbance) {
      permits.add(Permits.Section_402_NPDS);
    }
    if (this.isByACriticalArea) {
      permits.add(Permits.Critical_Areas_Determination);
    }
    if (this.roadType == RoadType.New) {
      permits.add(Permits.Storm_Water_Report);
    }
    if (this.isWideningMoreThan15Percent) {
      permits.add(Permits.Storm_Water_Report);
    }
    if (this.constructionType == ConstructionType.bridge) {
      permits.add(Permits.Hydraulic_Permit_Approval);
      permits.add(Permits.Critical_Areas_Determination);
      permits.add(Permits.Shoreline_Permit);
    }
    if (this.isWorkBelowOrdinaryHigh) {
      permits.add(Permits.US_Army_Section_404_Core_Permit);
      permits.add(Permits.Water_Quality_Section_401_Permit);
    }
    if (this.structuresBelowOrdinaryHigh) {
      permits.add(Permits.Section_7_Biological_Assessment);
    }
    if (this.isRowOrEasementRequired) {
      permits.add(Permits.Agency_Coordination);
    }

    if (this.adjacentOrOverFishBearingWater) {
      permits.add(Permits.Hydraulic_Permit_Approval);
    }

    return permits;
  }
}
