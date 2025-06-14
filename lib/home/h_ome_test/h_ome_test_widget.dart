import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'h_ome_test_model.dart';
export 'h_ome_test_model.dart';

class HOmeTestWidget extends StatefulWidget {
  const HOmeTestWidget({super.key});

  static String routeName = 'HOmeTest';
  static String routePath = '/hOmeTest';

  @override
  State<HOmeTestWidget> createState() => _HOmeTestWidgetState();
}

class _HOmeTestWidgetState extends State<HOmeTestWidget> {
  late HOmeTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HOmeTestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
