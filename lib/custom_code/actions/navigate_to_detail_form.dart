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

// Note: FlutterFlow usually provides the necessary imports for navigation functions
// like go_router's context.pushNamed, but we'll include the standard GoRouter import
// in case it's needed, though the actual function names may vary slightly in FF's generated code.

// IMPORTANT: In FlutterFlow, define the argument:
// 1. detailTable: Type 'String'
// Output should be 'None' (void)
// CRITICAL SETUP STEP: Ensure the "Include BuildContext" toggle is turned ON
// in the Custom Action configuration panel in FlutterFlow.

Future<void> navigateToDetailForm(
    BuildContext context, String detailTable) async {
  // We'll use context.pushNamed to navigate to the appropriate page.
  // The new page naming convention is Detail[Type] (e.g., DetailSales).

  String? targetPageName;

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
      // If the detailTable is unknown, navigate to a safe default page or show an error.
      print('ERROR: Unknown detail table name: $detailTable');
      targetPageName = 'HomePage'; // Fallback page
      break;
  }

  if (targetPageName != null) {
    // Navigate using the context and the determined page name
    context.pushNamed(targetPageName);
  }
}
