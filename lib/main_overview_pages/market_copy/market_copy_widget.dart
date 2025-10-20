import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'market_copy_model.dart';
export 'market_copy_model.dart';

class MarketCopyWidget extends StatefulWidget {
  const MarketCopyWidget({
    super.key,
    int? maincatIDpar,
  }) : this.maincatIDpar = maincatIDpar ?? 2;

  final int maincatIDpar;

  static String routeName = 'MarketCopy';
  static String routePath = '/marketCopy';

  @override
  State<MarketCopyWidget> createState() => _MarketCopyWidgetState();
}

class _MarketCopyWidgetState extends State<MarketCopyWidget> {
  late MarketCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarketCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().filterSmall = FilterSmallModelStruct(
        mainCatId: 2,
        catId: 2,
      );
      safeSetState(() {});
    });

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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().updateFilterSmallStruct(
                                            (e) => e..catId = 1,
                                          );
                                          safeSetState(() {});
                                          safeSetState(() => _model
                                              .listViewCat1PagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListViewCat1();
                                        },
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                          .filterSmall
                                                          .catId ==
                                                      1
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              width: 0.3,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Temp/p1.jpeg',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6xvyo72x' /* Community
Transfer */
                                                    ,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().updateFilterSmallStruct(
                                            (e) => e..catId = 2,
                                          );
                                          safeSetState(() {});
                                          safeSetState(() => _model
                                              .lisviewCat2PagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForLisviewCat2();
                                        },
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                          .filterSmall
                                                          .catId ==
                                                      2
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              width: 0.3,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Temp/p1.jpeg',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wm9er71t' /* Currency
Exchange */
                                                    ,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().updateFilterSmallStruct(
                                            (e) => e..catId = 3,
                                          );
                                          safeSetState(() {});
                                          safeSetState(() => _model
                                              .listviewCat3PagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListviewCat3();
                                        },
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                          .filterSmall
                                                          .catId ==
                                                      3
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              width: 0.3,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Temp/p1.jpeg',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'lbnwyxxh' /* Ticket
Swap */
                                                    ,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
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
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().updateFilterSmallStruct(
                                            (e) => e..catId = 4,
                                          );
                                          safeSetState(() {});
                                          safeSetState(() => _model
                                              .listviewCat4PagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForListviewCat4();
                                        },
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                          .filterSmall
                                                          .catId ==
                                                      4
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              width: 0.3,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Temp/b1.png',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bfbc9erh' /* Buy &
Sell */
                                                    ,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.catID = 5;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                          .filterSmall
                                                          .catId ==
                                                      5
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              width: 0.3,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Temp/b1.png',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'c8wsa8c0' /* Give
Away */
                                                    ,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.catID = 6;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: FFAppState()
                                                          .filterSmall
                                                          .catId ==
                                                      6
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .textfiled,
                                              width: 0.3,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Temp/b1.png',
                                                  width: 80.0,
                                                  height: 80.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4k24dhq9' /* Swap
