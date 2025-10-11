import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/item_card_horizontal2_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/search_filter/filter_comp/filter_comp_widget.dart';
import '/shared_components/loading_comp/loading_comp_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({
    super.key,
    this.searchTermParam,
    required this.navigateBackTo,
  });

  final String? searchTermParam;
  final String? navigateBackTo;

  static String routeName = 'SearchPage';
  static String routePath = '/searchPage';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.searchTermParam != null && widget.searchTermParam != '') {
        FFAppState().updateFilterAppStateStruct(
          (e) => e..searchTerm = widget.searchTermParam,
        );
        safeSetState(() {});
        safeSetState(() => _model.listViewSearchPagingController?.refresh());
        await _model.waitForOnePageForListViewSearch();
      }
    });

    _model.searchwidgetTextController1 ??=
        TextEditingController(text: FFAppState().filterAppState.searchTerm);

    _model.searchwidgetTextController2 ??=
        TextEditingController(text: FFAppState().filterAppState.searchTerm);

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
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedCat = 1;
                                    safeSetState(() {});
                                    if (functions.listContainsInt(
                                        FFAppState()
                                            .filterAppState
                                            .catId
                                            .toList(),
                                        _model.selectedCat!)) {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.remove(_model.selectedCat),
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.add(_model.selectedCat!),
                                          ),
                                      );
                                      safeSetState(() {});
                                    }

                                    safeSetState(() => _model
                                        .listViewSearchPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForListViewSearch();
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: functions.listContainsInt(
                                                  FFAppState()
                                                      .filterAppState
                                                      .catId
                                                      .toList(),
                                                  1)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x42F25081),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.back_hand,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .red2,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qlxrtif2' /* Help
Requests */
                                                  ,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedCat = 2;
                                    safeSetState(() {});
                                    if (functions.listContainsInt(
                                        FFAppState()
                                            .filterAppState
                                            .catId
                                            .toList(),
                                        _model.selectedCat!)) {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.remove(_model.selectedCat),
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.add(_model.selectedCat!),
                                          ),
                                      );
                                      safeSetState(() {});
                                    }

                                    safeSetState(() => _model
                                        .listViewSearchPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForListViewSearch();
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: functions.listContainsInt(
                                                  FFAppState()
                                                      .filterAppState
                                                      .catId
                                                      .toList(),
                                                  2)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x4040C057),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.handsHelping,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor1,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zxm6qhi3' /* Help
Offers */
                                                  ,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedCat = 3;
                                    safeSetState(() {});
                                    if (functions.listContainsInt(
                                        FFAppState()
                                            .filterAppState
                                            .catId
                                            .toList(),
                                        _model.selectedCat!)) {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.remove(_model.selectedCat),
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.add(_model.selectedCat!),
                                          ),
                                      );
                                      safeSetState(() {});
                                    }

                                    safeSetState(() => _model
                                        .listViewSearchPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForListViewSearch();
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: functions.listContainsInt(
                                                  FFAppState()
                                                      .filterAppState
                                                      .catId
                                                      .toList(),
                                                  3)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x430593D7),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.peopleArrows,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .iconEventy,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7kdb5dt1' /* Items for Exchange */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedCat = 4;
                                    safeSetState(() {});
                                    if (functions.listContainsInt(
                                        FFAppState()
                                            .filterAppState
                                            .catId
                                            .toList(),
                                        _model.selectedCat!)) {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.remove(_model.selectedCat),
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.add(_model.selectedCat!),
                                          ),
                                      );
                                      safeSetState(() {});
                                    }

                                    safeSetState(() => _model
                                        .listViewSearchPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForListViewSearch();
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: functions.listContainsInt(
                                                  FFAppState()
                                                      .filterAppState
                                                      .catId
                                                      .toList(),
                                                  4)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x42FAB005),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.restore_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .yellow1,
                                                  size: 26.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'iqukbo0v' /* Borrow
Requests */
                                                  ,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selectedCat = 5;
                                    safeSetState(() {});
                                    if (functions.listContainsInt(
                                        FFAppState()
                                            .filterAppState
                                            .catId
                                            .toList(),
                                        _model.selectedCat!)) {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.remove(_model.selectedCat),
                                          ),
                                      );
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().updateFilterAppStateStruct(
                                        (e) => e
                                          ..updateCatId(
                                            (e) => e.add(_model.selectedCat!),
                                          ),
                                      );
                                      safeSetState(() {});
                                    }

                                    safeSetState(() => _model
                                        .listViewSearchPagingController
                                        ?.refresh());
                                    await _model
                                        .waitForOnePageForListViewSearch();
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: functions.listContainsInt(
                                                  FFAppState()
                                                      .filterAppState
                                                      .catId
                                                      .toList(),
                                                  5)
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x42C850F2),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.gift,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .magenta1,
                                                  size: 22.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ix9u3yl7' /* Items for
