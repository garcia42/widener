enum FundingType { federal, state }
enum ConstructionType { road, bridge, facility, water_structure, combination }
enum RoadType { New, Widening }
enum Permits {
  National_Environmental_Policy_Act_CE,
  National_Environmental_Policy_Act_EIS,
  National_Environmental_Policy_Act_EA,
  Section_106_Cultural_Resources,
  Endangered_Species_Act,
  State_Environmental_Protection_Act,
  Executive_Order_0505,
  Critical_Areas_Determination,
  US_Army_Section_404_Core_Permit,
  Section_402_NPDS,
  Storm_Water_Report,
  Hydraulic_Permit_Approval,
  Shoreline_Permit,
  Water_Quality_Section_401_Permit,
  Section_7_Biological_Assessment,
  Agency_Coordination,
}

enum SwitchType {
  DredgeOrFillWetland,
  CriticalArea,
  RoadWideningFifteen,
  AdjacentOrOverFishBearingWater,
  BelowOrdinaryHighWaterMark,
  StructuresBelowHighWaterMark,
  HalfAcreSoilDisturbance,
  RowOrEasement,
  ImperviousSurface,
  IsPollutantGenerating,
  StormWaterFishBearingWaters,
  WatersOfTheUS,
  OpenFishBearingWaters,
  WetlandOrDitches,
}

String textForSwitch(SwitchType switchType) {
  switch (switchType) {
    case SwitchType.BelowOrdinaryHighWaterMark:
      return "Will work below the ordinary high water mark be done?";
    case SwitchType.DredgeOrFillWetland:
      return "Construction will dredge or fill in a wetland?";
    case SwitchType.CriticalArea:
      return "Is the project by a critical area?";
    case SwitchType.RoadWideningFifteen:
      return "Is this a new road or widening an existing road?";
    case SwitchType.AdjacentOrOverFishBearingWater:
      return "Is structure adjacent to or over fish bearing water?";
    case SwitchType.StructuresBelowHighWaterMark:
      return "Will you construct permanent/temporary structures below the ordinary high water mark?";
    case SwitchType.HalfAcreSoilDisturbance:
      return "Will there be more than half an acre of soil disturbance?";
    case SwitchType.RowOrEasement:
      return "Is ROW or an easement required?";
    case SwitchType.ImperviousSurface:
      return "New impervious surface?";
    case SwitchType.IsPollutantGenerating:
      return "Is pollutant generating?";
    case SwitchType.StormWaterFishBearingWaters:
      return "Will permanent stormwater reach fish bearing waters?";
    case SwitchType.WatersOfTheUS:
      return "Will construction impact waters of the US?";
    case SwitchType.OpenFishBearingWaters:
      return "Will construction impact open fish bearing waters?";
    case SwitchType.WetlandOrDitches:
      return "Will construction impact open wetlands or ditches?";
  }
}
