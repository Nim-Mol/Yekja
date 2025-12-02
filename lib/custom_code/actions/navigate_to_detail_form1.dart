// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future navigateToDetailForm1(
  BuildContext context,
  String detailTable,
  String? navRoute,
) async {
  String targetPageName;
  switch (detailTable) {
    case 'sales':
      targetPageName = 'DetailSales';
      break;
    case 'rentals':
      targetPageName = 'DetailRentals';
      break;
    case 'skills_and_expertise':
      targetPageName = 'DetailSkills';
      break;
    case 'careers':
      targetPageName = 'DetailCareers';
      break;
    case 'give_away':
      targetPageName = 'DetailGiveAway';
      break;
    case 'transfer':
      targetPageName = 'DetailTransfer';
      break;
    case 'swap_items':
      targetPageName = 'DetailSwapItems';
      break;
    case 'ticket_swap':
      targetPageName = 'DetailTicketSwap';
      break;
    case 'currency_exchange':
      targetPageName = 'DetailCurrencyExchange';
      break;
    case 'care_and_assistance':
      targetPageName = 'DetailCareAndAssistance';
      break;
    case 'events':
      targetPageName = 'DetailEvents';
      break;
    default:
      targetPageName = 'HomePage';
      break;
  }

  final effectiveNavRoute = (navRoute != null && navRoute.trim().isNotEmpty)
      ? navRoute.trim()
      : 'HomePage';

  context.pushNamed(
    targetPageName,
    queryParameters: {
      'navRoute': serializeParam(effectiveNavRoute, ParamType.String),
    }.withoutNulls,
  );
}
