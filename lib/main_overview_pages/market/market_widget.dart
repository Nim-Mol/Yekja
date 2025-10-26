import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main_overview_pages/item_card_global/item_card_global_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/shout_out_card/shout_out_card_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'market_model.dart';
export 'market_model.dart';

class MarketWidget extends StatefulWidget {
  const MarketWidget({
    super.key,
    required this.selectedTab,
  });

  final int? selectedTab;

  static String routeName = 'Market';
  static String routePath = '/market';

  @override
  State<MarketWidget> createState() => _MarketWidgetState();
}

class _MarketWidgetState extends State<MarketWidget>
    with TickerProviderStateMixin {
  late MarketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.tabBarController!.animateTo(
          widget.selectedTab!,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      unselectedLabelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'q6o9bjar' /* Community Market */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '7w4oeybw' /* Voluntary Support */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '1y5mye93' /* Skills & Expertise */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'ijphs52w' /* Events & Announcements */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '40jyx1y4' /* Careers & Networking */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'n10nwwc2' /* Businesses  */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 2,
                              catId: 1,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewMarketPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewMarket();
                          },
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 1,
                              catId: 8,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewSupportPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewSupport();
                          },
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 3,
                              catId: 10,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewSkillsPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewSkills();
                          },
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 4,
                              catId: 16,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewEventsPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewEvents();
                          },
                          () async {},
                          () async {}
                        ][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 1,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  1
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/o2bnof2or890/iran.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lhv4rbl0' /* Transfer
Parcels */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 2,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  2
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/a8zq0ym905ah/exchange_.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'e75me3ra' /* Currency
Exchanges */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 3,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  3
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/73egaf2hucf5/ticket_swap.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '7nejfzx6' /* Ticket
Swaps */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      3
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 4,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  4
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/pepva0f2egqn/sell_and_buy.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'upzdzqfj' /* Selling
Items */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      4
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 5,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  5
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/m16buys7jx2x/giveaway.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '0a5argz8' /* Give
Away */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      5
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 6,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 134.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  6
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/lib0xs6vsq6z/item_swap.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'fez7bxzs' /* Exchange
Items */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      6
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                    .updateFilterSmallStruct(
                                                  (e) => e..catId = 7,
                                                );
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  7
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/b3vl8s1594q2/Rent.png',
                                                          width: 75.0,
                                                          height: 75.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '445vvqa5' /* Homes &
Rentals */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FFAppState()
                                                                          .filterSmall
                                                                          .catId ==
                                                                      7
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .midgray,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownSortValueController1 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: List<String>.from([
                                                'created_at.desc.nullslast',
                                                'post_likes.desc.nullslast,created_at.desc'
                                              ]),
                                              optionLabels: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'dvxs0iu7' /* Recent */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'x8u4gjyb' /* Popular */,
                                                )
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownSortValue1 = val);
                                                _model.sortBy =
                                                    _model.dropDownSortValue1!;
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewMarketPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewMarket();
                                              },
                                              width: 100.0,
                                              height: 34.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'z03svtjd' /* Sort by */,
                                              ),
                                              icon: Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 18.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              borderWidth: 0.3,
                                              borderRadius: 24.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        safeSetState(() => _model
                                            .listviewMarketPagingController
                                            ?.refresh());
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>.separated(
                                        pagingController:
                                            _model.setListviewMarketController(
                                          (nextPageMarker) =>
                                              FilterApiCall.call(
                                            offset:
                                                nextPageMarker.nextPageNumber *
                                                    (_model.limit!),
                                            limit: _model.limit,
                                            mainCatId: valueOrDefault<int>(
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId,
                                              2,
                                            ),
                                            catId: valueOrDefault<int>(
                                              FFAppState().filterSmall.catId,
                                              1,
                                            ),
                                            sortby: valueOrDefault<String>(
                                              _model.sortBy,
                                              'created_at.desc.nullslast',
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          80.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, filterResultsIndex) {
                                            final filterResultsItem = _model
                                                .listviewMarketPagingController!
                                                .itemList![filterResultsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PostWidget.routeName,
                                                  queryParameters: {
                                                    'postID': serializeParam(
                                                      filterResultsItem.postId,
                                                      ParamType.String,
                                                    ),
                                                    'detailDataName':
                                                        serializeParam(
                                                      filterResultsItem
                                                          .detailTable,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .itemCardGlobalModels1
                                                    .getModel(
                                                  filterResultsItem.postId,
                                                  filterResultsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardGlobalWidget(
                                                  key: Key(
                                                    'Key2wn_${filterResultsItem.postId}',
                                                  ),
                                                  profileId:
                                                      filterResultsItem.userId,
                                                  postId:
                                                      filterResultsItem.postId,
                                                  detailTable: filterResultsItem
                                                      .detailTable,
                                                  itemData:
                                                      ItemCardGlobalStruct(
                                                    title:
                                                        filterResultsItem.title,
                                                    description:
                                                        filterResultsItem
                                                            .description,
                                                    itemLocation:
                                                        filterResultsItem.city,
                                                    createdAt: functions
                                                        .parseIsoToLocal(
                                                            filterResultsItem
                                                                .createdAt),
                                                    catID:
                                                        filterResultsItem.catId,
                                                    itemLikes: filterResultsItem
                                                        .postLikes,
                                                    mainImagePath: getJsonField(
                                                              filterResultsItem
                                                                  .toMap(),
                                                              r'''$.images[0]''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            filterResultsItem
                                                                .toMap(),
                                                            r'''$.images[0]''',
                                                          ).toString()
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    postUserId:
                                                        filterResultsItem
                                                            .userId,
                                                    avatar: filterResultsItem
                                                                    .profileAvatar !=
                                                                null &&
                                                            filterResultsItem
                                                                    .profileAvatar !=
                                                                ''
                                                        ? filterResultsItem
                                                            .profileAvatar
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                    subCatName:
                                                        filterResultsItem
                                                            .subCatName,
                                                  ),
                                                  details:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsText),
                                                  detailsString: getJsonField(
                                                    filterResultsItem.toMap(),
                                                    r'''$.details''',
                                                  ).toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 8,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSupportPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSupport();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    8
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/7alx2zdgj1ln/assistance.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xvimr1m0' /* Care &
Assistance */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        8
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 9,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSupportPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSupport();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    9
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/6zotdcab6flq/peer.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'to4790zt' /* Peer-
Support */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        9
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownSortValueController2 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from([
                                                  'created_at.desc.nullslast',
                                                  'post_likes.desc.nullslast,created_at.desc'
                                                ]),
                                                optionLabels: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'q09sh78q' /* Recent */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'c6z26gh2' /* Popular */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .dropDownSortValue2 =
                                                      val);
                                                  _model.sortBy = _model
                                                      .dropDownSortValue2!;
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSupportPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSupport();
                                                },
                                                width: 100.0,
                                                height: 34.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'czt2og66' /* Sort by */,
                                                ),
                                                icon: Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textfiled,
                                                borderWidth: 0.3,
                                                borderRadius: 24.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        safeSetState(() => _model
                                            .listviewSupportPagingController
                                            ?.refresh());
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>.separated(
                                        pagingController:
                                            _model.setListviewSupportController(
                                          (nextPageMarker) =>
                                              FilterApiCall.call(
                                            offset:
                                                nextPageMarker.nextPageNumber *
                                                    (_model.limit!),
                                            limit: _model.limit,
                                            mainCatId: valueOrDefault<int>(
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId,
                                              2,
                                            ),
                                            catId: valueOrDefault<int>(
                                              FFAppState().filterSmall.catId,
                                              1,
                                            ),
                                            sortby: valueOrDefault<String>(
                                              _model.sortBy,
                                              'created_at.desc.nullslast',
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          80.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, filterResultsIndex) {
                                            final filterResultsItem = _model
                                                .listviewSupportPagingController!
                                                .itemList![filterResultsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PostWidget.routeName,
                                                  queryParameters: {
                                                    'postID': serializeParam(
                                                      filterResultsItem.postId,
                                                      ParamType.String,
                                                    ),
                                                    'detailDataName':
                                                        serializeParam(
                                                      filterResultsItem
                                                          .detailTable,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .itemCardGlobalModels2
                                                    .getModel(
                                                  filterResultsItem.postId,
                                                  filterResultsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardGlobalWidget(
                                                  key: Key(
                                                    'Key9i0_${filterResultsItem.postId}',
                                                  ),
                                                  profileId:
                                                      filterResultsItem.userId,
                                                  postId:
                                                      filterResultsItem.postId,
                                                  detailTable: filterResultsItem
                                                      .detailTable,
                                                  itemData:
                                                      ItemCardGlobalStruct(
                                                    title:
                                                        filterResultsItem.title,
                                                    description:
                                                        filterResultsItem
                                                            .description,
                                                    itemLocation:
                                                        filterResultsItem.city,
                                                    createdAt: functions
                                                        .parseIsoToLocal(
                                                            filterResultsItem
                                                                .createdAt),
                                                    catID:
                                                        filterResultsItem.catId,
                                                    itemLikes: filterResultsItem
                                                        .postLikes,
                                                    mainImagePath: getJsonField(
                                                              filterResultsItem
                                                                  .toMap(),
                                                              r'''$.images[0]''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            filterResultsItem
                                                                .toMap(),
                                                            r'''$.images[0]''',
                                                          ).toString()
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    postUserId:
                                                        filterResultsItem
                                                            .userId,
                                                    avatar: filterResultsItem
                                                                    .profileAvatar !=
                                                                null &&
                                                            filterResultsItem
                                                                    .profileAvatar !=
                                                                ''
                                                        ? filterResultsItem
                                                            .profileAvatar
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                    subCatName:
                                                        filterResultsItem
                                                            .subCatName,
                                                  ),
                                                  details:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsText),
                                                  detailsString: getJsonField(
                                                    filterResultsItem.toMap(),
                                                    r'''$.details''',
                                                  ).toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 0.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4240C057),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.handshake_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor1,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jbbatmul' /* Community Shoutouts */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeIsCustom,
                                                          ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                          FutureBuilder<
                                              List<CommunityShoutoutRow>>(
                                            future: CommunityShoutoutTable()
                                                .queryRows(
                                              queryFn: (q) =>
                                                  q.order('created_at'),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitChasingDots(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .greenInit,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CommunityShoutoutRow>
                                                  rowCommunityShoutoutRowList =
                                                  snapshot.data!;

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                          rowCommunityShoutoutRowList
                                                              .length, (rowIndex) {
                                                    final rowCommunityShoutoutRow =
                                                        rowCommunityShoutoutRowList[
                                                            rowIndex];
                                                    return wrapWithModel(
                                                      model: _model
                                                          .shoutOutCardModels
                                                          .getModel(
                                                        rowCommunityShoutoutRow
                                                            .id
                                                            .toString(),
                                                        rowIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ShoutOutCardWidget(
                                                        key: Key(
                                                          'Key5ip_${rowCommunityShoutoutRow.id.toString()}',
                                                        ),
                                                        shoutOutId:
                                                            rowCommunityShoutoutRow
                                                                .id,
                                                      ),
                                                    );
                                                  })
                                                      .divide(
                                                          SizedBox(width: 16.0))
                                                      .addToStart(
                                                          SizedBox(width: 16.0))
                                                      .addToEnd(SizedBox(
                                                          width: 16.0)),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ].addToEnd(SizedBox(height: 80.0)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 10,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    10
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/f8ckduu6jhul/Transport.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'kccxuk3b' /* Transport
& Logistics */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        10
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 11,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    11
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/dlnylj7v62bc/home%26services.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'gzwc3wn6' /* Home
& Services */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        11
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 12,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    12
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/lm5nrgozge2w/education.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'es9rzsh2' /* Education
& Coaching */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        12
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 13,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    13
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/5dwzpvco35ay/body.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tro57wlg' /* Body
& Care */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        13
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 14,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    14
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/s17ng6xwzq9x/Art.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'zzoozb1b' /* Arts, Culture
Community */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        14
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 15,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  height: 134.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    15
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/ez4nwken36dy/creative.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'aq6ocaqj' /* Creative 
& Digital */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        15
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                height: 134.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  6
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'yivcsxxp' /* Exchange
Items */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                height: 134.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  6
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ibapwag9' /* Exchange
Items */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownSortValueController3 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from([
                                                  'created_at.desc.nullslast',
                                                  'post_likes.desc.nullslast,created_at.desc'
                                                ]),
                                                optionLabels: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'c9jgszbk' /* Recent */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vs677ope' /* Popular */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .dropDownSortValue3 =
                                                      val);
                                                  _model.sortBy = _model
                                                      .dropDownSortValue3!;
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                width: 100.0,
                                                height: 34.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'rr93b4j7' /* Sort by */,
                                                ),
                                                icon: Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textfiled,
                                                borderWidth: 0.3,
                                                borderRadius: 24.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        safeSetState(() => _model
                                            .listviewSkillsPagingController
                                            ?.refresh());
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>.separated(
                                        pagingController:
                                            _model.setListviewSkillsController(
                                          (nextPageMarker) =>
                                              FilterApiCall.call(
                                            offset:
                                                nextPageMarker.nextPageNumber *
                                                    (_model.limit!),
                                            limit: _model.limit,
                                            mainCatId: valueOrDefault<int>(
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId,
                                              2,
                                            ),
                                            catId: valueOrDefault<int>(
                                              FFAppState().filterSmall.catId,
                                              1,
                                            ),
                                            sortby: valueOrDefault<String>(
                                              _model.sortBy,
                                              'created_at.desc.nullslast',
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          80.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, filterResultsIndex) {
                                            final filterResultsItem = _model
                                                .listviewSkillsPagingController!
                                                .itemList![filterResultsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PostWidget.routeName,
                                                  queryParameters: {
                                                    'postID': serializeParam(
                                                      filterResultsItem.postId,
                                                      ParamType.String,
                                                    ),
                                                    'detailDataName':
                                                        serializeParam(
                                                      filterResultsItem
                                                          .detailTable,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .itemCardGlobalModels3
                                                    .getModel(
                                                  filterResultsItem.postId,
                                                  filterResultsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardGlobalWidget(
                                                  key: Key(
                                                    'Keyq89_${filterResultsItem.postId}',
                                                  ),
                                                  profileId:
                                                      filterResultsItem.userId,
                                                  postId:
                                                      filterResultsItem.postId,
                                                  detailTable: filterResultsItem
                                                      .detailTable,
                                                  itemData:
                                                      ItemCardGlobalStruct(
                                                    title:
                                                        filterResultsItem.title,
                                                    description:
                                                        filterResultsItem
                                                            .description,
                                                    itemLocation:
                                                        filterResultsItem.city,
                                                    createdAt: functions
                                                        .parseIsoToLocal(
                                                            filterResultsItem
                                                                .createdAt),
                                                    catID:
                                                        filterResultsItem.catId,
                                                    itemLikes: filterResultsItem
                                                        .postLikes,
                                                    mainImagePath: getJsonField(
                                                              filterResultsItem
                                                                  .toMap(),
                                                              r'''$.images[0]''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            filterResultsItem
                                                                .toMap(),
                                                            r'''$.images[0]''',
                                                          ).toString()
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    postUserId:
                                                        filterResultsItem
                                                            .userId,
                                                    avatar: filterResultsItem
                                                                    .profileAvatar !=
                                                                null &&
                                                            filterResultsItem
                                                                    .profileAvatar !=
                                                                ''
                                                        ? filterResultsItem
                                                            .profileAvatar
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                    subCatName:
                                                        filterResultsItem
                                                            .subCatName,
                                                  ),
                                                  details:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsText),
                                                  detailsString: getJsonField(
                                                    filterResultsItem.toMap(),
                                                    r'''$.details''',
                                                  ).toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 16,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    16
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uxppcti8zjw1/Culture.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '58nv5tei' /* Cultural
& Social */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        16
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 17,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    17
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/9mwcf0csxbkl/concert_(1).png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xip09fov' /* Concerts
& Shows */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        17
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 18,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    18
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/ai7a6myrds2c/event-3.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'c655fk0g' /* Art &
Exhibition */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        18
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 19,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    19
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/536onp55yi6u/workshop.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'y85mmnsr' /* Workshop
& Training */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        19
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 21,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    21
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/5vhp7ynotpwc/game_Night.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm4l7xo2j' /* Game Nights */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        21
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 22,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 134.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .filterSmall
                                                                        .catId ==
                                                                    22
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/xvhnq44d78co/Sport.png',
                                                            width: 75.0,
                                                            height: 75.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '39npjjn8' /* Sport
Events */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FFAppState().filterSmall.catId ==
                                                                        22
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .midgray,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                height: 135.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 0.3,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .filterSmall
                                                                      .catId ==
                                                                  7
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '6bc1921m' /* Homes &
Rentals */
                                                          ,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 10.0)),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e..catId = 7,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                child: Container(
                                                  height: 135.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '9hhtvn8g' /* Homes &
Rentals */
                                                            ,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 16.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownSortValueController4 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from([
                                                  'created_at.desc.nullslast',
                                                  'post_likes.desc.nullslast,created_at.desc'
                                                ]),
                                                optionLabels: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dc06nkgi' /* Recent */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'i3smswcl' /* Popular */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .dropDownSortValue4 =
                                                      val);
                                                  _model.sortBy = _model
                                                      .dropDownSortValue4!;
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewEventsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewEvents();
                                                },
                                                width: 100.0,
                                                height: 34.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'borgvgtn' /* Sort by */,
                                                ),
                                                icon: Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .textfiled,
                                                borderWidth: 0.3,
                                                borderRadius: 24.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        safeSetState(() => _model
                                            .listviewEventsPagingController
                                            ?.refresh());
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>.separated(
                                        pagingController:
                                            _model.setListviewEventsController(
                                          (nextPageMarker) =>
                                              FilterApiCall.call(
                                            offset:
                                                nextPageMarker.nextPageNumber *
                                                    (_model.limit!),
                                            limit: _model.limit,
                                            mainCatId: valueOrDefault<int>(
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId,
                                              2,
                                            ),
                                            catId: valueOrDefault<int>(
                                              FFAppState().filterSmall.catId,
                                              1,
                                            ),
                                            sortby: valueOrDefault<String>(
                                              _model.sortBy,
                                              'created_at.desc.nullslast',
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          80.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitChasingDots(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, filterResultsIndex) {
                                            final filterResultsItem = _model
                                                .listviewEventsPagingController!
                                                .itemList![filterResultsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  PostWidget.routeName,
                                                  queryParameters: {
                                                    'postID': serializeParam(
                                                      filterResultsItem.postId,
                                                      ParamType.String,
                                                    ),
                                                    'detailDataName':
                                                        serializeParam(
                                                      filterResultsItem
                                                          .detailTable,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .itemCardGlobalModels4
                                                    .getModel(
                                                  filterResultsItem.postId,
                                                  filterResultsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardGlobalWidget(
                                                  key: Key(
                                                    'Keynj2_${filterResultsItem.postId}',
                                                  ),
                                                  profileId:
                                                      filterResultsItem.userId,
                                                  postId:
                                                      filterResultsItem.postId,
                                                  detailTable: filterResultsItem
                                                      .detailTable,
                                                  itemData:
                                                      ItemCardGlobalStruct(
                                                    title:
                                                        filterResultsItem.title,
                                                    description:
                                                        filterResultsItem
                                                            .description,
                                                    itemLocation:
                                                        filterResultsItem.city,
                                                    createdAt: functions
                                                        .parseIsoToLocal(
                                                            filterResultsItem
                                                                .createdAt),
                                                    catID:
                                                        filterResultsItem.catId,
                                                    itemLikes: filterResultsItem
                                                        .postLikes,
                                                    mainImagePath: getJsonField(
                                                              filterResultsItem
                                                                  .toMap(),
                                                              r'''$.images[0]''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            filterResultsItem
                                                                .toMap(),
                                                            r'''$.images[0]''',
                                                          ).toString()
                                                        : null,
                                                    postUserId:
                                                        filterResultsItem
                                                            .userId,
                                                    avatar: filterResultsItem
                                                                    .profileAvatar !=
                                                                null &&
                                                            filterResultsItem
                                                                    .profileAvatar !=
                                                                ''
                                                        ? filterResultsItem
                                                            .profileAvatar
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                    subCatName:
                                                        filterResultsItem
                                                            .subCatName,
                                                  ),
                                                  details:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsText),
                                                  detailsString: getJsonField(
                                                    filterResultsItem.toMap(),
                                                    r'''$.details''',
                                                  ).toString(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x417950F2), Color(0xFFF19B40)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '1rno7sox' /* FEATURE COMING SOON! */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lightGray,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 20.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '75r1mvgw' /* Careers Hub */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF484275),
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zCfTnCN4IRBlV0rHAl5X/assets/9z5v0zj6p3fm/career_icon.png',
                                      width: 100.0,
                                      height: 90.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'skml1g5k' /* Explore diverse possibilities ... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '28cuze9u' /* WANT EARLY ACCESS? */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: Color(0xFFF19B40),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0tjf9rxi' /* Contact us to be among the fir... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Color(0xFFF19B40),
                                        size: 20.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'btc0b3mg' /* Advertise a job */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Color(0xFFF19B40),
                                        size: 20.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          't2g7q2vk' /* Request a job */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Color(0xFFF19B40),
                                        size: 20.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'oo1boqiv' /* Join or organize networking ev... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Color(0xFFF19B40),
                                        size: 20.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          's26idz17' /* Start-up partnership and inves... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Color(0xFFF19B40),
                                        size: 20.0,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '6r3xblu7' /* Set up recruiters profiles */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .greenInit,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .greenInit,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 20.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'r7268ko2' /* JOIN THE WAITLLIST */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'aadqle57' /* Learn more about this feature */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            decoration:
                                                TextDecoration.underline,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 48.0, 0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.network(
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zCfTnCN4IRBlV0rHAl5X/assets/max4kgaklgqn/logo_1_(1).png',
                                          width: 50.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0x417950F2),
                                FlutterFlowTheme.of(context).priceTagEventy
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'e2d4ut8h' /* FEATURE COMING SOON! */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lightGray,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 20.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'zp7vejy9' /* Business Profiles */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF484275),
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 36.0, 0.0, 16.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/zCfTnCN4IRBlV0rHAl5X/assets/h79kct69pga5/firm_3.png',
                                      width: 110.0,
                                      height: 100.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'b3gzlga0' /* We're working hard to bring yo... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'kw9kshu4' /* WANT TO BE AMONG THE FIRST? */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF70D4FF),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ybvnqjpe' /* Contact us to set up your prof... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .greenInit,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .greenInit,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 4.0, 20.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'tztmvy08' /* CONTACT SUPPORT */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeIsCustom,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '2ipt83o6' /* See an example business profil... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            decoration:
                                                TextDecoration.underline,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => safeSetState(() {}),
                child: NavBarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
