import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/review_card/review_card_widget.dart';
import '/shared_components/item_card_horizental/item_card_horizental_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
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
                            '47ohilj6' /* Chats */,
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: FutureBuilder<List<ViewUserPostsRow>>(
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
                                            color: FlutterFlowTheme.of(context)
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
                                          listViewViewUserPostsRowList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewViewUserPostsRow =
                                            listViewViewUserPostsRowList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ProductDetailWidget.routeName,
                                              queryParameters: {
                                                'postID': serializeParam(
                                                  listViewViewUserPostsRow
                                                      .sourceId,
                                                  ParamType.String,
                                                ),
                                                'mainCatID': serializeParam(
                                                  listViewViewUserPostsRow
                                                      .mainCatId,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ItemCardHorizentalWidget(
                                            key: Key(
                                                'Key76t_${listViewIndex}_of_${listViewViewUserPostsRowList.length}'),
                                            profileId: widget.profileId,
                                            itemData: ItemCardHorizentalStruct(
                                              title: listViewViewUserPostsRow
                                                  .title,
                                              description:
                                                  listViewViewUserPostsRow
                                                      .description,
                                              itemLocation:
                                                  listViewViewUserPostsRow
                                                      .userCity,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
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
                                  future: ViewUserFavoritesTable().queryRows(
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
                                            color: FlutterFlowTheme.of(context)
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
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewViewUserFavoritesRowList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewViewUserFavoritesRow =
                                            listViewViewUserFavoritesRowList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              ProductDetailWidget.routeName,
                                              queryParameters: {
                                                'postID': serializeParam(
                                                  listViewViewUserFavoritesRow
                                                      .postId,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ItemCardHorizentalWidget(
                                            key: Key(
                                                'Key4ge_${listViewIndex}_of_${listViewViewUserFavoritesRowList.length}'),
                                            itemData: ItemCardHorizentalStruct(
                                              title:
                                                  listViewViewUserFavoritesRow
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
                              ],
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
                                            color: FlutterFlowTheme.of(context)
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
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewViewUserReviewsRowList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 6.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewViewUserReviewsRow =
                                            listViewViewUserReviewsRowList[
                                                listViewIndex];
                                        return ReviewCardWidget(
                                          key: Key(
                                              'Key14o_${listViewIndex}_of_${listViewViewUserReviewsRowList.length}'),
                                          reviewData: ReviewCardDataStruct(
                                            userName: listViewViewUserReviewsRow
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
                                                listViewViewUserReviewsRow.note,
                                            createAt: listViewViewUserReviewsRow
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
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
                                if (widget.profileId == currentUserUid)
                                  Builder(
                                    builder: (context) {
                                      final chatview =
                                          _model.chatView?.toList() ?? [];

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: chatview.length,
                                        itemBuilder: (context, chatviewIndex) {
                                          final chatviewItem =
                                              chatview[chatviewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 13.5, 16.0, 13.5),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  ChatdetailWidget.routeName,
                                                  queryParameters: {
                                                    'chatId': serializeParam(
                                                      chatviewItem.chatId,
                                                      ParamType.int,
                                                    ),
                                                    'ownerID': serializeParam(
                                                      chatviewItem.postOwnerId,
                                                      ParamType.String,
                                                    ),
                                                    'postID': serializeParam(
                                                      chatviewItem.chatPostId,
                                                      ParamType.String,
                                                    ),
                                                    'ownerUserName':
                                                        serializeParam(
                                                      chatviewItem
                                                          .ownerUsername,
                                                      ParamType.String,
                                                    ),
                                                    'ownerAvatar':
                                                        serializeParam(
                                                      chatviewItem.ownerAvatar,
                                                      ParamType.String,
                                                    ),
                                                    'senderID': serializeParam(
                                                      chatviewItem.chatSender,
                                                      ParamType.String,
                                                    ),
                                                    'senderUserName':
                                                        serializeParam(
                                                      chatviewItem
                                                          .chatSendername,
                                                      ParamType.String,
                                                    ),
                                                    'senderAvatar':
                                                        serializeParam(
                                                      chatviewItem.senderAvatar,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 70.0,
                                                      maxHeight: 60.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                chatviewItem
                                                                    .postImage,
                                                                'https://bkygphvuuqmpmcfrncpm.supabase.co/storage/v1/object/public/yekja/Assets/default_image.jpg',
                                                              ),
                                                              width: 48.0,
                                                              height: 48.0,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  Alignment(
                                                                      0.0, 0.0),
                                                            ),
                                                          ),
                                                          if (chatviewItem
                                                                  .unseenCount! >
                                                              0)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child:
                                                                  badges.Badge(
                                                                badgeContent:
                                                                    Text(
                                                                  chatviewItem
                                                                      .unseenCount!
                                                                      .toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodySmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                      ),
                                                                ),
                                                                showBadge: true,
                                                                shape: badges
                                                                    .BadgeShape
                                                                    .circle,
                                                                badgeColor: Color(
                                                                    0xFFC04049),
                                                                elevation: 4.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                position: badges
                                                                        .BadgePosition
                                                                    .topEnd(),
                                                                animationType:
                                                                    badges
                                                                        .BadgeAnimationType
                                                                        .scale,
                                                                toAnimate: true,
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'About: ${chatviewItem.postTitle}',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      Text(
                                                        'From: ${chatviewItem.postOwnerId == currentUserUid ? chatviewItem.chatSendername : chatviewItem.ownerUsername}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Satoshi',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "MEd",
                                                          chatviewItem
                                                              .chatCreatedAt!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        textAlign:
                                                            TextAlign.justify,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Satoshi',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
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
