import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_card/review_card_widget.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'profile_extended_model.dart';
export 'profile_extended_model.dart';

class ProfileExtendedWidget extends StatefulWidget {
  const ProfileExtendedWidget({
    super.key,
    this.profileId,
    required this.selectedTab,
  });

  final String? profileId;
  final int? selectedTab;

  static String routeName = 'ProfileExtended';
  static String routePath = '/profileExtended';

  @override
  State<ProfileExtendedWidget> createState() => _ProfileExtendedWidgetState();
}

class _ProfileExtendedWidgetState extends State<ProfileExtendedWidget>
    with TickerProviderStateMixin {
  late ProfileExtendedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileExtendedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatView = await ViewUserChatsTable().queryRows(
        queryFn: (q) => q
            .or("chat_sender.eq.${currentUserUid}, chat_recipient.eq.${currentUserUid}")
            .order('chat_created_at'),
      );
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
      length: 3,
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
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          unselectedLabelStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleMediumIsCustom,
                              ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'fweal07j' /* Posts */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'srw7h0cy' /* Favorites */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '3tbjy6b8' /* Reviews */,
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
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child:
                                        FutureBuilder<List<ViewPostFilterRow>>(
                                      future: FFAppState().userPosts(
                                        uniqueQueryKey: valueOrDefault<String>(
                                          widget.profileId,
                                          'userID',
                                        ),
                                        requestFn: () =>
                                            ViewPostFilterTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'user_id',
                                                widget.profileId,
                                              )
                                              .order('created_at'),
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
                                        List<ViewPostFilterRow>
                                            listViewViewPostFilterRowList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewPostFilterRowList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewViewPostFilterRow =
                                                listViewViewPostFilterRowList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'fa') {
                                                  context.pushNamed(
                                                    PostFaWidget.routeName,
                                                    queryParameters: {
                                                      'postID': serializeParam(
                                                        listViewViewPostFilterRow
                                                            .postId,
                                                        ParamType.String,
                                                      ),
                                                      'detailDataName':
                                                          serializeParam(
                                                        listViewViewPostFilterRow
                                                            .detailTable,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'nl') {
                                                    context.pushNamed(
                                                      PostNLWidget.routeName,
                                                      queryParameters: {
                                                        'postID':
                                                            serializeParam(
                                                          listViewViewPostFilterRow
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          listViewViewPostFilterRow
                                                              .detailTable,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      PostEnWidget.routeName,
                                                      queryParameters: {
                                                        'postID':
                                                            serializeParam(
                                                          listViewViewPostFilterRow
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          listViewViewPostFilterRow
                                                              .detailTable,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                }
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .itemCardHorizentalModels1
                                                    .getModel(
                                                  listViewViewPostFilterRow
                                                      .postId!,
                                                  listViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardHorizentalWidget(
                                                  key: Key(
                                                    'Key76t_${listViewViewPostFilterRow.postId!}',
                                                  ),
                                                  profileId: widget.profileId,
                                                  itemData:
                                                      ItemCardHorizentalStruct(
                                                    title:
                                                        listViewViewPostFilterRow
                                                            .title,
                                                    description:
                                                        listViewViewPostFilterRow
                                                            .description,
                                                    itemLocation:
                                                        listViewViewPostFilterRow
                                                            .city,
                                                    createdAt:
                                                        listViewViewPostFilterRow
                                                            .createdAt,
                                                    catID:
                                                        listViewViewPostFilterRow
                                                            .catId,
                                                    itemLikes:
                                                        listViewViewPostFilterRow
                                                            .postLikes,
                                                    mainImagePath:
                                                        listViewViewPostFilterRow
                                                            .images.firstOrNull,
                                                    postUserId:
                                                        listViewViewPostFilterRow
                                                            .userId,
                                                  ),
                                                  postId:
                                                      listViewViewPostFilterRow
                                                          .postId,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 80.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FutureBuilder<List<ViewUserFavoritesRow>>(
                                      future: FFAppState().userFavs(
                                        uniqueQueryKey: valueOrDefault<String>(
                                          widget.profileId,
                                          'userID',
                                        ),
                                        requestFn: () =>
                                            ViewUserFavoritesTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'user_id',
                                                widget.profileId,
                                              )
                                              .order('post_created_at'),
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
                                        List<ViewUserFavoritesRow>
                                            listViewViewUserFavoritesRowList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewUserFavoritesRowList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewViewUserFavoritesRow =
                                                listViewViewUserFavoritesRowList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'fa') {
                                                  context.pushNamed(
                                                    PostFaWidget.routeName,
                                                    queryParameters: {
                                                      'postID': serializeParam(
                                                        listViewViewUserFavoritesRow
                                                            .postId,
                                                        ParamType.String,
                                                      ),
                                                      'detailDataName':
                                                          serializeParam(
                                                        listViewViewUserFavoritesRow
                                                            .detailTable,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  if (FFLocalizations.of(
                                                              context)
                                                          .languageCode ==
                                                      'nl') {
                                                    context.pushNamed(
                                                      PostNLWidget.routeName,
                                                      queryParameters: {
                                                        'postID':
                                                            serializeParam(
                                                          listViewViewUserFavoritesRow
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          listViewViewUserFavoritesRow
                                                              .detailTable,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    context.pushNamed(
                                                      PostEnWidget.routeName,
                                                      queryParameters: {
                                                        'postID':
                                                            serializeParam(
                                                          listViewViewUserFavoritesRow
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          listViewViewUserFavoritesRow
                                                              .detailTable,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  }
                                                }
                                              },
                                              child: wrapWithModel(
                                                model: _model
                                                    .itemCardHorizentalModels2
                                                    .getModel(
                                                  listViewViewUserFavoritesRow
                                                      .postId!,
                                                  listViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardHorizentalWidget(
                                                  key: Key(
                                                    'Key4ge_${listViewViewUserFavoritesRow.postId!}',
                                                  ),
                                                  itemData:
                                                      ItemCardHorizentalStruct(
                                                    title:
                                                        listViewViewUserFavoritesRow
                                                            .title,
                                                    description:
                                                        listViewViewUserFavoritesRow
                                                            .description,
                                                    itemLocation:
                                                        listViewViewUserFavoritesRow
                                                            .city,
                                                    createdAt:
                                                        listViewViewUserFavoritesRow
                                                            .postCreatedAt,
                                                    itemLikes:
                                                        listViewViewUserFavoritesRow
                                                            .postLikes,
                                                    mainImagePath:
                                                        listViewViewUserFavoritesRow
                                                            .images.firstOrNull,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ].addToEnd(SizedBox(height: 80.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FutureBuilder<List<ViewUserReviewsRow>>(
                                      future: FFAppState().userReviews(
                                        uniqueQueryKey: valueOrDefault<String>(
                                          widget.profileId,
                                          'userID',
                                        ),
                                        requestFn: () =>
                                            ViewUserReviewsTable().queryRows(
                                          queryFn: (q) => q
                                              .eqOrNull(
                                                'reviewed_user_id',
                                                widget.profileId,
                                              )
                                              .eqOrNull(
                                                'both_review_submitted',
                                                true,
                                              )
                                              .order('created_at'),
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
                                        List<ViewUserReviewsRow>
                                            listViewViewUserReviewsRowList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewUserReviewsRowList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewViewUserReviewsRow =
                                                listViewViewUserReviewsRowList[
                                                    listViewIndex];
                                            return wrapWithModel(
                                              model: _model.reviewCardModels
                                                  .getModel(
                                                listViewViewUserReviewsRow
                                                    .reviewId!,
                                                listViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ReviewCardWidget(
                                                key: Key(
                                                  'Key14o_${listViewViewUserReviewsRow.reviewId!}',
                                                ),
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
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ].addToEnd(SizedBox(height: 80.0)),
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
        ),
      ),
    );
  }
}
