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
  });

  final String? profileId;

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
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                '47ohilj6' /* Awards */,
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
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child:
                                        FutureBuilder<List<ViewUserPostsRow>>(
                                      future: ViewUserPostsTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'user_id',
                                              widget.profileId,
                                            )
                                            .order('created_at'),
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
                                        List<ViewUserPostsRow>
                                            listViewViewUserPostsRowList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            16.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewUserPostsRowList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewViewUserPostsRow =
                                                listViewViewUserPostsRowList[
                                                    listViewIndex];
                                            return ItemCardHorizentalWidget(
                                              key: Key(
                                                  'Key76t_${listViewIndex}_of_${listViewViewUserPostsRowList.length}'),
                                              profileId: widget.profileId,
                                              itemData:
                                                  ItemCardHorizentalStruct(
                                                title: listViewViewUserPostsRow
                                                    .title,
                                                description:
                                                    listViewViewUserPostsRow
                                                        .description,
                                                itemLocation:
                                                    listViewViewUserPostsRow
                                                        .city,
                                                createdAt:
                                                    listViewViewUserPostsRow
                                                        .createdAt,
                                                catID: listViewViewUserPostsRow
                                                    .catId,
                                                itemLikes:
                                                    listViewViewUserPostsRow
                                                        .postLikes,
                                                mainImagePath: listViewViewUserPostsRow
                                                                .images
                                                                .firstOrNull !=
                                                            null &&
                                                        listViewViewUserPostsRow
                                                                .images
                                                                .firstOrNull !=
                                                            ''
                                                    ? listViewViewUserPostsRow
                                                        .images.firstOrNull
                                                    : 'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/default_image.jpg',
                                                postUserId:
                                                    listViewViewUserPostsRow
                                                        .userId,
                                              ),
                                              postId: listViewViewUserPostsRow
                                                  .sourceId,
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
                                      future:
                                          ViewUserFavoritesTable().queryRows(
                                        queryFn: (q) => q
                                            .eqOrNull(
                                              'user_id',
                                              widget.profileId,
                                            )
                                            .order('post_created_at'),
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

                                        return ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewUserFavoritesRowList
                                                  .length,
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
                                                context.pushNamed(
                                                  PostWidget.routeName,
                                                  queryParameters: {
                                                    'postID': serializeParam(
                                                      listViewViewUserFavoritesRow
                                                          .postId,
                                                      ParamType.String,
                                                    ),
                                                    'mainCatID': serializeParam(
                                                      0,
                                                      ParamType.int,
                                                    ),
                                                    'detailDataName':
                                                        serializeParam(
                                                      listViewViewUserFavoritesRow
                                                          .detailTable,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: ItemCardHorizentalWidget(
                                                key: Key(
                                                    'Key4ge_${listViewIndex}_of_${listViewViewUserFavoritesRowList.length}'),
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
                                      future: ViewUserReviewsTable().queryRows(
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
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewViewUserReviewsRowList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 6.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewViewUserReviewsRow =
                                                listViewViewUserReviewsRowList[
                                                    listViewIndex];
                                            return ReviewCardWidget(
                                              key: Key(
                                                  'Key14o_${listViewIndex}_of_${listViewViewUserReviewsRowList.length}'),
                                              reviewData: ReviewCardDataStruct(
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
                                                note: listViewViewUserReviewsRow
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
                                  ].addToEnd(SizedBox(height: 80.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  1.0, 0.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'hgewwtg0' /* Not received an award yet.  */,
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
