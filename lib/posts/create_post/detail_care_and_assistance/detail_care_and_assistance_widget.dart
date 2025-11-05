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
import 'detail_care_and_assistance_model.dart';
export 'detail_care_and_assistance_model.dart';

class DetailCareAndAssistanceWidget extends StatefulWidget {
  const DetailCareAndAssistanceWidget({super.key});

  static String routeName = 'DetailCareAndAssistance';
  static String routePath = '/detailCareAndAssistance';

  @override
  State<DetailCareAndAssistanceWidget> createState() =>
      _DetailCareAndAssistanceWidgetState();
}

class _DetailCareAndAssistanceWidgetState
    extends State<DetailCareAndAssistanceWidget> {
  late DetailCareAndAssistanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailCareAndAssistanceModel());

    _model.swapSwitchValue = FFAppState().postState.openForSwap;
    _model.textController ??=
        TextEditingController(text: FFAppState().postState.wishlistText);
    _model.textFieldFocusNode ??= FocusNode();

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
                                      borderRadius: BorderRadius.circular(24.0),
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
                                                '7jqf9ls4' /* Details */,
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            FFLocalizations.of(context).getText(
                                              'qjuj07rg' /* Details about your */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                            FFLocalizations.of(context).getText(
                                              'nga3ya0w' /* support post */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                            'i1n166r0' /* Helps others understand your p... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          'uzhr4z1s' /* Title */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
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
                                                              Icons.arrow_right,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          if (FFAppState()
                                                                      .postState
                                                                      .title !=
                                                                  '')
                                                            Icon(
                                                              Icons.check_sharp,
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
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          '9ph8lxsc' /* Description */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
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
                                                              Icons.arrow_right,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 20.0,
                                                            ),
                                                          if (FFAppState()
                                                                      .postState
                                                                      .description !=
                                                                  '')
                                                            Icon(
                                                              Icons.check_sharp,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wpdfqsiq' /* Location */,
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
                                                    fontWeight: FontWeight.w500,
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
                                                    .dropdownCityValueController ??=
                                                FormFieldController<String>(
                                              _model.dropdownCityValue ??=
                                                  FFAppState().postState.city,
                                            ),
                                            options: FFAppState()
                                                .citiesApp
                                                .map((e) => e.name)
                                                .toList(),
                                            onChanged: (val) async {
                                              safeSetState(() => _model
                                                  .dropdownCityValue = val);
                                              FFAppState()
                                                  .updatePostStateStruct(
                                                (e) => e
                                                  ..city =
                                                      _model.dropdownCityValue,
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
                                              '2nl17z9d' /* Select */,
                                            ),
                                            searchHintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'o9wthtmb' /* Search... */,
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
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                    color:
                                        FlutterFlowTheme.of(context).bordergray,
                                  ),
                                ],
                              ),
                              if (FFAppState().postState.intend == 'Request')
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 2.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yc6m1j1g' /* Deadline */,
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
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final _datePickedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      getCurrentTimestamp,
                                                  firstDate:
                                                      getCurrentTimestamp,
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
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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

                                                TimeOfDay? _datePickedTime;
                                                if (_datePickedDate != null) {
                                                  _datePickedTime =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.fromDateTime(
                                                            getCurrentTimestamp),
                                                    builder: (context, child) {
                                                      return wrapInMaterialTimePickerTheme(
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
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
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
                                                }

                                                if (_datePickedDate != null &&
                                                    _datePickedTime != null) {
                                                  safeSetState(() {
                                                    _model.datePicked =
                                                        DateTime(
                                                      _datePickedDate.year,
                                                      _datePickedDate.month,
                                                      _datePickedDate.day,
                                                      _datePickedTime!.hour,
                                                      _datePickedTime.minute,
                                                    );
                                                  });
                                                } else if (_model.datePicked !=
                                                    null) {
                                                  safeSetState(() {
                                                    _model.datePicked =
                                                        getCurrentTimestamp;
                                                  });
                                                }
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..deadline =
                                                        _model.datePicked,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .calendar_month_sharp,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : 'Select Date',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: dateTimeFormat(
                                                                                "yMMMd",
                                                                                FFAppState().postState.deadline,
                                                                                locale: FFLocalizations.of(context).languageCode,
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
                                                    ].divide(
                                                        SizedBox(width: 6.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.3,
                                      color: FlutterFlowTheme.of(context)
                                          .bordergray,
                                    ),
                                  ],
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
                                          'zi6grwu2' /* Compensation */,
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
                                      if (FFAppState()
                                                  .postState
                                                  .compensationType !=
                                              '')
                                        Icon(
                                          Icons.check_sharp,
                                          color: Color(0xFF0BD9A1),
                                          size: 16.0,
                                        ),
                                    ],
                                  ),
                                  if (FFAppState().postState.intend ==
                                      'Request')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'orn5dnqr' /* Free help appreciated */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'inv2v7gr' /* Can offer something back */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '6dbv97f6' /* By agreement */,
                                          ))
                                        ],
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.comensationRequestValue =
                                                  val?.firstOrNull);
                                          FFAppState().updatePostStateStruct(
                                            (e) => e
                                              ..compensationType = _model
                                                  .comensationRequestValue,
                                          );
                                          safeSetState(() {});
                                        },
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .greenInit,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                            _model.comensationRequestValue !=
                                                null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .comensationRequestValueController ??=
                                            FormFieldController<List<String>>(
                                          [FFAppState().postState.rentalType],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  if (FFAppState().postState.intend == 'Offer')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 6.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'ys1f5lx0' /* Free / Just helping */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'sk1kasqy' /* Give what you feel */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'xyc7dpih' /* By agreement */,
                                          ))
                                        ],
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.comensationOfferValue =
                                                  val?.firstOrNull);
                                          FFAppState().updatePostStateStruct(
                                            (e) => e
                                              ..compensationType =
                                                  _model.comensationOfferValue,
                                          );
                                          safeSetState(() {});
                                        },
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .greenInit,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                            _model.comensationOfferValue !=
                                                null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .comensationOfferValueController ??=
                                            FormFieldController<List<String>>(
                                          [FFAppState().postState.rentalType],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                ],
                              ),
                              if (FFAppState().postState.intend == 'Offer')
                                Column(
                                  mainAxisSize: MainAxisSize.max,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 2.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '83sc63g8' /* Preferances */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                    .wishlistText !=
                                                '')
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'g140snbx' /* Open for swap? */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                          ],
                                        ),
                                        Transform.scale(
                                          scaleX: 0.85,
                                          scaleY: 0.8,
                                          child: Switch.adaptive(
                                            value: _model.swapSwitchValue!,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .swapSwitchValue = newValue);
                                              if (newValue) {
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..openForSwap =
                                                        _model.swapSwitchValue,
                                                );
                                                safeSetState(() {});
                                              } else {
                                                FFAppState()
                                                    .updatePostStateStruct(
                                                  (e) => e
                                                    ..openForSwap =
                                                        _model.swapSwitchValue,
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
                                    if (FFAppState().postState.openForSwap ==
                                        true)
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 8.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'okfhv1oq' /* Please insert a wishlist of wh... */,
                                              ),
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  FFAppState()
                                                      .updatePostStateStruct(
                                                    (e) => e
                                                      ..wishlistText = _model
                                                          .textController.text,
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
                                                  'jz0m4wkl' /* What items are you looking to ... */,
                                                ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bordergray,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumIsCustom,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                prefixIcon: Icon(
                                                  Icons.recycling,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greenInit,
                                                  size: 18.0,
                                                ),
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
                                              textAlign: TextAlign.start,
                                              maxLines: null,
                                              minLines: 1,
                                              maxLength: 300,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              enableInteractiveSelection: true,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
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
                                  (FFAppState().postState.compensationType !=
                                          '')) {
                                FFAppState().postDetailJSON = <String, dynamic>{
                                  'intend': FFAppState().postState.intend,
                                  'compensation_type':
                                      FFAppState().postState.compensationType,
                                  'deadline': functions.dateTimeToString(
                                      FFAppState().postState.deadline),
                                  'open_for_swap':
                                      FFAppState().postState.openForSwap,
                                  'wishlist_text':
                                      FFAppState().postState.wishlistText,
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
                                            'v6o4kog0' /* Some fields are left unfilled.... */,
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
                                        (FFAppState()
                                                    .postState
                                                    .compensationType !=
                                                '')
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
                                          (FFAppState()
                                                      .postState
                                                      .compensationType !=
                                                  '')
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
                                      '8nx9yjx1' /* Next */,
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
                                                  (FFAppState()
                                                              .postState
                                                              .compensationType !=
                                                          '')
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