Free */
                                                  ,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 10.0))
                                  .addToStart(SizedBox(width: 16.0))
                                  .addToEnd(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'h96yelv3' /* Searh Results */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      await showDialog(
                                        barrierColor: Color(0xAF0E0E0E),
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(dialogContext)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: FilterCompWidget(
                                                navigateRoute:
                                                    widget.navigateBackTo!,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '1je8wpdn' /* Filter */,
                                    ),
                                    icon: Icon(
                                      Icons.filter_list_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 28.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .titleSmallIsCustom,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            safeSetState(() => _model
                                .listViewSearchPagingController
                                ?.refresh());
                          },
                          child:
                              PagedListView<ApiPagingParams, dynamic>.separated(
                            pagingController:
                                _model.setListViewSearchController(
                              (nextPageMarker) => SearchfilerapiCall.call(
                                offset: nextPageMarker.nextPageNumber *
                                    (_model.limit!),
                                limit: _model.limit,
                                term: FFAppState().filterAppState.searchTerm,
                                sortby: FFAppState().filterAppState.sortBy,
                                catIdsCsv: functions.csvIntOrNull(
                                    FFAppState().filterAppState.catId.toList(),
                                    FFAppState().alICsv),
                                subCatIdsCsv: functions.csvIntOrNull(
                                    FFAppState()
                                        .filterAppState
                                        .subCatId
                                        .toList(),
                                    FFAppState().alICsv),
                                cityIdsCsv: functions.csvIntOrNull(
                                    FFAppState().filterAppState.cityId.toList(),
                                    FFAppState().alICsv),
                                verifiedCsv: functions.csvBoolorNull(
                                    FFAppState().filterAppState.yekjaVerified),
                                likes: FFAppState().filterAppState.likes,
                                hasimg: functions.csvBoolorNull(
                                    FFAppState().filterAppState.yekjaVerified),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            primary: false,
                            shrinkWrap: true,
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            separatorBuilder: (_, __) => SizedBox(height: 16.0),
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) =>
                                  LoadingCompWidget(),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) =>
                                  LoadingCompWidget(),

                              itemBuilder: (context, _, searchResultsIndex) {
                                final searchResultsItem = _model
                                    .listViewSearchPagingController!
                                    .itemList![searchResultsIndex];
                                return Container(
                                  width: 1000.0,
                                  height: 100.0,
                                  child: custom_widgets.LtrWrapper(
                                    width: 1000.0,
                                    height: 100.0,
                                    builder: () => ItemCardHorizontal2Widget(
                                      mainCatID: searchResultsItem.mainCatId,
                                      image: getJsonField(
                                        searchResultsItem.toMap(),
                                        r'''$.images[0]''',
                                      ).toString(),
                                      catName: searchResultsItem.catName,
                                      subCatName: searchResultsItem.subCatName,
                                      title: searchResultsItem.title,
                                      description:
                                          searchResultsItem.description,
                                      city: searchResultsItem.userCity,
                                      likes: searchResultsItem.postLikes,
                                      postID: searchResultsItem.sourceId,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(height: 50.0))
                        .addToEnd(SizedBox(height: 100.0)),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarWidget(),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Stack(
                  children: [
                    if (FFLocalizations.of(context).languageCode != 'fa')
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget.navigateBackTo ==
                                                'overviewMarket') {
                                              context.pushNamed(
                                                  OverviewMarketWidget
                                                      .routeName);
                                            } else {
                                              if (widget.navigateBackTo ==
                                                  'overviewCare') {
                                                context.pushNamed(
                                                    OverviewCareWidget
                                                        .routeName);
                                              } else {
                                                context.pushNamed(
                                                    HomePageWidget.routeName);
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF232426),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_back,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 44.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Autocomplete<String>(
                                                initialValue: TextEditingValue(
                                                    text: FFAppState()
                                                        .filterAppState
                                                        .searchTerm),
                                                optionsBuilder:
                                                    (textEditingValue) {
                                                  if (textEditingValue.text ==
                                                      '') {
                                                    return const Iterable<
                                                        String>.empty();
                                                  }
                                                  return [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q4ar00pn' /* Option 1 */,
                                                    )
                                                  ].where((option) {
                                                    final lowercaseOption =
                                                        option.toLowerCase();
                                                    return lowercaseOption
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase());
                                                  });
                                                },
                                                optionsViewBuilder: (context,
                                                    onSelected, options) {
                                                  return AutocompleteOptionsList(
                                                    textFieldKey:
                                                        _model.searchwidgetKey1,
                                                    textController: _model
                                                        .searchwidgetTextController1!,
                                                    options: options.toList(),
                                                    onSelected: onSelected,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    textHighlightStyle:
                                                        TextStyle(),
                                                    elevation: 4.0,
                                                    optionBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    optionHighlightColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    maxHeight: 200.0,
                                                  );
                                                },
                                                onSelected: (String selection) {
                                                  safeSetState(() => _model
                                                          .searchwidgetSelectedOption1 =
                                                      selection);
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                fieldViewBuilder: (
                                                  context,
                                                  textEditingController,
                                                  focusNode,
                                                  onEditingComplete,
                                                ) {
                                                  _model.searchwidgetFocusNode1 =
                                                      focusNode;

                                                  _model.searchwidgetTextController1 =
                                                      textEditingController;
                                                  return TextFormField(
                                                    key:
                                                        _model.searchwidgetKey1,
                                                    controller:
                                                        textEditingController,
                                                    focusNode: focusNode,
                                                    onEditingComplete:
                                                        onEditingComplete,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '7uu9uavl' /* Search */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF232426),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF232426),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .searchwidgetTextController1Validator
                                                        .asValidator(context),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterAppStateStruct(
                                                    (e) => e
                                                      ..searchTerm = _model
                                                          .searchwidgetTextController1
                                                          .text,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listViewSearchPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListViewSearch();
                                                },
                                                child: Icon(
                                                  Icons.search_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 26.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isSearch = false;
                                          _model.searchText = '';
                                          safeSetState(() {});
                                          FFAppState().filterAppState =
                                              FilterModel2Struct
                                                  .fromSerializableMap(jsonDecode(
                                                      '{\"main_cat_id\":\"[]\",\"user_city\":\"[]\",\"cat_id\":\"[]\",\"cat_name\":\"[]\",\"sub_cat_id\":\"[]\",\"sub_cat_name\":\"[]\",\"exchange_wishlist_id\":\"[]\",\"YekjaVerified\":\"[]\",\"city_id\":\"[]\"}'));
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.searchwidgetTextController1
                                                    ?.text =
                                                FFAppState()
                                                    .filterAppState
                                                    .searchTerm;
                                          });
                                          safeSetState(() => _model
                                              .listViewSearchPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListViewSearch();
                                        },
                                        child: Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF232426),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            border: Border.all(
                                              color: Color(0xFF232426),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.refresh,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      ),
                    if (FFLocalizations.of(context).languageCode == 'fa')
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isSearch = false;
                                          _model.searchText = '';
                                          safeSetState(() {});
                                          FFAppState().filterAppState =
                                              FilterModel2Struct
                                                  .fromSerializableMap(jsonDecode(
                                                      '{\"main_cat_id\":\"[]\",\"user_city\":\"[]\",\"cat_id\":\"[]\",\"cat_name\":\"[]\",\"sub_cat_id\":\"[]\",\"sub_cat_name\":\"[]\",\"exchange_wishlist_id\":\"[]\",\"YekjaVerified\":\"[]\",\"city_id\":\"[]\"}'));
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.searchwidgetTextController2
                                                    ?.text =
                                                FFAppState()
                                                    .filterAppState
                                                    .searchTerm;
                                          });
                                          safeSetState(() => _model
                                              .listViewSearchPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListViewSearch();
                                        },
                                        child: Container(
                                          width: 44.0,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF232426),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            border: Border.all(
                                              color: Color(0xFF232426),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.refresh,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 44.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Autocomplete<String>(
                                                initialValue: TextEditingValue(
                                                    text: FFAppState()
                                                        .filterAppState
                                                        .searchTerm),
                                                optionsBuilder:
                                                    (textEditingValue) {
                                                  if (textEditingValue.text ==
                                                      '') {
                                                    return const Iterable<
                                                        String>.empty();
                                                  }
                                                  return [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8b3no9i7' /* Option 1 */,
                                                    )
                                                  ].where((option) {
                                                    final lowercaseOption =
                                                        option.toLowerCase();
                                                    return lowercaseOption
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase());
                                                  });
                                                },
                                                optionsViewBuilder: (context,
                                                    onSelected, options) {
                                                  return AutocompleteOptionsList(
                                                    textFieldKey:
                                                        _model.searchwidgetKey2,
                                                    textController: _model
                                                        .searchwidgetTextController2!,
                                                    options: options.toList(),
                                                    onSelected: onSelected,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                    textHighlightStyle:
                                                        TextStyle(),
                                                    elevation: 4.0,
                                                    optionBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    optionHighlightColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    maxHeight: 200.0,
                                                  );
                                                },
                                                onSelected: (String selection) {
                                                  safeSetState(() => _model
                                                          .searchwidgetSelectedOption2 =
                                                      selection);
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                fieldViewBuilder: (
                                                  context,
                                                  textEditingController,
                                                  focusNode,
                                                  onEditingComplete,
                                                ) {
                                                  _model.searchwidgetFocusNode2 =
                                                      focusNode;

                                                  _model.searchwidgetTextController2 =
                                                      textEditingController;
                                                  return TextFormField(
                                                    key:
                                                        _model.searchwidgetKey2,
                                                    controller:
                                                        textEditingController,
                                                    focusNode: focusNode,
                                                    onEditingComplete:
                                                        onEditingComplete,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'kd5mjjjg' /* Search */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF232426),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0),
                                                        ),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color(0xFF232426),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .searchwidgetTextController2Validator
                                                        .asValidator(context),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterAppStateStruct(
                                                    (e) => e
                                                      ..searchTerm = _model
                                                          .searchwidgetTextController2
                                                          .text,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listViewSearchPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListViewSearch();
                                                },
                                                child: Icon(
                                                  Icons.search_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 26.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (widget.navigateBackTo ==
                                                'overviewMarket') {
                                              context.pushNamed(
                                                  OverviewMarketWidget
                                                      .routeName);
                                            } else {
                                              if (widget.navigateBackTo ==
                                                  'overviewCare') {
                                                context.pushNamed(
                                                    OverviewCareWidget
                                                        .routeName);
                                              } else {
                                                context.pushNamed(
                                                    HomePageWidget.routeName);
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF232426),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
