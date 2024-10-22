import 'package:flutter/material.dart';
import '../helpers/app_localization_context_extenstion.dart';

String getLocalizedString(BuildContext context, String key) {
  final localizationMap = {
    "app_title": context.localizedString.app_title,
    // "Raise Complaint":
    "Light Department": context.localizedString.light_department,
    "Raise Complaint": context.localizedString.raise_complaints_title,
    "Ongoing Complaints": context.localizedString.ongoing_complaints_title,
    "Completed Complaints": context.localizedString.completed_complaints_title,
    "Emergency Alerts": context.localizedString.emergency_alert_title,
    "Underground Drainage": context.localizedString.underground_drainage,
    "Solid Waste Management": context.localizedString.solid_waste_management,
    "Urban Community Development":
        context.localizedString.urban_community_development,
    "General Administrative": context.localizedString.general_administrative,
    "Integrated Child Development Services":
        context.localizedString.integrated_child_development_services,
    "Fire Department": context.localizedString.fire_department,
    "Health Department": context.localizedString.health_department,
    "Birth & Death Department":
        context.localizedString.birth_and_death_department,
    "Marriage": context.localizedString.marriage,
    "Water Works": context.localizedString.water_works,
    "Project & Town Planning":
        context.localizedString.project_and_town_planning,
    "Shop Executive": context.localizedString.shop_executive,
    "Public Relations Officer":
        context.localizedString.public_relations_officer,
    "Account & Tax Department":
        context.localizedString.account_and_tax_department,
    "Civil Department": context.localizedString.civil_department,
    "Low": context.localizedString.urgency_level_low,
    "Medium": context.localizedString.urgency_level_medium,
    "High": context.localizedString.urgency_level_high,
  };

  if (!localizationMap.containsKey(key)) {
    return "Localization missing for this : $key";
  }
  return localizationMap[key] ?? key;
}
