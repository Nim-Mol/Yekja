import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/posts/create_post/description/description_widget.dart';
import '/posts/create_post/title/title_widget.dart';
import '/shared_components/error_comp/error_comp_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'detail_swap_items_model.dart';
export 'detail_swap_items_model.dart';

class DetailSwapItemsWidget extends StatefulWidget {
  const DetailSwapItemsWidget({super.key});

  static String routeName = 'DetailSwapItems';
  static String routePath = '/detailSwapItems';

  @override
  State<DetailSwapItemsWidget> createState() => _DetailSwapItemsWidgetState();
}

class _DetailSwapItemsWidgetState extends State<DetailSwapItemsWidget> {
  late DetailSwapItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailSwapItemsModel());

    _model.textController1 ??=
        TextEditingController(text: FFAppState().postState.wishlistText);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.swapSwitchValue = FFAppState().postState.openForSwap;
    _model.textController2 ??= TextEditingController(
        text: FFAppState().postState.durationMin.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.priceBoolSwitchValue =
        FFAppState().postState.priceText == 'By Agreement';
    _model.textController3 ??=
        TextEditingController(text: FFAppState().postState.price.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.negotiableSwitchValue = FFAppState().postState.isNegotiable;
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 1.0),
            children: [
              if (FFAppState().postState.intend == 'Swap')
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 480.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.border_color,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 24.0,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'jxface71' /* Details */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Text(
                                            '${functions.isInSetInt(FFAppState().postState.catId, FFAppConstants.catsOpenForSwap.toList()) == true ? '4' : '5'} of 6',
                                            style: FlutterFlowTheme.of(context)
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
                                          ),
                                        ]
                                            .divide(SizedBox(width: 10.0))
                                            .addToStart(SizedBox(width: 16.0))
                                            .addToEnd(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                    Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              HomePageWidget.routeName);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
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
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 700.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'j2mqcfx9' /* Details about your */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLargeIsCustom,
                                                  ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '08n0yc3b' /* item swap */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLargeIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xcdfbio2' /* Helps others understand your p... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: TitleWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8qub49xp' /* Title */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            Color(0xFF0BD9A1),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                                Text(
                                                  FFAppState()
                                                                  .postState
                                                                  .title !=
                                                              ''
                                                      ? FFAppState()
                                                          .postState
                                                          .title
                                                      : 'Add a title to your post'
                                                          .maybeHandleOverflow(
                                                          maxChars: 35,
                                                          replacement: '…',
                                                        ),
                                                  maxLines: 1,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FFAppState()
                                                                            .postState
                                                                            .title !=
                                                                        ''
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Stack(
                                              children: [
                                                if (FFAppState()
                                                            .postState
                                                            .title ==
                                                        '')
                                                  Icon(
                                                    Icons.arrow_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                if (FFAppState()
                                                            .postState
                                                            .title !=
                                                        '')
                                                  Icon(
                                                    Icons.check_sharp,
                                                    color: Color(0xFF0BD9A1),
                                                    size: 16.0,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color:
                                      FlutterFlowTheme.of(context).bordergray,
                                ),
                                Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: DescriptionWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '49m211ow' /* Description */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            Color(0xFF0BD9A1),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  '${FFAppState().postState.description != '' ? FFAppState().postState.description : 'Add a description to your post'}'
                                                      .maybeHandleOverflow(
                                                    maxChars: 90,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FFAppState()
                                                                            .postState
                                                                            .description !=
                                                                        ''
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Stack(
                                              children: [
                                                if (FFAppState()
                                                            .postState
                                                            .description ==
                                                        '')
                                                  Icon(
                                                    Icons.arrow_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                if (FFAppState()
                                                            .postState
                                                            .description !=
                                                        '')
                                                  Icon(
                                                    Icons.check_sharp,
                                                    color: Color(0xFF0BD9A1),
                                                    size: 16.0,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color:
                                      FlutterFlowTheme.of(context).bordergray,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'zvyse8ai' /* Location */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              color: Color(0xFF0BD9A1),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                      ),
                                      Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropdownCityValueController1 ??=
                                                FormFieldController<String>(
                                              _model.dropdownCityValue1 ??=
                                                  FFAppState().postState.city,
                                            ),
                                            options: FFAppState()
                                                .citiesApp
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                  .dropdownCityValue1 = val);
                                              FFAppState()
                                                  .updatePostStateStruct(
                                                (e) => e
                                                  ..city =
                                                      _model.dropdownCityValue1,
                                              );
                                              safeSetState(() {});
                                            },
                                            height: 40.0,
                                            searchHintTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumIsCustom,
                                                    ),
                                            searchTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color: FFAppState().postState.city !=
                                                                  ''
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'ig3jh1v1' /* Select */,
                                            ),
                                            searchHintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'wji2a8s8' /* Search... */,
                                            ),
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 15.0,
                                            ),
                                            fillColor: Color(0xE4232426),
                                            elevation: 0.0,
                                            borderColor: Color(0xE4232426),
                                            borderWidth: 0.0,
                                            borderRadius: 4.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Stack(
                                              children: [
                                                if (FFAppState()
                                                            .postState
                                                            .city ==
                                                        '')
                                                  Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                if (FFAppState()
                                                            .postState
                                                            .city !=
                                                        '')
                                                  Icon(
                                                    Icons.check_sharp,
                                                    color: Color(0xFF0BD9A1),
                                                    size: 16.0,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ].divide(SizedBox(height: 6.0)),
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color:
                                      FlutterFlowTheme.of(context).bordergray,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'mjs3qjgz' /* Delivery */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                color: Color(0xFF0BD9A1),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      if (FFAppState()
                                                  .postState
                                                  .deliveryMethod !=
                                              '')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Icon(
                                            Icons.check_sharp,
                                            color: Color(0xFF0BD9A1),
                                            size: 16.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 4.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'rqv33tr9' /* By Agreement */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'pibvge46' /* Pick-Up Only */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '4hnrcynu' /* Sent by Post */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '0d6zqa1x' /* Free Delivery */,
                                            ))
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.deliveryChoiceValue =
                                                    val?.firstOrNull);
                                            FFAppState().updatePostStateStruct(
                                              (e) => e
                                                ..deliveryMethod =
                                                    _model.deliveryChoiceValue,
                                            );
                                            safeSetState(() {});
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .greenInit,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 16.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            elevation: 0.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .greenInit,
                                            borderWidth: 0.3,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color: Color(0xCFD4D4D4),
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 16.0,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            elevation: 0.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .bordergray,
                                            borderWidth: 0.2,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          chipSpacing: 10.0,
                                          rowSpacing: 8.0,
                                          multiselect: false,
                                          initialized:
                                              _model.deliveryChoiceValue !=
                                                  null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .deliveryChoiceValueController ??=
                                              FormFieldController<List<String>>(
                                            [
                                              FFAppState()
                                                  .postState
                                                  .deliveryMethod
                                            ],
                                          ),
                                          wrapped: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 0.3,
                                          color: FlutterFlowTheme.of(context)
                                              .bordergray,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'whd5sol7' /* Wishlist */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      color: Color(0xFF0BD9A1),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                            if (FFAppState()
                                                        .postState
                                                        .wishlistText !=
                                                    '')
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Icon(
                                                  Icons.check_sharp,
                                                  color: Color(0xFF0BD9A1),
                                                  size: 16.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 6.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'u6ez8fmp' /* Please insert a wishlist for w... */,
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textgray,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller: _model.textController1,
                                            focusNode:
                                                _model.textFieldFocusNode1,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController1',
                                              Duration(milliseconds: 2000),
                                              () async {
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..wishlistText = _model
                                                        .textController1.text,
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            enabled: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              alignLabelWithHint: false,
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                '2y6j29i2' /* What items are you looking to ... */,
                                              ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .bordergray,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumIsCustom,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              prefixIcon: Icon(
                                                Icons.recycling,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 18.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            textAlign: TextAlign.start,
                                            maxLines: null,
                                            maxLength: 300,
                                            maxLengthEnforcement:
                                                MaxLengthEnforcement.enforced,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .textController1Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.3,
                                          color: FlutterFlowTheme.of(context)
                                              .bordergray,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'txu3x8o7' /* Preferances */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      color: Color(0xFF0BD9A1),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'd0tqcv4n' /* Allow cash adjustment? */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: Color(
                                                                0xCFD4D4D4),
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'g7l755yk' /* You or the other user can add ... */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: Color(
                                                                0xCFD4D4D4),
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Transform.scale(
                                                scaleX: 0.85,
                                                scaleY: 0.8,
                                                child: Switch.adaptive(
                                                  value:
                                                      _model.swapSwitchValue!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.swapSwitchValue =
                                                            newValue);
                                                    if (newValue) {
                                                      FFAppState()
                                                          .updatePostStateStruct(
                                                        (e) => e
                                                          ..allowCashAdjustment =
                                                              _model
                                                                  .swapSwitchValue,
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      FFAppState()
                                                          .updatePostStateStruct(
                                                        (e) => e
                                                          ..openForSwap = null,
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .greenInit,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .greenInit,
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bordergray,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ].addToEnd(SizedBox(height: 120.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if (FFAppState().postState.intend == 'Borrow')
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 480.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.safePop();
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.border_color,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 24.0,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'yidtoj2b' /* Details */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Text(
                                            '${functions.isInSetInt(FFAppState().postState.catId, FFAppConstants.catsOpenForSwap.toList()) == true ? '4' : '5'} of 6',
                                            style: FlutterFlowTheme.of(context)
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
                                          ),
                                        ]
                                            .divide(SizedBox(width: 10.0))
                                            .addToStart(SizedBox(width: 16.0))
                                            .addToEnd(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                    Container(
                                      width: 45.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              HomePageWidget.routeName);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
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
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 700.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 32.0, 0.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'q4yp49b5' /* Details about your */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLargeIsCustom,
                                                  ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'biiohvxh' /* borrow request */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineLarge
                                                  .override(
                                                    fontFamily: FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLargeIsCustom,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'k034644c' /* Helps others understand your p... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: TitleWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'vq94tkzh' /* Title */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: Color(
                                                                    0xFF0BD9A1),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (FFAppState()
                                                                        .postState
                                                                        .title ==
                                                                    '')
                                                              Icon(
                                                                Icons
                                                                    .arrow_right,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                            if (FFAppState()
                                                                        .postState
                                                                        .title !=
                                                                    '')
                                                              Icon(
                                                                Icons
                                                                    .check_sharp,
                                                                color: Color(
                                                                    0xFF0BD9A1),
                                                                size: 16.0,
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      FFAppState()
                                                                      .postState
                                                                      .title !=
                                                                  ''
                                                          ? FFAppState()
                                                              .postState
                                                              .title
                                                          : 'Add a title to your post'
                                                              .maybeHandleOverflow(
                                                              maxChars: 35,
                                                              replacement: '…',
                                                            ),
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FFAppState().postState.title !=
                                                                            ''
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.3,
                                      color: FlutterFlowTheme.of(context)
                                          .bordergray,
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: DescriptionWidget(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0g05oij9' /* Description */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                color: Color(
                                                                    0xFF0BD9A1),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if (FFAppState()
                                                                        .postState
                                                                        .description ==
                                                                    '')
                                                              Icon(
                                                                Icons
                                                                    .arrow_right,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                            if (FFAppState()
                                                                        .postState
                                                                        .description !=
                                                                    '')
                                                              Icon(
                                                                Icons
                                                                    .check_sharp,
                                                                color: Color(
                                                                    0xFF0BD9A1),
                                                                size: 16.0,
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    AutoSizeText(
                                                      '${FFAppState().postState.description != '' ? FFAppState().postState.description : 'Add a description to your post'}'
                                                          .maybeHandleOverflow(
                                                        maxChars: 90,
                                                        replacement: '…',
                                                      ),
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FFAppState().postState.description !=
                                                                            ''
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.3,
                                      color: FlutterFlowTheme.of(context)
                                          .bordergray,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'nxl1a5ul' /* Location */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      color: Color(0xFF0BD9A1),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                              if (FFAppState().postState.city !=
                                                      '')
                                                Icon(
                                                  Icons.check_sharp,
                                                  color: Color(0xFF0BD9A1),
                                                  size: 16.0,
                                                ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 6.0, 0.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropdownCityValueController2 ??=
                                                  FormFieldController<String>(
                                                _model.dropdownCityValue2 ??=
                                                    FFAppState().postState.city,
                                              ),
                                              options: FFAppState()
                                                  .citiesApp
                                                  .map((e) => e.name)
                                                  .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropdownCityValue2 = val);
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..city = _model
                                                        .dropdownCityValue2,
                                                );
                                                safeSetState(() {});
                                              },
                                              height: 40.0,
                                              searchHintTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FFAppState()
                                                                    .postState
                                                                    .city !=
                                                                ''
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'yo39xlof' /* Select */,
                                              ),
                                              searchHintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'n2zdt87s' /* Search... */,
                                              ),
                                              icon: Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textgray,
                                                size: 16.0,
                                              ),
                                              fillColor: Color(0xE4232426),
                                              elevation: 0.0,
                                              borderColor: Color(0xE4232426),
                                              borderWidth: 0.0,
                                              borderRadius: 4.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.3,
                                      color: FlutterFlowTheme.of(context)
                                          .bordergray,
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color:
                                      FlutterFlowTheme.of(context).bordergray,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'afwtxktl' /* Duration */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                color: Color(0xFF0BD9A1),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      if (FFAppState()
                                              .postState
                                              .availableFrom !=
                                          null)
                                        Icon(
                                          Icons.check_sharp,
                                          color: Color(0xFF0BD9A1),
                                          size: 16.0,
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'vgnftlvs' /* Your deadline: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Color(0xCFD4D4D4),
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: getCurrentTimestamp,
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeIsCustom,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .greenInit,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .greenInit,
                                                  iconSize: 20.0,
                                                );
                                              },
                                            );

                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            } else if (_model.datePicked !=
                                                null) {
                                              safeSetState(() {
                                                _model.datePicked =
                                                    getCurrentTimestamp;
                                              });
                                            }
                                            FFAppState().updatePostStateStruct(
                                              (e) => e
                                                ..deadline = _model.datePicked,
                                            );
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 140.0,
                                            height: 38.0,
                                            constraints: BoxConstraints(
                                              maxWidth: 180.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.calendar_month_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .bordergray,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    dateTimeFormat(
                                                                  "yMMMd",
                                                                  FFAppState()
                                                                      .postState
                                                                      .deadline,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ) !=
                                                                ''
                                                        ? dateTimeFormat(
                                                            "yMMMd",
                                                            FFAppState()
                                                                .postState
                                                                .deadline!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )
                                                        : 'Select Date',
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              color: dateTimeFormat(
                                                                            "yMMMd",
                                                                            FFAppState().postState.deadline,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ) !=
                                                                          ''
                                                                  ? FlutterFlowTheme.of(context).primaryText
                                                                  : FlutterFlowTheme.of(context).textgray,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                  ),
                                                ].divide(SizedBox(width: 6.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ohr57sk3' /* For how many days? */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Color(0xCFD4D4D4),
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 140.0,
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController2',
                                              Duration(milliseconds: 2000),
                                              () async {
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..durationMin =
                                                        int.tryParse(_model
                                                            .textController2
                                                            .text),
                                                );
                                                safeSetState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            enabled: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .bordergray,
                                                    letterSpacing: 0.0,
                                                    lineHeight: 1.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .labelMediumIsCustom,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                              prefixIcon: Icon(
                                                Icons.dark_mode,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .bordergray,
                                                size: 16.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 0.3,
                                  color:
                                      FlutterFlowTheme.of(context).bordergray,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '6fm7r7ko' /* Compensation */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                color: Color(0xFF0BD9A1),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
                                              ),
                                        ),
                                        if ((FFAppState().postState.price >
                                                0) ||
                                            (FFAppState().postState.priceText ==
                                                'By Agreement'))
                                          Icon(
                                            Icons.check_sharp,
                                            color: Color(0xFF0BD9A1),
                                            size: 16.0,
                                          ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'lx9z68l6' /* By Agreement */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: Color(0xCFD4D4D4),
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        Transform.scale(
                                          scaleX: 0.85,
                                          scaleY: 0.8,
                                          child: Switch.adaptive(
                                            value: _model.priceBoolSwitchValue!,
                                            onChanged: (newValue) async {
                                              safeSetState(() =>
                                                  _model.priceBoolSwitchValue =
                                                      newValue);
                                              if (newValue) {
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..priceText =
                                                        'By Agreement',
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e..priceText = null,
                                                );
                                                safeSetState(() {});
                                              }
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .greenInit,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .greenInit,
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .bordergray,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    if (FFAppState().postState.priceText == '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 150.0,
                                              height: 38.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Container(
                                                width: 150.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController3,
                                                  focusNode: _model
                                                      .textFieldFocusNode3,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController3',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      FFAppState()
                                                          .updatePostStateStruct(
                                                        (e) => e
                                                          ..price = int
                                                              .tryParse(_model
                                                                  .textController3
                                                                  .text),
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  autofocus: false,
                                                  enabled: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bordergray,
                                                              letterSpacing:
                                                                  0.0,
                                                              lineHeight: 1.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumIsCustom,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    prefixIcon: Icon(
                                                      Icons.euro,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bordergray,
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .textController3Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8kpvo2qd' /* Negotiable: */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xCFD4D4D4),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Transform.scale(
                                                  scaleX: 0.85,
                                                  scaleY: 0.8,
                                                  child: Switch.adaptive(
                                                    value: _model
                                                        .negotiableSwitchValue!,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .negotiableSwitchValue =
                                                          newValue);
                                                      if (newValue) {
                                                        FFAppState()
                                                            .updatePostStateStruct(
                                                          (e) => e
                                                            ..isNegotiable = _model
                                                                .negotiableSwitchValue,
                                                        );
                                                        safeSetState(() {});
                                                      } else {
                                                        FFAppState()
                                                            .updatePostStateStruct(
                                                          (e) => e
                                                            ..isNegotiable =
                                                                null,
                                                        );
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .greenInit,
                                                    activeTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .greenInit,
                                                    inactiveTrackColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bordergray,
                                                    inactiveThumbColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                  ],
                                ),
                              ].addToEnd(SizedBox(height: 120.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 90.0,
                  constraints: BoxConstraints(
                    maxWidth: 480.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 24.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if ((FFAppState().postState.title != '') &&
                                  (FFAppState().postState.description !=
                                          '') &&
                                  (FFAppState().postState.city != '') &&
                                  ((FFAppState().postState.wishlistText !=
                                              '') ||
                                      (FFAppState().postState.durationMin !=
                                          null))) {
                                FFAppState().postDetailJSON = <String, dynamic>{
                                  'delivery_method':
                                      FFAppState().postState.deliveryMethod,
                                  'wishlist_text':
                                      FFAppState().postState.wishlistText,
                                  'duration_min':
                                      FFAppState().postState.durationMin,
                                  'allow_cash_adjustment': FFAppState()
                                      .postState
                                      .allowCashAdjustment,
                                  'intend': FFAppState().postState.intend,
                                  'price_text':
                                      FFAppState().postState.priceText,
                                  'price': FFAppState().postState.price,
                                };
                                safeSetState(() {});

                                context.pushNamed(
                                  PostImageWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 600),
                                    ),
                                  },
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ErrorCompWidget(
                                          errorText: FFLocalizations.of(context)
                                              .getText(
                                            'q4p7c1wf' /* Some fields are left unfilled.... */,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: (FFAppState().postState.title !=
                                                '') &&
                                        (FFAppState()
                                                    .postState
                                                    .description !=
                                                '') &&
                                        (FFAppState().postState.city !=
                                                '') &&
                                        ((FFAppState()
                                                        .postState
                                                        .wishlistText !=
                                                    '') ||
                                            (FFAppState()
                                                    .postState
                                                    .durationMin !=
                                                null))
                                    ? FlutterFlowTheme.of(context).greenInit
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: (FFAppState().postState.title !=
                                                  '') &&
                                          (FFAppState()
                                                      .postState
                                                      .description !=
                                                  '') &&
                                          (FFAppState().postState.city !=
                                                  '') &&
                                          ((FFAppState()
                                                          .postState
                                                          .wishlistText !=
                                                      '') ||
                                              (FFAppState()
                                                      .postState
                                                      .durationMin !=
                                                  null))
                                      ? FlutterFlowTheme.of(context).greenInit
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '5uunx2br' /* Next */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: (FFAppState()
                                                              .postState
                                                              .title !=
                                                          '') &&
                                                  (FFAppState()
                                                              .postState
                                                              .description !=
                                                          '') &&
                                                  (FFAppState().postState.city !=
                                                          '') &&
                                                  ((FFAppState()
                                                                  .postState
                                                                  .wishlistText !=
                                                              '') ||
                                                      (FFAppState()
                                                              .postState
                                                              .durationMin !=
                                                          null))
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Color(0xFF6B6969),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ],
                              ),
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
    );
  }
}
