import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import '/shared_components/swipe_cards/swipe_cards_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'swipable_model.dart';
export 'swipable_model.dart';

class SwipableWidget extends StatefulWidget {
  const SwipableWidget({super.key});

  static String routeName = 'Swipable';
  static String routePath = '/swipablePage';

  @override
  State<SwipableWidget> createState() => _SwipableWidgetState();
}

class _SwipableWidgetState extends State<SwipableWidget> {
  late SwipableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipableModel());

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
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 480.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            FFLocalizations.of(context).getText(
                              'c9tbt5vm' /* Discover Local Offers & Reques... */,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'FarsiFonts',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: wrapWithModel(
                          model: _model.swipeCardsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SwipeCardsWidget(),
                        ),
                      ),
                    ].addToStart(SizedBox(height: 24.0)),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.reportBugModel,
                    updateCallback: () => safeSetState(() {}),
                    child: ReportBugWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
