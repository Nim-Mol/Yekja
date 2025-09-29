import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  List<dynamic> reportedPosts = [];
  void addToReportedPosts(dynamic item) => reportedPosts.add(item);
  void removeFromReportedPosts(dynamic item) => reportedPosts.remove(item);
  void removeAtIndexFromReportedPosts(int index) =>
      reportedPosts.removeAt(index);
  void insertAtIndexInReportedPosts(int index, dynamic item) =>
      reportedPosts.insert(index, item);
  void updateReportedPostsAtIndex(int index, Function(dynamic) updateFn) =>
      reportedPosts[index] = updateFn(reportedPosts[index]);

  List<ReportedRow> reportedUsers = [];
  void addToReportedUsers(ReportedRow item) => reportedUsers.add(item);
  void removeFromReportedUsers(ReportedRow item) => reportedUsers.remove(item);
  void removeAtIndexFromReportedUsers(int index) =>
      reportedUsers.removeAt(index);
  void insertAtIndexInReportedUsers(int index, ReportedRow item) =>
      reportedUsers.insert(index, item);
  void updateReportedUsersAtIndex(int index, Function(ReportedRow) updateFn) =>
      reportedUsers[index] = updateFn(reportedUsers[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Dashboard widget.
  List<ReportedRow>? allReportedItems;
  // Stores action output result for [Custom Action - countActionString] action in Dashboard widget.
  int? reportedPost;
  // Stores action output result for [Backend Call - Query Rows] action in Dashboard widget.
  List<MonitoringLogsRow>? monitoringTable;
  // Stores action output result for [Custom Action - countActionString] action in Dashboard widget.
  int? totalClickShareProfile;
  // Stores action output result for [Custom Action - countActionString] action in Dashboard widget.
  int? signUpClick;
  // Stores action output result for [Custom Action - countActionString] action in Dashboard widget.
  int? gustUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
