import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/profile_setting/profile_setting_widget.dart';
import '/profile/review_card/review_card_widget.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/reporting_popup/reporting_popup_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({
    super.key,
    this.profileId,
  });

  final String? profileId;

  static String routeName = 'ProfilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatView = await ViewUserChatsTable().queryRows(
        queryFn: (q) => q
            .or("chat_sender.eq.${widget.profileId}, chat_recipient.eq.${widget.profileId}")
            .order('chat_created_at'),
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
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

    return FutureBuilder<List<UserExtRow>>(
      future: UserExtTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.profileId,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).greenInit,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<UserExtRow> profilePageUserExtRowList = snapshot.data!;

        final profilePageUserExtRow = profilePageUserExtRowList.isNotEmpty
            ? profilePageUserExtRowList.first
            : null;

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
                  FutureBuilder<List<ConsentsRow>>(
                    future: ConsentsTable().querySingleRow(
                      queryFn: (q) => q.eqOrNull(
                        'user_id',
                        widget.profileId,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitChasingDots(
                              color: FlutterFlowTheme.of(context).greenInit,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<ConsentsRow> columnConsentsRowList = snapshot.data!;

                      final columnConsentsRow = columnConsentsRowList.isNotEmpty
                          ? columnConsentsRowList.first
                          : null;

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 150.0,
                                  constraints: BoxConstraints(
                                    maxHeight: 150.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    children: [
                                      Container(
                                        height: 150.0,
                                        decoration: BoxDecoration(),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            profilePageUserExtRow
                                                            ?.profileWallpaper !=
                                                        null &&
                                                    profilePageUserExtRow
                                                            ?.profileWallpaper !=
                                                        ''
                                                ? profilePageUserExtRow!
                                                    .profileWallpaper!
                                                : FFAppConstants
                                                    .DefultProfileWallpaper,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 5.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                          ),
                                          child:
                                              FutureBuilder<List<ConsentsRow>>(
                                            future:
                                                ConsentsTable().querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'user_id',
                                                currentUserUid,
                                              ),
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
                                              List<ConsentsRow>
                                                  rowConsentsRowList =
                                                  snapshot.data!;

                                              final rowConsentsRow =
                                                  rowConsentsRowList.isNotEmpty
                                                      ? rowConsentsRowList.first
                                                      : null;

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        (columnConsentsRow
                                                                        ?.showProfileImage ==
                                                                    true) &&
                                                                (profilePageUserExtRow
                                                                            ?.profileAvatar !=
                                                                        null &&
                                                                    profilePageUserExtRow
                                                                            ?.profileAvatar !=
                                                                        '')
                                                            ? profilePageUserExtRow!
                                                                .profileAvatar!
                                                            : FFAppConstants
                                                                .DefultProfilePhoto,
                                                        width: 99.3,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                        alignment:
                                                            Alignment(0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 50.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              icon: Icon(
                                                Icons.chevron_left,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.safePop();
                                              },
                                            ),
                                          ),
                                          Stack(
                                            children: [
                                              if (widget.profileId ==
                                                  currentUserUid)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 40.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        icon: Icon(
                                                          Icons.settings_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            dialogContext)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      ProfileSettingWidget(
                                                                    profileUrl:
                                                                        'https://app.flutterflow.io/project/4JrFL7AdymYZtlR8X9ly?tab=widgetTree&page=ProfilePage',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (currentUserUid !=
                                                  widget.profileId)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Visibility(
                                                        visible:
                                                            widget.profileId !=
                                                                currentUserUid,
                                                        child: Builder(
                                                          builder: (context) =>
                                                              ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              safeSetState(() =>
                                                                  FFAppState()
                                                                          .UserIsReported =
                                                                      !FFAppState()
                                                                          .UserIsReported);
                                                              if (FFAppState()
                                                                  .UserIsReported) {
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Reporting'),
                                                                              content: Text('Are you sure you want to report this user?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Confirm'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              ReportingPopupWidget(
                                                                            reportingData:
                                                                                ReportingDataStruct(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  FFAppState()
                                                                          .UserIsReported =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                } else {
                                                                  FFAppState()
                                                                          .UserIsReported =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }
                                                            },
                                                            value: FFAppState()
                                                                .UserIsReported,
                                                            onIcon: Icon(
                                                              Icons.flag,
                                                              color: Color(
                                                                  0xFFAE1010),
                                                              size: 15.0,
                                                            ),
                                                            offIcon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .flag,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 15.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 60.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      profilePageUserExtRow
                                                          ?.userName,
                                                      'name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.location_history,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 22.0,
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          profilePageUserExtRow
                                                              ?.userCity,
                                                          'Not set',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 8.0))
                                                    .addToStart(
                                                        SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          profilePageUserExtRow
                                                              ?.totalLikes
                                                              ?.toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'wi68hahy' /* Likes */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeIsCustom,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Opacity(
                                                    opacity: 0.5,
                                                    child: SizedBox(
                                                      height: 50.0,
                                                      child: VerticalDivider(
                                                        thickness: 2.0,
                                                        color:
                                                            Color(0x70E0E3E7),
                                                      ),
                                                    ),
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        4.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'jzc0o03k' /* 3 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'yhmczqlg' /* 12 points to reach level 4 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        6.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                LinearPercentIndicator(
                                                              percent: 0.3,
                                                              width: 120.0,
                                                              lineHeight: 12.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .greenInit,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF232426),
                                                              barRadius: Radius
                                                                  .circular(
                                                                      30.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Image.network(
                                                          'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Badges/sonbol1.png',
                                                          width: 50.0,
                                                          height: 25.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Opacity(
                                                    opacity: 0.5,
                                                    child: SizedBox(
                                                      height: 50.0,
                                                      child: VerticalDivider(
                                                        thickness: 2.0,
                                                        color:
                                                            Color(0x70E0E3E7),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                profilePageUserExtRow
                                                                    ?.review
                                                                    .toString(),
                                                                'R',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .headlineSmallIsCustom,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  ' (${profilePageUserExtRow?.ratings.toString()})',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'dcb0abt1' /* Reviews */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeIsCustom,
                                                            ),
                                                      ),
                                                    ].addToStart(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 24.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        profilePageUserExtRow
                                                            ?.biography,
                                                        'Biography..',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Container(
                                                width: 52.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF03231C),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Visibility(
                                                  visible: profilePageUserExtRow
                                                          ?.yekjaVerified ==
                                                      true,
                                                  child: Opacity(
                                                    opacity: 0.9,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 52.0,
                                                        height: 52.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/Badges/yekja_certified_3.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Container(
                                                width: 52.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF03231C),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 1.0,
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 6.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Container(
                                                width: 52.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF03231C),
                                                  shape: BoxShape.circle,
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 5.0,
                                                shape: const CircleBorder(),
                                                child: Container(
                                                  width: 52.0,
                                                  height: 52.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF03231C),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 650.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment(0.0, 0),
                                          child: TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                            unselectedLabelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            tabs: [
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2808vfr9' /* Posts */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'oq2hc9vq' /* Favorites */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'h7butxb7' /* Reviews */,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'c9j6hm84' /* Awards */,
                                                ),
                                              ),
                                            ],
                                            controller: _model.tabBarController,
                                            onTap: (i) async {
                                              [
                                                () async {},
                                                () async {},
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
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<
                                                            ViewPostSearchRow>>(
                                                      future:
                                                          ViewPostSearchTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eqOrNull(
                                                              'user_id',
                                                              widget.profileId,
                                                            )
                                                            .order(
                                                                'created_at'),
                                                        limit: 5,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitChasingDots(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .greenInit,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<ViewPostSearchRow>
                                                            listViewViewPostSearchRowList =
                                                            snapshot.data!;

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewViewPostSearchRowList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewViewPostSearchRow =
                                                                listViewViewPostSearchRowList[
                                                                    listViewIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  ProductDetailWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'postID':
                                                                        serializeParam(
                                                                      listViewViewPostSearchRow
                                                                          .sourceId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'mainCatID':
                                                                        serializeParam(
                                                                      listViewViewPostSearchRow
                                                                          .mainCatId,
                                                                      ParamType
                                                                          .int,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .itemCardHorizentalModels1
                                                                    .getModel(
                                                                  listViewViewPostSearchRow
                                                                      .sourceId!,
                                                                  listViewIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    ItemCardHorizentalWidget(
                                                                  key: Key(
                                                                    'Keyoke_${listViewViewPostSearchRow.sourceId!}',
                                                                  ),
                                                                  profileId: widget
                                                                      .profileId,
                                                                  itemData:
                                                                      ItemCardHorizentalStruct(
                                                                    title: listViewViewPostSearchRow
                                                                        .title,
                                                                    description:
                                                                        listViewViewPostSearchRow
                                                                            .description,
                                                                    itemLocation:
                                                                        profilePageUserExtRow
                                                                            ?.userCity,
                                                                    createdAt:
                                                                        listViewViewPostSearchRow
                                                                            .createdAt,
                                                                    catID: listViewViewPostSearchRow
                                                                        .subCatId,
                                                                    itemLikes:
                                                                        listViewViewPostSearchRow
                                                                            .postLikes,
                                                                    mainImagePath: listViewViewPostSearchRow.images.firstOrNull !=
                                                                                null &&
                                                                            listViewViewPostSearchRow.images.firstOrNull !=
                                                                                ''
                                                                        ? listViewViewPostSearchRow
                                                                            .images
                                                                            .firstOrNull
                                                                        : 'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/default_image.jpg',
                                                                    postUserId:
                                                                        listViewViewPostSearchRow
                                                                            .userId,
                                                                  ),
                                                                  postId: listViewViewPostSearchRow
                                                                      .sourceId,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ProfileExtendedWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'profileId':
                                                                    serializeParam(
                                                                  profilePageUserExtRow
                                                                      ?.id,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'xt0uhk7r' /* See All */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Visibility(
                                                visible: columnConsentsRow
                                                        ?.showFav ==
                                                    true,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        FutureBuilder<
                                                            List<
                                                                ViewUserFavoritesRow>>(
                                                          future:
                                                              ViewUserFavoritesTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'user_id',
                                                                  widget
                                                                      .profileId,
                                                                )
                                                                .order(
                                                                    'post_created_at'),
                                                            limit: 5,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitChasingDots(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .greenInit,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ViewUserFavoritesRow>
                                                                listViewViewUserFavoritesRowList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewViewUserFavoritesRowList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewViewUserFavoritesRow =
                                                                    listViewViewUserFavoritesRowList[
                                                                        listViewIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ProductDetailWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'postID':
                                                                            serializeParam(
                                                                          listViewViewUserFavoritesRow
                                                                              .postId,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      ItemCardHorizentalWidget(
                                                                    key: Key(
                                                                        'Key682_${listViewIndex}_of_${listViewViewUserFavoritesRowList.length}'),
                                                                    itemData:
                                                                        ItemCardHorizentalStruct(
                                                                      title: listViewViewUserFavoritesRow
                                                                          .title,
                                                                      description:
                                                                          listViewViewUserFavoritesRow
                                                                              .description,
                                                                      itemLocation:
                                                                          listViewViewUserFavoritesRow
                                                                              .userCity,
                                                                      createdAt:
                                                                          listViewViewUserFavoritesRow
                                                                              .postCreatedAt,
                                                                      itemLikes:
                                                                          listViewViewUserFavoritesRow
                                                                              .postLikes,
                                                                      mainImagePath: listViewViewUserFavoritesRow
                                                                          .images
                                                                          .firstOrNull,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ProfileExtendedWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'profileId':
                                                                          serializeParam(
                                                                        profilePageUserExtRow
                                                                            ?.id,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'fd2re1c8' /* See All */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                              SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  8.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<
                                                              ViewUserReviewsRow>>(
                                                        future:
                                                            ViewUserReviewsTable()
                                                                .queryRows(
                                                          queryFn: (q) => q
                                                              .eqOrNull(
                                                                'reviewed_user_id',
                                                                widget
                                                                    .profileId,
                                                              )
                                                              .eqOrNull(
                                                                'both_review_submitted',
                                                                true,
                                                              )
                                                              .order(
                                                                  'created_at'),
                                                          limit: 2,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitChasingDots(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .greenInit,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<ViewUserReviewsRow>
                                                              listViewViewUserReviewsRowList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewViewUserReviewsRowList
                                                                    .length,
                                                            separatorBuilder:
                                                                (_, __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            4.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewViewUserReviewsRow =
                                                                  listViewViewUserReviewsRowList[
                                                                      listViewIndex];
                                                              return ReviewCardWidget(
                                                                key: Key(
                                                                    'Key4jh_${listViewIndex}_of_${listViewViewUserReviewsRowList.length}'),
                                                                reviewData:
                                                                    ReviewCardDataStruct(
                                                                  userName:
                                                                      listViewViewUserReviewsRow
                                                                          .usernameWriter,
                                                                  userAvatar:
                                                                      listViewViewUserReviewsRow
                                                                          .profileAvatarWriter,
                                                                  comunicationScore:
                                                                      listViewViewUserReviewsRow
                                                                          .comunicationScore,
                                                                  qualitScore:
                                                                      listViewViewUserReviewsRow
                                                                          .qualityScsore,
                                                                  reliabilityScore:
                                                                      listViewViewUserReviewsRow
                                                                          .reliabilityScore,
                                                                  note:
                                                                      listViewViewUserReviewsRow
                                                                          .note,
                                                                  createAt:
                                                                      listViewViewUserReviewsRow
                                                                          .createdAt,
                                                                  avarageScore:
                                                                      listViewViewUserReviewsRow
                                                                          .avgReviewScore,
                                                                  fairnessScore:
                                                                      listViewViewUserReviewsRow
                                                                          .fairnessScore,
                                                                  reviewerId:
                                                                      listViewViewUserReviewsRow
                                                                          .writerId,
                                                                  reviewId:
                                                                      listViewViewUserReviewsRow
                                                                          .reviewId,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                ProfileExtendedWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'profileId':
                                                                      serializeParam(
                                                                    profilePageUserExtRow
                                                                        ?.id,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '9wndti6n' /* See All */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'j6r5bq14' /* See All */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 24.0)),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 32.0)),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
