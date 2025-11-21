import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/posts/create_post/description/description_widget.dart';
import '/posts/create_post/title/title_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'post_general_detail_model.dart';
export 'post_general_detail_model.dart';

class PostGeneralDetailWidget extends StatefulWidget {
  const PostGeneralDetailWidget({super.key});

  static String routeName = 'PostGeneralDetail';
  static String routePath = '/postGeneralDetail';

  @override
  State<PostGeneralDetailWidget> createState() =>
      _PostGeneralDetailWidgetState();
}

class _PostGeneralDetailWidgetState extends State<PostGeneralDetailWidget> {
  late PostGeneralDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostGeneralDetailModel());

    _model.textController1 ??=
        TextEditingController(text: FFAppState().postState.price.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.negotiableSwitchValue = functions
        .isNullSingleString(FFAppState().postState.isNegotiable.toString());
    _model.openSwapSwitchValue = functions
        .isNullSingleString(FFAppState().postState.openForSwap.toString());
    _model.textController2 ??=
        TextEditingController(text: FFAppState().postState.wishlistText);
    _model.textFieldFocusNode2 ??= FocusNode();

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
                                                '8kkxo2cm' /* General */,
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
                                          0.0, 12.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '6lq8d63n' /* Add important 
details  */
                                              ,
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
                                            '6hr0mw6d' /* Helps others understand your p... */,
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
                              Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .lighterSecBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FFAppState().postState.title != ''
                                        ? FlutterFlowTheme.of(context).greenInit
                                        : Color(0x00000000),
                                    width: 0.4,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
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
                                                      'vdy9i4kb' /* Title */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                            maxChars: 30,
                                                            replacement: '…',
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
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          Stack(
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
                                                  color: Color(0xFF41D3A6),
                                                  size: 18.0,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .lighterSecBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FFAppState()
                                                    .postState
                                                    .description !=
                                                ''
                                        ? FlutterFlowTheme.of(context).greenInit
                                        : Color(0x00000000),
                                    width: 0.4,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 8.0),
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'itbrw7kz' /* Description */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                    '${FFAppState().postState.description != '' ? FFAppState().postState.description : 'Add a description to your post'}'
                                                        .maybeHandleOverflow(
                                                      maxChars: 30,
                                                      replacement: '…',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                          Stack(
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
                                                  color: Color(0xFF41D3A6),
                                                  size: 18.0,
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    children: [
                                      Container(
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .lighterSecBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FFAppState()
                                                            .postState
                                                            .city !=
                                                        ''
                                                ? FlutterFlowTheme.of(context)
                                                    .greenInit
                                                : Color(0x00000000),
                                            width: 0.4,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 8.0, 12.0, 8.0),
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
                                                      .primaryText,
                                                  fontSize: 16.0,
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
                                              'wyoz4ss7' /* Location */,
                                            ),
                                            searchHintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'rdefb0js' /* Search... */,
                                            ),
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 15.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .lighterSecBackground,
                                            elevation: 0.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .lighterSecBackground,
                                            borderWidth: 0.0,
                                            borderRadius: 12.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: true,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: Stack(
                                          children: [
                                            if (FFAppState().postState.city ==
                                                    '')
                                              Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            if (FFAppState().postState.city !=
                                                    '')
                                              Icon(
                                                Icons.check_sharp,
                                                color: Color(0xFF41D3A6),
                                                size: 18.0,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 6.0)),
                              ),
                              Stack(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lighterSecBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color:
                                            FFAppState()
                                                            .postState
                                                            .condition !=
                                                        ''
                                                ? FlutterFlowTheme.of(context)
                                                    .greenInit
                                                : Color(0x00000000),
                                        width: 0.4,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yoin46s2' /* Condition */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'rhdilj0l' /* New */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'eo5076m2' /* Used - Like New */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'pmyrcgo8' /* Used - Fair */,
                                                      ))
                                                    ],
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .conditionChoiceValue =
                                                          val?.firstOrNull);
                                                      FFAppState()
                                                          .updatePostStateStruct(
                                                        (e) => e
                                                          ..condition = _model
                                                              .conditionChoiceValue,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .greenInit,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 16.0,
                                                      labelPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bordergray,
                                                      borderWidth: 0.2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    chipSpacing: 10.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .conditionChoiceValue !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .conditionChoiceValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFAppState()
                                                            .postState
                                                            .condition
                                                      ],
                                                    ),
                                                    wrapped: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().postState.condition != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: Color(0xFF41D3A6),
                                        size: 18.0,
                                      ),
                                    ),
                                ],
                              ),
                              Stack(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lighterSecBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color:
                                            FFAppState()
                                                            .postState
                                                            .priceText !=
                                                        ''
                                                ? FlutterFlowTheme.of(context)
                                                    .greenInit
                                                : Color(0x00000000),
                                        width: 0.4,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tynep7pa' /* Price */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 150.0,
                                                height: 38.0,
                                                decoration: BoxDecoration(),
                                                child: Container(
                                                  width: 150.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    onFieldSubmitted:
                                                        (_) async {
                                                      FFAppState()
                                                          .updatePostStateStruct(
                                                        (e) => e
                                                          ..price = int
                                                              .tryParse(_model
                                                                  .textController1
                                                                  .text)
                                                          ..priceText =
                                                              'Asking',
                                                      );
                                                      safeSetState(() {});
                                                    },
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
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      prefixIcon: Icon(
                                                        Icons.euro,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bordergray,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    enableInteractiveSelection:
                                                        true,
                                                    validator: _model
                                                        .textController1Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'avsrngsm' /* Negotiable */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                              ..isNegotiable =
                                                                  _model
                                                                      .negotiableSwitchValue,
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
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().postState.priceText != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: Color(0xFF41D3A6),
                                        size: 18.0,
                                      ),
                                    ),
                                ],
                              ),
                              Stack(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lighterSecBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                        .postState
                                                        .deliveryMethod !=
                                                    ''
                                            ? FlutterFlowTheme.of(context)
                                                .greenInit
                                            : Color(0x00000000),
                                        width: 0.4,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 8.0, 12.0, 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm7scui9l' /* Delivery */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 4.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '9cauaku8' /* Free Delivery */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'b6wjxjby' /* Pick-up Only */,
                                                      )),
                                                      ChipData(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '7lje7hzm' /* Agreement */,
                                                      ))
                                                    ],
                                                    onChanged: (val) async {
                                                      safeSetState(() => _model
                                                              .choiceChipsValue =
                                                          val?.firstOrNull);
                                                      FFAppState()
                                                          .updatePostStateStruct(
                                                        (e) => e
                                                          ..deliveryMethod = _model
                                                              .choiceChipsValue,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .greenInit,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      iconSize: 16.0,
                                                      labelPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                      iconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      iconSize: 16.0,
                                                      elevation: 0.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bordergray,
                                                      borderWidth: 0.2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    chipSpacing: 10.0,
                                                    rowSpacing: 8.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsValue !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsValueController ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      [
                                                        FFAppState()
                                                            .postState
                                                            .deliveryMethod
                                                      ],
                                                    ),
                                                    wrapped: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().postState.deliveryMethod !=
                                          '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: Color(0xFF41D3A6),
                                        size: 18.0,
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '996r0pxr' /* Are you open for swap? */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                  Transform.scale(
                                    scaleX: 0.85,
                                    scaleY: 0.8,
                                    child: Switch.adaptive(
                                      value: _model.openSwapSwitchValue!,
                                      onChanged: (newValue) async {
                                        safeSetState(() => _model
                                            .openSwapSwitchValue = newValue);
                                        if (newValue) {
                                          FFAppState().updatePostStateStruct(
                                            (e) => e
                                              ..openForSwap =
                                                  _model.openSwapSwitchValue,
                                          );
                                          safeSetState(() {});
                                        }
                                      },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .greenInit,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .greenInit,
                                      inactiveTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      inactiveThumbColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  onFieldSubmitted: (_) async {
                                    FFAppState().updatePostStateStruct(
                                      (e) => e
                                        ..wishlistText =
                                            _model.textController2.text,
                                    );
                                    safeSetState(() {});
                                  },
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    alignLabelWithHint: false,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '4l0n4fmf' /* What items are you looking to ... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .bordergray,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .lighterSecBackground,
                                    prefixIcon: Icon(
                                      Icons.recycling,
                                      color: FlutterFlowTheme.of(context)
                                          .greenInit,
                                      size: 18.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  minLines: 1,
                                  maxLength: 120,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ]
                                .divide(SizedBox(height: 12.0))
                                .addToEnd(SizedBox(height: 100.0)),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 16.0, 24.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (functions.isInSetInt(
                                    FFAppState().postState.catId,
                                    FFAppConstants.catsOpenForSwap.toList()) ==
                                true) {
                              context.pushNamed(
                                PostWishListWidget.routeName,
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
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: ((FFAppState().marketPlaceMeta.catId != 3) &&
                                          (FFAppState().marketPlaceMeta.title !=
                                                  '') &&
                                          (FFAppState()
                                                      .marketPlaceMeta
                                                      .description !=
                                                  '')) ||
                                      (FFAppState()
                                                  .marketPlaceMeta
                                                  .description !=
                                              '') ||
                                      ((FFAppState().marketPlaceMeta.catId ==
                                              3) &&
                                          (FFAppState().marketPlaceMeta.price !=
                                              null) &&
                                          (FFAppState()
                                                      .marketPlaceMeta
                                                      .deliveryMethod !=
                                                  ''))
                                  ? FlutterFlowTheme.of(context).greenInit
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: ((FFAppState().marketPlaceMeta.catId != 3) &&
                                            (FFAppState().marketPlaceMeta.title !=
                                                    '') &&
                                            (FFAppState()
                                                        .marketPlaceMeta
                                                        .description !=
                                                    '')) ||
                                        (FFAppState()
                                                    .marketPlaceMeta
                                                    .description !=
                                                '') ||
                                        ((FFAppState().marketPlaceMeta.catId == 3) &&
                                            (FFAppState().marketPlaceMeta.price !=
                                                null) &&
                                            (FFAppState()
                                                        .marketPlaceMeta
                                                        .deliveryMethod !=
                                                    ''))
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
                                    'hzjb4n58' /* Next */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: ((FFAppState()
                                                            .marketPlaceMeta
                                                            .catId !=
                                                        3) &&
                                                    (FFAppState().marketPlaceMeta.title !=
                                                            '') &&
                                                    (FFAppState()
                                                                .marketPlaceMeta
                                                                .description !=
                                                            '')) ||
                                                (FFAppState()
                                                            .marketPlaceMeta
                                                            .description !=
                                                        '') ||
                                                ((FFAppState().marketPlaceMeta.catId ==
                                                        3) &&
                                                    (FFAppState()
                                                            .marketPlaceMeta
                                                            .price !=
                                                        null) &&
                                                    (FFAppState()
                                                                .marketPlaceMeta
                                                                .deliveryMethod !=
                                                            ''))
                                            ? FlutterFlowTheme.of(context).primary
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
