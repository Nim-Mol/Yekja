import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/shared_components/confirm_cancel_pop_up/confirm_cancel_pop_up_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_edit_model.dart';
export 'profile_edit_model.dart';

class ProfileEditWidget extends StatefulWidget {
  const ProfileEditWidget({
    super.key,
    int? selectedTab,
  }) : this.selectedTab = selectedTab ?? 0;

  final int selectedTab;

  static String routeName = 'ProfileEdit';
  static String routePath = '/editProfile';

  @override
  State<ProfileEditWidget> createState() => _ProfileEditWidgetState();
}

class _ProfileEditWidgetState extends State<ProfileEditWidget>
    with TickerProviderStateMixin {
  late ProfileEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool expandableListenerRegistered1 = false;
  bool expandableListenerRegistered2 = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.tabBarController!.animateTo(
          widget.selectedTab,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);

    _model.userNameFocusNode ??= FocusNode();

    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameFocusNode ??= FocusNode();

    _model.biographyFocusNode ??= FocusNode();

    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);

    _model.emailFocusNode ??= FocusNode();

    _model.phoneNumberFocusNode ??= FocusNode();

    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false);

    _model.instagramLinkFocusNode ??= FocusNode();

    animationsMap.addAll({
      'listViewOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'listViewOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SafeArea(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 480.0,
                        maxHeight: 1000.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).greenInit,
                                padding: EdgeInsets.all(2.0),
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '1tg5n8be' /* Personal */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '6a2fziro' /* Privacy Setting */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '9w8zjkix' /* Terms & Conditions */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) =>
                                        FutureBuilder<List<UserExtRow>>(
                                      future: UserExtTable().querySingleRow(
                                        queryFn: (q) => q.eqOrNull(
                                          'id',
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
                                                    FlutterFlowTheme.of(context)
                                                        .greenInit,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UserExtRow> columnUserExtRowList =
                                            snapshot.data!;

                                        final columnUserExtRow =
                                            columnUserExtRowList.isNotEmpty
                                                ? columnUserExtRowList.first
                                                : null;

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Container(
                                                          height: 200.0,
                                                          child: Stack(
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  columnUserExtRow?.profileWallpaper !=
                                                                              null &&
                                                                          columnUserExtRow?.profileWallpaper !=
                                                                              ''
                                                                      ? columnUserExtRow!
                                                                          .profileWallpaper!
                                                                      : FFAppConstants
                                                                          .DefultProfileWalpaper,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 120.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            columnUserExtRow?.profileAvatar == null || columnUserExtRow?.profileAvatar == ''
                                                                                ? FFAppConstants.DefultProfilePhoto
                                                                                : columnUserExtRow!.profileAvatar!,
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                120.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (columnUserExtRow
                                                                              ?.profileAvatar !=
                                                                          FFAppConstants
                                                                              .DefultProfilePhoto)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Builder(
                                                                            builder: (context) =>
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: ConfirmCancelPopUpWidget(
                                                                                          header: 'Remove Profile photo',
                                                                                          hintText: 'Are You sure you want to Remove your profile photo? ',
                                                                                          confirmText: 'Remove',
                                                                                          onConfirmAction: () async {
                                                                                            await deleteSupabaseFileFromPublicUrl(columnUserExtRow!.profileAvatar!);
                                                                                            _model.removeAvatar = await UserExtTable().update(
                                                                                              data: {
                                                                                                'profile_avatar': '',
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id',
                                                                                                currentUserUid,
                                                                                              ),
                                                                                              returnRows: true,
                                                                                            );
                                                                                          },
                                                                                          onCancelAction: () async {},
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.close_sharp,
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              2.0,
                                                                              2.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                context: context,
                                                                                storageFolderPath: 'UserProfile',
                                                                                maxWidth: 800.00,
                                                                                allowPhoto: true,
                                                                              );
                                                                              if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                safeSetState(() => _model.isDataUploading_newAvatar = true);
                                                                                var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                var downloadUrls = <String>[];
                                                                                try {
                                                                                  selectedUploadedFiles = selectedMedia
                                                                                      .map((m) => FFUploadedFile(
                                                                                            name: m.storagePath.split('/').last,
                                                                                            bytes: m.bytes,
                                                                                            height: m.dimensions?.height,
                                                                                            width: m.dimensions?.width,
                                                                                            blurHash: m.blurHash,
                                                                                            originalFilename: m.originalFilename,
                                                                                          ))
                                                                                      .toList();

                                                                                  downloadUrls = await uploadSupabaseStorageFiles(
                                                                                    bucketName: 'yekja',
                                                                                    selectedFiles: selectedMedia,
                                                                                  );
                                                                                } finally {
                                                                                  _model.isDataUploading_newAvatar = false;
                                                                                }
                                                                                if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                  safeSetState(() {
                                                                                    _model.uploadedLocalFile_newAvatar = selectedUploadedFiles.first;
                                                                                    _model.uploadedFileUrl_newAvatar = downloadUrls.first;
                                                                                  });
                                                                                } else {
                                                                                  safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              }

                                                                              if (_model.uploadedFileUrl_newAvatar != '') {
                                                                                if (columnUserExtRow?.profileAvatar != _model.uploadedFileUrl_newAvatar) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Profile image successfully changed.',
                                                                                        style: TextStyle(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 5500),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).successSnack,
                                                                                    ),
                                                                                  );
                                                                                  _model.updatedAvatar = await UserExtTable().update(
                                                                                    data: {
                                                                                      'profile_avatar': _model.uploadedFileUrl_newAvatar,
                                                                                    },
                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                      'id',
                                                                                      currentUserUid,
                                                                                    ),
                                                                                    returnRows: true,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  await deleteSupabaseFileFromPublicUrl(columnUserExtRow!.profileAvatar!);
                                                                                  FFAppState().updateUserInfoStruct(
                                                                                    (e) => e..avatar = _model.uploadedFileUrl_newAvatar,
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                } else {
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }

                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.camera_alt,
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              size: 27.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderRadius:
                                                                            50.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .chevron_left,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .goNamed(
                                                                            ProfilePageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'profileId': serializeParam(
                                                                                currentUserUid,
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderRadius:
                                                                            50.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .edit_square,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          var _shouldSetState =
                                                                              false;
                                                                          final selectedMedia =
                                                                              await selectMediaWithSourceBottomSheet(
                                                                            context:
                                                                                context,
                                                                            storageFolderPath:
                                                                                'UserProfile',
                                                                            maxWidth:
                                                                                800.00,
                                                                            allowPhoto:
                                                                                true,
                                                                          );
                                                                          if (selectedMedia != null &&
                                                                              selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                            safeSetState(() =>
                                                                                _model.isDataUploading_newBackground = true);
                                                                            var selectedUploadedFiles =
                                                                                <FFUploadedFile>[];

                                                                            var downloadUrls =
                                                                                <String>[];
                                                                            try {
                                                                              selectedUploadedFiles = selectedMedia
                                                                                  .map((m) => FFUploadedFile(
                                                                                        name: m.storagePath.split('/').last,
                                                                                        bytes: m.bytes,
                                                                                        height: m.dimensions?.height,
                                                                                        width: m.dimensions?.width,
                                                                                        blurHash: m.blurHash,
                                                                                        originalFilename: m.originalFilename,
                                                                                      ))
                                                                                  .toList();

                                                                              downloadUrls = await uploadSupabaseStorageFiles(
                                                                                bucketName: 'yekja',
                                                                                selectedFiles: selectedMedia,
                                                                              );
                                                                            } finally {
                                                                              _model.isDataUploading_newBackground = false;
                                                                            }
                                                                            if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                                downloadUrls.length == selectedMedia.length) {
                                                                              safeSetState(() {
                                                                                _model.uploadedLocalFile_newBackground = selectedUploadedFiles.first;
                                                                                _model.uploadedFileUrl_newBackground = downloadUrls.first;
                                                                              });
                                                                            } else {
                                                                              safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          }

                                                                          if (_model.uploadedFileUrl_newBackground != '') {
                                                                            if (columnUserExtRow?.profileWallpaper ==
                                                                                _model.uploadedFileUrl_newBackground) {
                                                                              await Future.delayed(
                                                                                Duration(
                                                                                  milliseconds: 1000,
                                                                                ),
                                                                              );
                                                                            }
                                                                            _model.newwalpaper =
                                                                                await UserExtTable().update(
                                                                              data: {
                                                                                'profile_wallpaper': _model.uploadedFileUrl_newBackground,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'id',
                                                                                currentUserUid,
                                                                              ),
                                                                              returnRows: true,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            await deleteSupabaseFileFromPublicUrl(columnUserExtRow!.profileWallpaper!);
                                                                          } else {
                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                            return;
                                                                          }

                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            30.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: ConfirmCancelPopUpWidget(
                                                                                header: 'Remove Profile Wallpaper',
                                                                                hintText: 'Are You sure you want to Remove your profile wallpaper? ',
                                                                                cancelText: 'Cancel',
                                                                                confirmText: 'Remove',
                                                                                onConfirmAction: () async {
                                                                                  await deleteSupabaseFileFromPublicUrl(columnUserExtRow!.profileWallpaper!);
                                                                                  await UserExtTable().update(
                                                                                    data: {
                                                                                      'profile_wallpaper': '',
                                                                                    },
                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                      'id',
                                                                                      currentUserUid,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                onCancelAction: () async {},
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
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
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  8.0,
                                                                  16.0,
                                                                  8.0),
                                                      child:
                                                          Builder(builder: (_) {
                                                        if (!expandableListenerRegistered1) {
                                                          expandableListenerRegistered1 =
                                                              true;
                                                          _model
                                                              .expandableExpandableController1
                                                              .addListener(
                                                            () async {
                                                              if (_model
                                                                      .expandableExpandableController1
                                                                      .expanded ==
                                                                  true) {
                                                                _model.isPersonalOpen =
                                                                    true;
                                                                _model.isSocialOpen =
                                                                    false;
                                                                _model.isContactOpen =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.isPersonalOpen =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                          );
                                                        }
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          color:
                                                              Color(0x00000000),
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController1,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'eun17pjp' /* Personal Information */,
                                                                ),
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Satoshi',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              collapsed:
                                                                  Container(
                                                                width: 100.0,
                                                                height: 1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              expanded: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Form(
                                                                      key: _model
                                                                          .formKey2,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.userNameTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                columnUserExtRow?.userName,
                                                                          ),
                                                                          focusNode:
                                                                              _model.userNameFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.userNameTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '516rrlak' /* User name */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '6gbj58h2' /* A unique name to  display on y... */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).bordergray,
                                                                                  fontSize: 17.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  lineHeight: 1.2,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                13.0,
                                                                                0.0,
                                                                                13.0),
                                                                            suffixIcon: _model.userNameTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.userNameTextController?.clear();
                                                                                      if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                        return;
                                                                                      }
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 10.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          validator: _model
                                                                              .userNameTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Form(
                                                                      key: _model
                                                                          .formKey1,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.firstNameTextController ??=
                                                                                TextEditingController(
                                                                          text:
                                                                              columnUserExtRow?.firstName,
                                                                        ),
                                                                        focusNode:
                                                                            _model.firstNameFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.firstNameTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            if (_model.firstNameTextController.text != '') {
                                                                              if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              false,
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'i82qrrua' /* First name */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '24aggfes' /* First name */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).bordergray,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          errorStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                lineHeight: 1.2,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              13.0,
                                                                              0.0,
                                                                              13.0),
                                                                          suffixIcon: _model.firstNameTextController!.text.isNotEmpty
                                                                              ? InkWell(
                                                                                  onTap: () async {
                                                                                    _model.firstNameTextController?.clear();
                                                                                    if (_model.firstNameTextController.text != '') {
                                                                                      if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.clear,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 10.0,
                                                                                  ),
                                                                                )
                                                                              : null,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        validator: _model
                                                                            .firstNameTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    Form(
                                                                      key: _model
                                                                          .formKey6,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.lastNameTextController ??=
                                                                                TextEditingController(
                                                                          text:
                                                                              columnUserExtRow?.lastName,
                                                                        ),
                                                                        focusNode:
                                                                            _model.lastNameFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.lastNameTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            if (_model.lastNameTextController.text != '') {
                                                                              if (_model.formKey6.currentState == null || !_model.formKey6.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              false,
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'si9fuiqf' /* Last name */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '4nnyiwnp' /* Last name */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                          errorStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.2,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              13.0,
                                                                              0.0,
                                                                              13.0),
                                                                          suffixIcon: _model.lastNameTextController!.text.isNotEmpty
                                                                              ? InkWell(
                                                                                  onTap: () async {
                                                                                    _model.lastNameTextController?.clear();
                                                                                    if (_model.lastNameTextController.text != '') {
                                                                                      if (_model.formKey6.currentState == null || !_model.formKey6.currentState!.validate()) {
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.clear,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 10.0,
                                                                                  ),
                                                                                )
                                                                              : null,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        validator: _model
                                                                            .lastNameTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    Form(
                                                                      key: _model
                                                                          .formKey3,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.biographyTextController ??=
                                                                                TextEditingController(
                                                                          text:
                                                                              columnUserExtRow?.biography,
                                                                        ),
                                                                        focusNode:
                                                                            _model.biographyFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.biographyTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            if (_model.biographyTextController.text != '') {
                                                                              if (_model.formKey3.currentState == null || !_model.formKey3.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              false,
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'og8w26in' /* Biography */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          alignLabelWithHint:
                                                                              false,
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '1vdcvtwy' /* Let everyone know about you. */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).bordergray,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          errorStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.2,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              13.0,
                                                                              0.0,
                                                                              13.0),
                                                                          suffixIcon: _model.biographyTextController!.text.isNotEmpty
                                                                              ? InkWell(
                                                                                  onTap: () async {
                                                                                    _model.biographyTextController?.clear();
                                                                                    if (_model.biographyTextController.text != '') {
                                                                                      if (_model.formKey3.currentState == null || !_model.formKey3.currentState!.validate()) {
                                                                                        return;
                                                                                      }
                                                                                    }
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.clear,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 10.0,
                                                                                  ),
                                                                                )
                                                                              : null,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLines:
                                                                            7,
                                                                        maxLength:
                                                                            250,
                                                                        maxLengthEnforcement:
                                                                            MaxLengthEnforcement.enforced,
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        validator: _model
                                                                            .biographyTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    false,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .top,
                                                                hasIcon: true,
                                                                iconSize: 20.0,
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child:
                                                        Builder(builder: (_) {
                                                      if (!expandableListenerRegistered2) {
                                                        expandableListenerRegistered2 =
                                                            true;
                                                        _model
                                                            .expandableExpandableController2
                                                            .addListener(
                                                          () async {
                                                            if (_model
                                                                    .expandableExpandableController2
                                                                    .expanded ==
                                                                true) {
                                                              _model.isPersonalOpen =
                                                                  false;
                                                              _model.isSocialOpen =
                                                                  false;
                                                              _model.isContactOpen =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.isContactOpen =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                        );
                                                      }
                                                      return Container(
                                                        width: double.infinity,
                                                        color:
                                                            Color(0x00000000),
                                                        child:
                                                            ExpandableNotifier(
                                                          controller: _model
                                                              .expandableExpandableController2,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'z3xwndw3' /* Contact Information */,
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Satoshi',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            collapsed:
                                                                Container(
                                                              width: 100.0,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            expanded: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          10.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      children: [
                                                                        TextFormField(
                                                                          controller: _model.emailTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                columnUserExtRow?.email,
                                                                          ),
                                                                          focusNode:
                                                                              _model.emailFocusNode,
                                                                          autofocus:
                                                                              false,
                                                                          textInputAction:
                                                                              TextInputAction.next,
                                                                          readOnly:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            isDense:
                                                                                false,
                                                                            labelText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '2hyki5q1' /* Email */,
                                                                            ),
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'uzu5pe2d' /* City */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).bordergray,
                                                                                  fontSize: 17.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Satoshi',
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  lineHeight: 1.2,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                13.0,
                                                                                0.0,
                                                                                13.0),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          cursorColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          validator: _model
                                                                              .emailTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              context.pushNamed(ChangeEmailPageWidget.routeName);
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'zzq7g7vx' /* Change Email */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 20.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).green1,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w100,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -4.07,
                                                                              1.17),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              context.goNamed(ResetPasswordPageWidget.routeName);
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'nbv3szt9' /* Change password */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: Color(0x42228BE6),
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Form(
                                                                    key: _model
                                                                        .formKey5,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .disabled,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.phoneNumberTextController ??=
                                                                                TextEditingController(
                                                                          text:
                                                                              columnUserExtRow?.phonenumber,
                                                                        ),
                                                                        focusNode:
                                                                            _model.phoneNumberFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.phoneNumberTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            if (_model.phoneNumberTextController.text != '') {
                                                                              if (_model.formKey5.currentState == null || !_model.formKey5.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                            }
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              false,
                                                                          labelText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '2r3qk0eg' /* PhoneNumber */,
                                                                          ),
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'b8jc2zrs' /* 0612345678 */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).bordergray,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          errorStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Satoshi',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.2,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              13.0,
                                                                              0.0,
                                                                              13.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Satoshi',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        validator: _model
                                                                            .phoneNumberTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        58.38,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              FlutterFlowDropDown<String>(
                                                                            controller: _model.dropdownCityValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropdownCityValue ??= columnUserExtRow?.userCity,
                                                                            ),
                                                                            options:
                                                                                FFAppState().citiesApp.map((e) => e.name).toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.dropdownCityValue = val);
                                                                              FFAppState().updatePostStateStruct(
                                                                                (e) => e..city = _model.dropdownCityValue,
                                                                              );
                                                                              safeSetState(() {});
                                                                            },
                                                                            height:
                                                                                50.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '25ca7h3c' /* Select */,
                                                                            ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderWidth:
                                                                                0.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.9,
                                                                              -1.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'padtwd63' /* City */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 10.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                            theme:
                                                                ExpandableThemeData(
                                                              tapHeaderToExpand:
                                                                  true,
                                                              tapBodyToExpand:
                                                                  false,
                                                              tapBodyToCollapse:
                                                                  false,
                                                              headerAlignment:
                                                                  ExpandablePanelHeaderAlignment
                                                                      .top,
                                                              hasIcon: true,
                                                              iconSize: 20.0,
                                                              iconColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 12.0, 16.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      color: Color(0x00000000),
                                                      child: ExpandableNotifier(
                                                        controller: _model
                                                            .expandableExpandableController3,
                                                        child: ExpandablePanel(
                                                          header: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'cvyikj5w' /* Social Media Links */,
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          collapsed: Container(
                                                            width: 100.0,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          expanded: Form(
                                                            key:
                                                                _model.formKey4,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        _model.instagramLinkTextController ??=
                                                                            TextEditingController(
                                                                      text: columnUserExtRow
                                                                          ?.instagramLink,
                                                                    ),
                                                                    focusNode:
                                                                        _model
                                                                            .instagramLinkFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.instagramLinkTextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () async {
                                                                        if (_model.instagramLinkTextController.text !=
                                                                                '') {
                                                                          if (_model.formKey4.currentState == null ||
                                                                              !_model.formKey4.currentState!.validate()) {
                                                                            return;
                                                                          }
                                                                        }
                                                                      },
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          false,
                                                                      labelText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'qne00b69' /* Instagram link */,
                                                                      ),
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                13.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'flzqxlxk' /* Instagram link */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).bordergray,
                                                                            fontSize:
                                                                                17.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      errorStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Satoshi',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            lineHeight:
                                                                                1.2,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          13.0,
                                                                          0.0,
                                                                          13.0),
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Satoshi',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    validator: _model
                                                                        .instagramLinkTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          theme:
                                                              ExpandableThemeData(
                                                            tapHeaderToExpand:
                                                                _model
                                                                    .isSocialOpen,
                                                            tapBodyToExpand:
                                                                false,
                                                            tapBodyToCollapse:
                                                                false,
                                                            headerAlignment:
                                                                ExpandablePanelHeaderAlignment
                                                                    .top,
                                                            hasIcon: true,
                                                            iconSize: 20.0,
                                                            iconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 480.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
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
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            _model.updatedUser =
                                                                await UserExtTable()
                                                                    .update(
                                                              data: {
                                                                'user_name': _model
                                                                    .userNameTextController
                                                                    .text,
                                                                'phonenumber':
                                                                    _model
                                                                        .phoneNumberTextController
                                                                        .text,
                                                                'biography': _model
                                                                    .biographyTextController
                                                                    .text,
                                                                'first_name': _model
                                                                    .firstNameTextController
                                                                    .text,
                                                                'last_name': _model
                                                                    .lastNameTextController
                                                                    .text,
                                                                'user_city': _model
                                                                    .dropdownCityValue,
                                                                'instagram_link':
                                                                    _model
                                                                        .instagramLinkTextController
                                                                        .text,
                                                              },
                                                              matchingRows:
                                                                  (rows) => rows
                                                                      .eqOrNull(
                                                                'id',
                                                                currentUserUid,
                                                              ),
                                                              returnRows: true,
                                                            );
                                                            FFAppState()
                                                                .updateUserInfoStruct(
                                                              (e) => e
                                                                ..userName = _model
                                                                    .updatedUser
                                                                    ?.firstOrNull
                                                                    ?.userName
                                                                ..name = _model
                                                                    .updatedUser
                                                                    ?.firstOrNull
                                                                    ?.firstName
                                                                ..lastName = _model
                                                                    .updatedUser
                                                                    ?.firstOrNull
                                                                    ?.lastName
                                                                ..city = _model
                                                                    .updatedUser
                                                                    ?.firstOrNull
                                                                    ?.userCity
                                                                ..instaLink = _model
                                                                    .updatedUser
                                                                    ?.firstOrNull
                                                                    ?.instagramLink,
                                                            );
                                                            safeSetState(() {});

                                                            context.pushNamed(
                                                              ProfilePageWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'profileId':
                                                                    serializeParam(
                                                                  currentUserUid,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Your changes were successfully saved.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .successSnack,
                                                              ),
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'mb8qxwm3' /* Save */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .greenInit,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleSmallIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 16.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'j2hj0yzw' /* To delete your account,  */,
                                                            ),
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
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ayyq9da0' /* click here. */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
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
                                                            mouseCursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap =
                                                                      () async {
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
                                                                              ConfirmCancelPopUpWidget(
                                                                            header:
                                                                                FFLocalizations.of(context).getText(
                                                                              'c1ajh2vc' /* Are you sure you want to delet... */,
                                                                            ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'cpxsrki1' /* By confirming you cannot reviv... */,
                                                                            ),
                                                                            onConfirmAction:
                                                                                () async {
                                                                              // CompeleteSoft Delete
                                                                              _model.succes = await actions.userSoftDeleteAsync();
                                                                              if (_model.succes!) {
                                                                                await launchUrl(Uri(
                                                                                    scheme: 'mailto',
                                                                                    path: currentUserEmail,
                                                                                    query: {
                                                                                      'subject': 'Delete account',
                                                                                      'body': 'We are sorry that you decided to remove your account. We hope to see you back soon.',
                                                                                    }.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')));
                                                                                FFAppState().userInfo = UserInfoStruct.fromSerializableMap(jsonDecode('{\"Fav_List\":\"[]\"}'));
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Sorry! something went wrong. please try  again later.',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: Color(0x75EA1713),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                            onCancelAction:
                                                                                () async {},
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                          )
                                                        ],
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 0.0),
                                      child: FutureBuilder<List<ConsentsRow>>(
                                        future: ConsentsTable().querySingleRow(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .greenInit,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ConsentsRow>
                                              columnConsentsRowList =
                                              snapshot.data!;

                                          final columnConsentsRow =
                                              columnConsentsRowList.isNotEmpty
                                                  ? columnConsentsRowList.first
                                                  : null;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
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
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(_model
                                                                  .allowProfilePhotoValue!
                                                                  .toString()),
                                                              content: Text(_model
                                                                  .allowProfilePhoto
                                                                  .toString()),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9gnchgjf' /* Allow users to see my profile ... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmallIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowProfilePhotoValue ??=
                                                          columnConsentsRow!
                                                              .showProfileImage,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .allowProfilePhotoValue =
                                                            newValue);
                                                        if (newValue) {
                                                          _model.allowProfilePhoto =
                                                              true;
                                                        } else {
                                                          _model.allowProfilePhoto =
                                                              false;
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nnxca66f' /* Allow users to see my social m... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowSocialMediaValue ??=
                                                          columnConsentsRow!
                                                              .showSocialmedia,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .allowSocialMediaValue =
                                                            newValue);
                                                        if (newValue) {
                                                          _model.allowSocialMedia =
                                                              true;
                                                        } else {
                                                          _model.allowSocialMedia =
                                                              false;
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1g8re0aj' /* Allow users to see my favorite... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowFavListValue ??=
                                                          columnConsentsRow!
                                                              .showFav,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .allowFavListValue =
                                                            newValue);
                                                        if (newValue) {
                                                          _model.allowFavList =
                                                              true;
                                                        } else {
                                                          _model.allowFavList =
                                                              false;
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qa16wop5' /* Allow users to call me. */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowCallValue ??=
                                                          columnConsentsRow!
                                                              .allowCall,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .allowCallValue =
                                                            newValue);
                                                        if (newValue) {
                                                          _model.allowCall =
                                                              true;
                                                        } else {
                                                          _model.allowCall =
                                                              false;
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'i62uuxwh' /* Allow users to message me. */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowMessageValue1 ??=
                                                          columnConsentsRow!
                                                              .allowMessage,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .allowMessageValue1 =
                                                            newValue);
                                                        if (newValue) {
                                                          _model.allowMessage =
                                                              true;
                                                        } else {
                                                          _model.allowMessage =
                                                              false;
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '34uhaw3r' /* Allow users to share my posts. */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowMessageValue2 ??=
                                                          columnConsentsRow!
                                                              .allowSharePost,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                .allowMessageValue2 =
                                                            newValue);
                                                        if (newValue) {
                                                          _model.allowMessage =
                                                              true;
                                                        } else {
                                                          _model.allowMessage =
                                                              false;
                                                        }
                                                      },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'yz5gspss' /* Agreed to the terms and privic... */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallIsCustom,
                                                              ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scaleX: 0.8,
                                                    scaleY: 0.8,
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .allowMessageValue3 ??=
                                                          columnConsentsRow!
                                                              .termsAndPolicy,
                                                      onChanged: (columnConsentsRow
                                                                  ?.termsAndPolicy ==
                                                              true)
                                                          ? null
                                                          : (newValue) async {
                                                              safeSetState(() =>
                                                                  _model.allowMessageValue3 =
                                                                      newValue);
                                                              if (newValue) {
                                                                _model.allowMessage =
                                                                    true;
                                                              } else {
                                                                _model.allowMessage =
                                                                    false;
                                                              }
                                                            },
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      activeTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      inactiveTrackColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      inactiveThumbColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await ConsentsTable()
                                                              .update(
                                                            data: {
                                                              'show_socialmedia':
                                                                  _model
                                                                      .allowSocialMediaValue,
                                                              'allow_call': _model
                                                                  .allowCallValue,
                                                              'show_profile_image':
                                                                  _model
                                                                      .allowProfilePhotoValue,
                                                              'allow_message':
                                                                  _model
                                                                      .allowMessageValue1,
                                                              'show_fav': _model
                                                                  .allowFavListValue,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'user_id',
                                                              currentUserUid,
                                                            ),
                                                          );
                                                          _model.allowProfilePhoto =
                                                              _model
                                                                  .allowProfilePhotoValue!;
                                                          _model.allowSocialMedia =
                                                              _model
                                                                  .allowSocialMediaValue!;
                                                          _model.allowFavList =
                                                              _model
                                                                  .allowFavListValue!;
                                                          _model.allowCall = _model
                                                              .allowCallValue!;
                                                          _model.allowMessage =
                                                              _model
                                                                  .allowMessageValue1!;
                                                          safeSetState(() {});
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Consents are successfully saved.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0x4240C057),
                                                            ),
                                                          );
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds:
                                                                  2000,
                                                            ),
                                                          );
                                                          context.safePop();

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'niqgbb33' /* Save  */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .greenInit,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ListView(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            16.0,
                                            0,
                                            24.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '0eqbpyfb' /* Last update: */,
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '86b9dl0z' /*  27/12/2023 */,
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 8.0, 20.0, 24.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5rxx4eqd' /* Please read these terms of ser... */,
                                                ),
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'z6oq407a' /* Conditions of Uses */,
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 16.0, 20.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4hmiyku9' /* It is a long established fact ... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'listViewOnPageLoadAnimation1']!),
                                        SizedBox(
                                          width: 300.0,
                                          child: Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: ListView(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                16.0,
                                                0,
                                                24.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bugt9s1t' /* Types of data we collect */,
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.5,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7nzis5rd' /* Torem ipsum dolor sit amet, co... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Satoshi',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'fiujz5ly' /* Use of your personal data */,
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '874gf5jc' /* Torem ipsum dolor sit amet, co... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'stvk2rzm' /* Disclosure of your data */,
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'gbbs7qhx' /* Lorem ipsum dolor sit amet, co... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Satoshi',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 17.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ).animateOnPageLoad(animationsMap[
                                                'listViewOnPageLoadAnimation2']!),
                                          ),
                                        ),
                                      ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