Items */
                                                    ,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].addToEnd(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'kcom6g5u' /* Top Categories */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 12.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'crcofdig' /* Categories members like the mo... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmallFamily,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmallIsCustom,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Builder(
                                        builder: (context) {
                                          final subCats = FFAppState()
                                              .SubcatApp
                                              .where((e) =>
                                                  e.catId == _model.catID)
                                              .toList()
                                              .take(10)
                                              .toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: List.generate(
                                                      subCats.length,
                                                      (subCatsIndex) {
                                                final subCatsItem =
                                                    subCats[subCatsIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (_model.subcatIDs
                                                          .contains(subCatsItem
                                                              .subCatId)) {
                                                        _model
                                                            .removeFromSubcatIDs(
                                                                subCatsItem
                                                                    .subCatId);
                                                        safeSetState(() {});
                                                      } else {
                                                        _model.addToSubcatIDs(
                                                            subCatsItem
                                                                .subCatId);
                                                        safeSetState(() {});
                                                      }

                                                      safeSetState(() => _model
                                                          .listViewCat1PagingController
                                                          ?.refresh());
                                                      await _model
                                                          .waitForOnePageForListViewCat1();
                                                    },
                                                    child: Container(
                                                      height: 36.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .subcatIDs
                                                                  .contains(
                                                                      subCatsItem
                                                                          .subCatId)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .textfiled,
                                                          width: 0.3,
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          subCatsItem
                                                              .subCatName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmallIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                                  .divide(SizedBox(width: 8.0))
                                                  .addToStart(
                                                      SizedBox(width: 16.0))
                                                  .addToEnd(
                                                      SizedBox(width: 16.0)),
                                            ),
                                          );
                                        },
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
                                  child: Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: 50.0,
                                            child: Stack(
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'uki9srzc' /* Recent Listings */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                                .filterAppState =
                                                            FilterModel2Struct
                                                                .fromSerializableMap(
                                                                    jsonDecode(
                                                                        '{\"main_cat_id\":\"[]\",\"user_city\":\"[]\",\"cat_id\":\"[]\",\"cat_name\":\"[]\",\"sub_cat_id\":\"[]\",\"sub_cat_name\":\"[]\",\"exchange_wishlist_id\":\"[]\",\"YekjaVerified\":\"[]\",\"city_id\":\"[]\"}'));
                                                        safeSetState(() {});
                                                        FFAppState()
                                                            .updateFilterAppStateStruct(
                                                          (e) => e
                                                            ..updateCatId(
                                                              (e) => e.add(3),
                                                            ),
                                                        );
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                          SearchPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'navigateBackTo':
                                                                serializeParam(
                                                              'overviewMarket',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: 90.0,
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    30.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -0.3,
                                                                      0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'n1teotq4' /* Sort by */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'dmtc5rhg' /* Most recent offers or requests */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallIsCustom,
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
                                ),
                              ),
                            ].addToStart(SizedBox(height: 50.0)),
                          ),
                        ),
                        if (FFAppState().filterSmall.catId == 1)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(() => _model
                                      .listViewCat1PagingController
                                      ?.refresh());
                                },
                                child: PagedListView<ApiPagingParams, dynamic>(
                                  pagingController:
                                      _model.setListViewCat1Controller(
                                    (nextPageMarker) => FilterApiCall.call(
                                      offset: nextPageMarker.nextPageNumber *
                                          (_model.limit!),
                                      limit: _model.limit,
                                      mainCatId:
                                          FFAppState().filterSmall.mainCatId,
                                      catId: FFAppState().filterSmall.catId,
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
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder:
                                        (context, _, filterResultsIndex) {
                                      final filterResultsItem = _model
                                          .listViewCat1PagingController!
                                          .itemList![filterResultsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            PostWidget.routeName,
                                            queryParameters: {
                                              'postID': serializeParam(
                                                getJsonField(
                                                  filterResultsItem.toMap(),
                                                  r'''$.post_id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'detailDataName': serializeParam(
                                                filterResultsItem.detailTable,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .itemCardHorizentalModels1
                                              .getModel(
                                            filterResultsItem.postId,
                                            filterResultsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemCardHorizentalWidget(
                                            key: Key(
                                              'Keyokg_${filterResultsItem.postId}',
                                            ),
                                            itemData: ItemCardHorizentalStruct(
                                              title: filterResultsItem.title,
                                              description:
                                                  filterResultsItem.description,
                                              itemLocation:
                                                  filterResultsItem.city,
                                              catID: filterResultsItem.catId,
                                              itemLikes:
                                                  filterResultsItem.postLikes,
                                              createdAt:
                                                  functions.parseIsoToLocal(
                                                      filterResultsItem
                                                          .createdAt),
                                              mainImagePath: getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      ) !=
                                                      null
                                                  ? valueOrDefault<String>(
                                                      getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      )?.toString(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    )
                                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                              postUserId:
                                                  filterResultsItem.userId,
                                            ),
                                            profileId: filterResultsItem.userId,
                                            postId: filterResultsItem.postId,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filterSmall.catId == 2)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(() => _model
                                      .lisviewCat2PagingController
                                      ?.refresh());
                                },
                                child: PagedListView<ApiPagingParams, dynamic>(
                                  pagingController:
                                      _model.setLisviewCat2Controller(
                                    (nextPageMarker) => FilterApiCall.call(
                                      offset: nextPageMarker.nextPageNumber *
                                          (_model.limit!),
                                      limit: _model.limit,
                                      mainCatId: _model.mainCatID,
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
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder:
                                        (context, _, filterResultsIndex) {
                                      final filterResultsItem = _model
                                          .lisviewCat2PagingController!
                                          .itemList![filterResultsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            PostWidget.routeName,
                                            queryParameters: {
                                              'postID': serializeParam(
                                                getJsonField(
                                                  filterResultsItem.toMap(),
                                                  r'''$.post_id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'detailDataName': serializeParam(
                                                filterResultsItem.detailTable,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .itemCardHorizentalModels2
                                              .getModel(
                                            filterResultsItem.postId,
                                            filterResultsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemCardHorizentalWidget(
                                            key: Key(
                                              'Key8vo_${filterResultsItem.postId}',
                                            ),
                                            itemData: ItemCardHorizentalStruct(
                                              title: filterResultsItem.title,
                                              description:
                                                  filterResultsItem.description,
                                              itemLocation:
                                                  filterResultsItem.city,
                                              catID: filterResultsItem.catId,
                                              itemLikes:
                                                  filterResultsItem.postLikes,
                                              createdAt:
                                                  functions.parseIsoToLocal(
                                                      filterResultsItem
                                                          .createdAt),
                                              mainImagePath: getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      ) !=
                                                      null
                                                  ? valueOrDefault<String>(
                                                      getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      )?.toString(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    )
                                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                              postUserId:
                                                  filterResultsItem.userId,
                                            ),
                                            profileId: filterResultsItem.userId,
                                            postId: filterResultsItem.postId,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filterSmall.catId == 3)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(() => _model
                                      .listviewCat3PagingController
                                      ?.refresh());
                                },
                                child: PagedListView<ApiPagingParams, dynamic>(
                                  pagingController:
                                      _model.setListviewCat3Controller(
                                    (nextPageMarker) => FilterApiCall.call(
                                      offset: nextPageMarker.nextPageNumber *
                                          (_model.limit!),
                                      limit: _model.limit,
                                      mainCatId:
                                          FFAppState().filterSmall.mainCatId,
                                      catId: FFAppState().filterSmall.catId,
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
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder:
                                        (context, _, filterResultsIndex) {
                                      final filterResultsItem = _model
                                          .listviewCat3PagingController!
                                          .itemList![filterResultsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            PostWidget.routeName,
                                            queryParameters: {
                                              'postID': serializeParam(
                                                getJsonField(
                                                  filterResultsItem.toMap(),
                                                  r'''$.post_id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'detailDataName': serializeParam(
                                                filterResultsItem.detailTable,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .itemCardHorizentalModels3
                                              .getModel(
                                            filterResultsItem.postId,
                                            filterResultsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemCardHorizentalWidget(
                                            key: Key(
                                              'Key11s_${filterResultsItem.postId}',
                                            ),
                                            itemData: ItemCardHorizentalStruct(
                                              title: filterResultsItem.title,
                                              description:
                                                  filterResultsItem.description,
                                              itemLocation:
                                                  filterResultsItem.city,
                                              catID: filterResultsItem.catId,
                                              itemLikes:
                                                  filterResultsItem.postLikes,
                                              createdAt:
                                                  functions.parseIsoToLocal(
                                                      filterResultsItem
                                                          .createdAt),
                                              mainImagePath: getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      ) !=
                                                      null
                                                  ? valueOrDefault<String>(
                                                      getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      )?.toString(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    )
                                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                              postUserId:
                                                  filterResultsItem.userId,
                                            ),
                                            profileId: filterResultsItem.userId,
                                            postId: filterResultsItem.postId,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (FFAppState().filterSmall.catId == 4)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(() => _model
                                      .listviewCat4PagingController
                                      ?.refresh());
                                },
                                child: PagedListView<ApiPagingParams, dynamic>(
                                  pagingController:
                                      _model.setListviewCat4Controller(
                                    (nextPageMarker) => FilterApiCall.call(
                                      offset: nextPageMarker.nextPageNumber *
                                          (_model.limit!),
                                      limit: _model.limit,
                                      mainCatId:
                                          FFAppState().filterSmall.mainCatId,
                                      catId: FFAppState().filterSmall.mainCatId,
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
                                  builderDelegate:
                                      PagedChildBuilderDelegate<dynamic>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitChasingDots(
                                          color: FlutterFlowTheme.of(context)
                                              .greenInit,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder:
                                        (context, _, filterResultsIndex) {
                                      final filterResultsItem = _model
                                          .listviewCat4PagingController!
                                          .itemList![filterResultsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            PostWidget.routeName,
                                            queryParameters: {
                                              'postID': serializeParam(
                                                getJsonField(
                                                  filterResultsItem.toMap(),
                                                  r'''$.post_id''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'detailDataName': serializeParam(
                                                filterResultsItem.detailTable,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model
                                              .itemCardHorizentalModels4
                                              .getModel(
                                            filterResultsItem.postId,
                                            filterResultsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ItemCardHorizentalWidget(
                                            key: Key(
                                              'Keyv8g_${filterResultsItem.postId}',
                                            ),
                                            itemData: ItemCardHorizentalStruct(
                                              title: filterResultsItem.title,
                                              description:
                                                  filterResultsItem.description,
                                              itemLocation:
                                                  filterResultsItem.city,
                                              catID: filterResultsItem.catId,
                                              itemLikes:
                                                  filterResultsItem.postLikes,
                                              createdAt:
                                                  functions.parseIsoToLocal(
                                                      filterResultsItem
                                                          .createdAt),
                                              mainImagePath: getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      ) !=
                                                      null
                                                  ? valueOrDefault<String>(
                                                      getJsonField(
                                                        filterResultsItem
                                                            .toMap(),
                                                        r'''$.images[0]''',
                                                      )?.toString(),
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                    )
                                                  : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                              postUserId:
                                                  filterResultsItem.userId,
                                            ),
                                            profileId: filterResultsItem.userId,
                                            postId: filterResultsItem.postId,
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
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWidget(),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    height: 50.0,
                    constraints: BoxConstraints(
                      maxWidth: 480.0,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF232426),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Stack(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'nb07l7ss' /* Community Market */,
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
                                          fontSize: 18.0,
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
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(HomePageWidget.routeName);
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.chevron_left,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
