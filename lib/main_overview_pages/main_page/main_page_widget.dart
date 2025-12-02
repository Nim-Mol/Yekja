import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main_overview_pages/item_card_global/item_card_global_widget.dart';
import '/shared_components/nav_bar/nav_bar_widget.dart';
import '/shared_components/shout_out_card/shout_out_card_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({
    super.key,
    required this.selectedTab,
  });

  final int? selectedTab;

  static String routeName = 'MainPage';
  static String routePath = '/mainPage';

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
                      isScrollable: true,
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
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleMediumIsCustom,
                          ),
                      indicatorColor: FlutterFlowTheme.of(context).primary,
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'q6o9bjar' /* Market */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '7w4oeybw' /* Voluntary Support */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '1y5mye93' /* Services & Jobs */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'ijphs52w' /* Events & Announcements */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 2,
                              catId: 6,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewMarketPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewMarket();
                          },
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 1,
                              catId: 9,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewSupportPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewSupport();
                          },
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 3,
                              catId: 15,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewSkillsPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewSkills();
                          },
                          () async {
                            FFAppState().filterSmall = FilterSmallModelStruct(
                              mainCatId: 4,
                              catId: 16,
                            );
                            safeSetState(() {});
                            safeSetState(() => _model
                                .listviewEventsPagingController
                                ?.refresh());
                            await _model.waitForOnePageForListviewEvents();
                          }
                        ][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 12.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final categories = FFAppState()
                                          .SubcatApp
                                          .where((e) =>
                                              e.mainCatId ==
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId)
                                          .toList()
                                          .unique((e) => e.catId)
                                          .toList();

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                          childAspectRatio: 1.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: categories.length,
                                        itemBuilder:
                                            (context, categoriesIndex) {
                                          final categoriesItem =
                                              categories[categoriesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState()
                                                  .updateFilterSmallStruct(
                                                (e) => e
                                                  ..catId =
                                                      categoriesItem.catId,
                                              );
                                              safeSetState(() {});
                                              safeSetState(() => _model
                                                  .listviewMarketPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForListviewMarket();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .marketBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: categoriesItem.catId ==
                                                          FFAppState()
                                                              .filterSmall
                                                              .catId
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  width: 0.3,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: custom_widgets
                                                          .SvgRenderer(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        svgCode: categoriesItem
                                                            .effectiveIconImage,
                                                        iconColor: Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? functions.hexToColor(
                                                                categoriesItem
                                                                    .effectiveColorHex,
                                                                Color(
                                                                    0x00000000))
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .business,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'fa'
                                                                ? categoriesItem
                                                                    .catNameFa
                                                                : (FFLocalizations.of(context)
                                                                            .languageCode ==
                                                                        'nl'
                                                                    ? categoriesItem
                                                                        .catNameNl
                                                                    : categoriesItem
                                                                        .catName),
                                                            'category',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: categoriesItem
                                                                            .catId ==
                                                                        FFAppState()
                                                                            .filterSmall
                                                                            .catId
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .bordergray,
                                                                fontSize: 13.0,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownSortValueController1 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from([
                                                  'created_at.desc.nullslast',
                                                  'post_likes.desc.nullslast,created_at.desc'
                                                ]),
                                                optionLabels: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dvxs0iu7' /* Recent */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'x8u4gjyb' /* Popular */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .dropDownSortValue1 =
                                                      val);
                                                  _model.sortBy = _model
                                                      .dropDownSortValue1!;
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewMarketPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewMarket();
                                                },
                                                width: 130.0,
                                                height: 34.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'z03svtjd' /* Sort by */,
                                                ),
                                                icon: Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .bordergray,
                                                borderWidth: 0.3,
                                                borderRadius: 24.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        safeSetState(() => _model
                                            .listviewMarketPagingController
                                            ?.refresh());
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>.separated(
                                        pagingController:
                                            _model.setListviewMarketController(
                                          (nextPageMarker) =>
                                              FilterApiCall.call(
                                            offset:
                                                nextPageMarker.nextPageNumber *
                                                    (_model.limit!),
                                            limit: _model.limit,
                                            mainCatId: valueOrDefault<int>(
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId,
                                              2,
                                            ),
                                            catId: valueOrDefault<int>(
                                              FFAppState().filterSmall.catId,
                                              1,
                                            ),
                                            sortby: valueOrDefault<String>(
                                              _model.sortBy,
                                              'created_at.desc.nullslast',
                                            ),
                                            langCode:
                                                FFLocalizations.of(context)
                                                    .languageCode,
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
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),

                                          itemBuilder:
                                              (context, _, filterResultsIndex) {
                                            final filterResultsItem = _model
                                                .listviewMarketPagingController!
                                                .itemList![filterResultsIndex];
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
                                                        filterResultsItem
                                                            .postId,
                                                        ParamType.String,
                                                      ),
                                                      'detailDataName':
                                                          serializeParam(
                                                        filterResultsItem
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
                                                          filterResultsItem
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          filterResultsItem
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
                                                          filterResultsItem
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          filterResultsItem
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
                                                    .itemCardGlobalModels1
                                                    .getModel(
                                                  filterResultsItem.postId,
                                                  filterResultsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardGlobalWidget(
                                                  key: Key(
                                                    'Key2wn_${filterResultsItem.postId}',
                                                  ),
                                                  profileId:
                                                      filterResultsItem.userId,
                                                  postId:
                                                      filterResultsItem.postId,
                                                  detailTable: filterResultsItem
                                                      .detailTable,
                                                  itemData:
                                                      ItemCardGlobalStruct(
                                                    title:
                                                        filterResultsItem.title,
                                                    description:
                                                        filterResultsItem
                                                            .description,
                                                    itemLocation:
                                                        filterResultsItem.city,
                                                    createdAt: functions
                                                        .parseIsoToLocal(
                                                            filterResultsItem
                                                                .createdAt),
                                                    catID:
                                                        filterResultsItem.catId,
                                                    itemLikes: filterResultsItem
                                                        .postLikes,
                                                    mainImagePath: getJsonField(
                                                              filterResultsItem
                                                                  .toMap(),
                                                              r'''$.images[0]''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            filterResultsItem
                                                                .toMap(),
                                                            r'''$.images[0]''',
                                                          ).toString()
                                                        : (filterResultsItem
                                                                    .detailTable ==
                                                                'rentals'
                                                            ? FFAppConstants
                                                                .RentalDefaultImage
                                                            : (filterResultsItem
                                                                        .detailTable ==
                                                                    'events'
                                                                ? FFAppConstants
                                                                    .EventsDefaultImage
                                                                : FFAppConstants
                                                                    .DefaultPostImage)),
                                                    postUserId:
                                                        filterResultsItem
                                                            .userId,
                                                    avatar: filterResultsItem
                                                                    .profileAvatar !=
                                                                null &&
                                                            filterResultsItem
                                                                    .profileAvatar !=
                                                                ''
                                                        ? filterResultsItem
                                                            .profileAvatar
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                    subCatName:
                                                        filterResultsItem
                                                            .subCatLabel,
                                                  ),
                                                  details:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsText),
                                                  username: filterResultsItem
                                                      .userName,
                                                  ratings: 0,
                                                  detailLabels:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsLabelText),
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
                        Stack(
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
                                          12.0, 16.0, 12.0, 24.0),
                                      child: Builder(
                                        builder: (context) {
                                          final categories = FFAppState()
                                              .SubcatApp
                                              .where((e) =>
                                                  e.mainCatId ==
                                                  FFAppState()
                                                      .filterSmall
                                                      .mainCatId)
                                              .toList()
                                              .unique((e) => e.catId)
                                              .toList();

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 8.0,
                                              mainAxisSpacing: 8.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: categories.length,
                                            itemBuilder:
                                                (context, categoriesIndex) {
                                              final categoriesItem =
                                                  categories[categoriesIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e
                                                      ..catId =
                                                          categoriesItem.catId,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSupportPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSupport();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .careBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color: categoriesItem
                                                                  .catId ==
                                                              FFAppState()
                                                                  .filterSmall
                                                                  .catId
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: custom_widgets
                                                              .SvgRenderer(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            svgCode: categoriesItem
                                                                .effectiveIconImage,
                                                            iconColor: Theme.of(
                                                                            context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? functions.hexToColor(
                                                                    categoriesItem
                                                                        .effectiveColorHex,
                                                                    Color(
                                                                        0x00000000))
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .greenInit,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                FFLocalizations.of(
                                                                                context)
                                                                            .languageCode ==
                                                                        'fa'
                                                                    ? categoriesItem
                                                                        .catNameFa
                                                                    : (FFLocalizations.of(context).languageCode ==
                                                                            'nl'
                                                                        ? categoriesItem
                                                                            .catNameNl
                                                                        : categoriesItem
                                                                            .catName),
                                                                'category',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: categoriesItem.catId ==
                                                                            FFAppState()
                                                                                .filterSmall
                                                                                .catId
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .textgray,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    FutureBuilder<List<CommunityShoutoutRow>>(
                                      future:
                                          CommunityShoutoutTable().queryRows(
                                        queryFn: (q) => q,
                                        limit: 5,
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
                                        List<CommunityShoutoutRow>
                                            carouselCommunityShoutoutRowList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: 250.0,
                                          child: CarouselSlider.builder(
                                            itemCount:
                                                carouselCommunityShoutoutRowList
                                                    .length,
                                            itemBuilder:
                                                (context, carouselIndex, _) {
                                              final carouselCommunityShoutoutRow =
                                                  carouselCommunityShoutoutRowList[
                                                      carouselIndex];
                                              return wrapWithModel(
                                                model: _model.shoutOutCardModels
                                                    .getModel(
                                                  carouselCommunityShoutoutRow
                                                      .id
                                                      .toString(),
                                                  carouselIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ShoutOutCardWidget(
                                                  key: Key(
                                                    'Keyjpg_${carouselCommunityShoutoutRow.id.toString()}',
                                                  ),
                                                  shoutOutId:
                                                      carouselCommunityShoutoutRow
                                                          .id,
                                                ),
                                              );
                                            },
                                            carouselController:
                                                _model.carouselController ??=
                                                    CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: max(
                                                  0,
                                                  min(
                                                      1,
                                                      carouselCommunityShoutoutRowList
                                                              .length -
                                                          1)),
                                              viewportFraction: 0.5,
                                              disableCenter: true,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.25,
                                              enableInfiniteScroll: true,
                                              scrollDirection: Axis.horizontal,
                                              autoPlay: false,
                                              onPageChanged: (index, _) =>
                                                  _model.carouselCurrentIndex =
                                                      index,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownSortValueController2 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: List<String>.from([
                                                'created_at.desc.nullslast',
                                                'post_likes.desc.nullslast,created_at.desc'
                                              ]),
                                              optionLabels: [
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'q09sh78q' /* Recent */,
                                                ),
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'c6z26gh2' /* Popular */,
                                                )
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .dropDownSortValue2 = val);
                                                _model.sortBy =
                                                    _model.dropDownSortValue2!;
                                                safeSetState(() {});
                                                safeSetState(() => _model
                                                    .listviewSupportPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForListviewSupport();
                                              },
                                              width: 130.0,
                                              height: 34.0,
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
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'czt2og66' /* Sort by */,
                                              ),
                                              icon: Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 18.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .bordergray,
                                              borderWidth: 0.3,
                                              borderRadius: 24.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: false,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: RefreshIndicator(
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                .listviewSupportPagingController
                                                ?.refresh());
                                          },
                                          child: PagedListView<ApiPagingParams,
                                              dynamic>.separated(
                                            pagingController: _model
                                                .setListviewSupportController(
                                              (nextPageMarker) =>
                                                  FilterApiCall.call(
                                                offset: nextPageMarker
                                                        .nextPageNumber *
                                                    (_model.limit!),
                                                limit: _model.limit,
                                                mainCatId: valueOrDefault<int>(
                                                  FFAppState()
                                                      .filterSmall
                                                      .mainCatId,
                                                  2,
                                                ),
                                                catId: valueOrDefault<int>(
                                                  FFAppState()
                                                      .filterSmall
                                                      .catId,
                                                  1,
                                                ),
                                                sortby: valueOrDefault<String>(
                                                  _model.sortBy,
                                                  'created_at.desc.nullslast',
                                                ),
                                                langCode:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
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
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 12.0),
                                            builderDelegate:
                                                PagedChildBuilderDelegate<
                                                    dynamic>(
                                              // Customize what your widget looks like when it's loading the first page.
                                              firstPageProgressIndicatorBuilder:
                                                  (_) => Center(
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
                                              ),
                                              // Customize what your widget looks like when it's loading another page.
                                              newPageProgressIndicatorBuilder:
                                                  (_) => Center(
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
                                              ),

                                              itemBuilder: (context, _,
                                                  filterResultsIndex) {
                                                final filterResultsItem = _model
                                                    .listviewSupportPagingController!
                                                    .itemList![filterResultsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFLocalizations.of(
                                                                context)
                                                            .languageCode ==
                                                        'fa') {
                                                      context.pushNamed(
                                                        PostFaWidget.routeName,
                                                        queryParameters: {
                                                          'postID':
                                                              serializeParam(
                                                            filterResultsItem
                                                                .postId,
                                                            ParamType.String,
                                                          ),
                                                          'detailDataName':
                                                              serializeParam(
                                                            filterResultsItem
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
                                                          PostNLWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'postID':
                                                                serializeParam(
                                                              filterResultsItem
                                                                  .postId,
                                                              ParamType.String,
                                                            ),
                                                            'detailDataName':
                                                                serializeParam(
                                                              filterResultsItem
                                                                  .detailTable,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          PostEnWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'postID':
                                                                serializeParam(
                                                              filterResultsItem
                                                                  .postId,
                                                              ParamType.String,
                                                            ),
                                                            'detailDataName':
                                                                serializeParam(
                                                              filterResultsItem
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
                                                        .itemCardGlobalModels2
                                                        .getModel(
                                                      filterResultsItem.postId,
                                                      filterResultsIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ItemCardGlobalWidget(
                                                      key: Key(
                                                        'Key9i0_${filterResultsItem.postId}',
                                                      ),
                                                      profileId:
                                                          filterResultsItem
                                                              .userId,
                                                      postId: filterResultsItem
                                                          .postId,
                                                      detailTable:
                                                          filterResultsItem
                                                              .detailTable,
                                                      itemData:
                                                          ItemCardGlobalStruct(
                                                        title: filterResultsItem
                                                            .title,
                                                        description:
                                                            filterResultsItem
                                                                .description,
                                                        itemLocation:
                                                            filterResultsItem
                                                                .city,
                                                        createdAt: functions
                                                            .parseIsoToLocal(
                                                                filterResultsItem
                                                                    .createdAt),
                                                        catID: filterResultsItem
                                                            .catId,
                                                        itemLikes:
                                                            filterResultsItem
                                                                .postLikes,
                                                        mainImagePath: getJsonField(
                                                                  filterResultsItem
                                                                      .toMap(),
                                                                  r'''$.images[0]''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                filterResultsItem
                                                                    .toMap(),
                                                                r'''$.images[0]''',
                                                              ).toString()
                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                        postUserId:
                                                            filterResultsItem
                                                                .userId,
                                                        avatar: filterResultsItem
                                                                        .profileAvatar !=
                                                                    null &&
                                                                filterResultsItem
                                                                        .profileAvatar !=
                                                                    ''
                                                            ? filterResultsItem
                                                                .profileAvatar
                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                        subCatName:
                                                            filterResultsItem
                                                                .subCatLabel,
                                                      ),
                                                      details: functions
                                                          .decodeDetails(
                                                              filterResultsItem
                                                                  .detailsText),
                                                      username:
                                                          filterResultsItem
                                                              .userName,
                                                      detailLabels: functions
                                                          .decodeDetails(
                                                              filterResultsItem
                                                                  .detailsLabelText),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 80.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 76.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).greenInit,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).greenInit,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'lfm1ojnf' /* Become a Volunteer */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 16.0, 12.0, 24.0),
                                      child: Builder(
                                        builder: (context) {
                                          final categories = FFAppState()
                                              .SubcatApp
                                              .where((e) =>
                                                  e.mainCatId ==
                                                  FFAppState()
                                                      .filterSmall
                                                      .mainCatId)
                                              .toList()
                                              .unique((e) => e.catId)
                                              .toList();

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 8.0,
                                              mainAxisSpacing: 8.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: categories.length,
                                            itemBuilder:
                                                (context, categoriesIndex) {
                                              final categoriesItem =
                                                  categories[categoriesIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                      .updateFilterSmallStruct(
                                                    (e) => e
                                                      ..catId =
                                                          categoriesItem.catId,
                                                  );
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .serviceBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color: categoriesItem
                                                                  .catId ==
                                                              FFAppState()
                                                                  .filterSmall
                                                                  .catId
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      width: 0.3,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  2.0),
                                                          child: custom_widgets
                                                              .SvgRenderer(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            svgCode: categoriesItem
                                                                .effectiveIconImage,
                                                            iconColor: Theme.of(
                                                                            context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? functions.hexToColor(
                                                                    categoriesItem
                                                                        .effectiveColorHex,
                                                                    Color(
                                                                        0x00000000))
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .yellow1,
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        2.0),
                                                            child: AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                FFLocalizations.of(
                                                                                context)
                                                                            .languageCode ==
                                                                        'fa'
                                                                    ? categoriesItem
                                                                        .catNameFa
                                                                    : (FFLocalizations.of(context).languageCode ==
                                                                            'nl'
                                                                        ? categoriesItem
                                                                            .catNameNl
                                                                        : categoriesItem
                                                                            .catName),
                                                                'category',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: categoriesItem.catId ==
                                                                            FFAppState()
                                                                                .filterSmall
                                                                                .catId
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .bordergray,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, 1.0),
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownSortValueController3 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: List<String>.from([
                                                  'created_at.desc.nullslast',
                                                  'post_likes.desc.nullslast,created_at.desc'
                                                ]),
                                                optionLabels: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mf3wf9bs' /* Recent */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0vfuan47' /* Popular */,
                                                  )
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() => _model
                                                          .dropDownSortValue3 =
                                                      val);
                                                  _model.sortBy = _model
                                                      .dropDownSortValue3!;
                                                  safeSetState(() {});
                                                  safeSetState(() => _model
                                                      .listviewSkillsPagingController
                                                      ?.refresh());
                                                  await _model
                                                      .waitForOnePageForListviewSkills();
                                                },
                                                width: 130.0,
                                                height: 34.0,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumIsCustom,
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'hpek7i7b' /* Sort by */,
                                                ),
                                                icon: Icon(
                                                  Icons.arrow_drop_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 18.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .bordergray,
                                                borderWidth: 0.3,
                                                borderRadius: 24.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                hidesUnderline: true,
                                                isOverButton: false,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: RefreshIndicator(
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                .listviewSkillsPagingController
                                                ?.refresh());
                                          },
                                          child: PagedListView<ApiPagingParams,
                                              dynamic>.separated(
                                            pagingController: _model
                                                .setListviewSkillsController(
                                              (nextPageMarker) =>
                                                  FilterApiCall.call(
                                                offset: nextPageMarker
                                                        .nextPageNumber *
                                                    (_model.limit!),
                                                limit: _model.limit,
                                                mainCatId: valueOrDefault<int>(
                                                  FFAppState()
                                                      .filterSmall
                                                      .mainCatId,
                                                  2,
                                                ),
                                                catId: valueOrDefault<int>(
                                                  FFAppState()
                                                      .filterSmall
                                                      .catId,
                                                  1,
                                                ),
                                                sortby: valueOrDefault<String>(
                                                  _model.sortBy,
                                                  'created_at.desc.nullslast',
                                                ),
                                                langCode:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
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
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 12.0),
                                            builderDelegate:
                                                PagedChildBuilderDelegate<
                                                    dynamic>(
                                              // Customize what your widget looks like when it's loading the first page.
                                              firstPageProgressIndicatorBuilder:
                                                  (_) => Center(
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
                                              ),
                                              // Customize what your widget looks like when it's loading another page.
                                              newPageProgressIndicatorBuilder:
                                                  (_) => Center(
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
                                              ),

                                              itemBuilder: (context, _,
                                                  filterResultsIndex) {
                                                final filterResultsItem = _model
                                                    .listviewSkillsPagingController!
                                                    .itemList![filterResultsIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFLocalizations.of(
                                                                context)
                                                            .languageCode ==
                                                        'fa') {
                                                      context.pushNamed(
                                                        PostFaWidget.routeName,
                                                        queryParameters: {
                                                          'postID':
                                                              serializeParam(
                                                            filterResultsItem
                                                                .postId,
                                                            ParamType.String,
                                                          ),
                                                          'detailDataName':
                                                              serializeParam(
                                                            filterResultsItem
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
                                                          PostNLWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'postID':
                                                                serializeParam(
                                                              filterResultsItem
                                                                  .detailTable,
                                                              ParamType.String,
                                                            ),
                                                            'detailDataName':
                                                                serializeParam(
                                                              filterResultsItem
                                                                  .detailTable,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      } else {
                                                        context.pushNamed(
                                                          PostEnWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'postID':
                                                                serializeParam(
                                                              filterResultsItem
                                                                  .postId,
                                                              ParamType.String,
                                                            ),
                                                            'detailDataName':
                                                                serializeParam(
                                                              filterResultsItem
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
                                                        .itemCardGlobalModels3
                                                        .getModel(
                                                      filterResultsItem.postId,
                                                      filterResultsIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child: ItemCardGlobalWidget(
                                                      key: Key(
                                                        'Keyq89_${filterResultsItem.postId}',
                                                      ),
                                                      profileId:
                                                          filterResultsItem
                                                              .userId,
                                                      postId: filterResultsItem
                                                          .postId,
                                                      detailTable:
                                                          filterResultsItem
                                                              .detailTable,
                                                      itemData:
                                                          ItemCardGlobalStruct(
                                                        title: filterResultsItem
                                                            .title,
                                                        description:
                                                            filterResultsItem
                                                                .description,
                                                        itemLocation:
                                                            filterResultsItem
                                                                .city,
                                                        createdAt: functions
                                                            .parseIsoToLocal(
                                                                filterResultsItem
                                                                    .createdAt),
                                                        catID: filterResultsItem
                                                            .catId,
                                                        itemLikes:
                                                            filterResultsItem
                                                                .postLikes,
                                                        mainImagePath: getJsonField(
                                                                  filterResultsItem
                                                                      .toMap(),
                                                                  r'''$.images[0]''',
                                                                ) !=
                                                                null
                                                            ? getJsonField(
                                                                filterResultsItem
                                                                    .toMap(),
                                                                r'''$.images[0]''',
                                                              ).toString()
                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                                                        postUserId:
                                                            filterResultsItem
                                                                .userId,
                                                        avatar: filterResultsItem
                                                                        .profileAvatar !=
                                                                    null &&
                                                                filterResultsItem
                                                                        .profileAvatar !=
                                                                    ''
                                                            ? filterResultsItem
                                                                .profileAvatar
                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                        subCatName:
                                                            filterResultsItem
                                                                .subCatLabel,
                                                      ),
                                                      details: functions
                                                          .decodeDetails(
                                                              filterResultsItem
                                                                  .detailsText),
                                                      username:
                                                          filterResultsItem
                                                              .userName,
                                                      ratings: filterResultsItem
                                                          .ratings,
                                                      review: filterResultsItem
                                                          .review,
                                                      detailLabels: functions
                                                          .decodeDetails(
                                                              filterResultsItem
                                                                  .detailsLabelText),
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
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 76.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).greenInit,
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .greenInit,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'm0ad92yp' /* Advertise a Job */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 12.0, 24.0),
                                  child: Builder(
                                    builder: (context) {
                                      final categories = FFAppState()
                                          .SubcatApp
                                          .where((e) =>
                                              e.mainCatId ==
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId)
                                          .toList()
                                          .unique((e) => e.catId)
                                          .toList();

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 8.0,
                                          mainAxisSpacing: 8.0,
                                          childAspectRatio: 1.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: categories.length,
                                        itemBuilder:
                                            (context, categoriesIndex) {
                                          final categoriesItem =
                                              categories[categoriesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState()
                                                  .updateFilterSmallStruct(
                                                (e) => e
                                                  ..catId =
                                                      categoriesItem.catId,
                                              );
                                              safeSetState(() {});
                                              safeSetState(() => _model
                                                  .listviewEventsPagingController
                                                  ?.refresh());
                                              await _model
                                                  .waitForOnePageForListviewEvents();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .eventBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: categoriesItem.catId ==
                                                          FFAppState()
                                                              .filterSmall
                                                              .catId
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  width: 0.3,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: custom_widgets
                                                          .SvgRenderer(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        svgCode: categoriesItem
                                                            .effectiveIconImage,
                                                        iconColor: Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? functions.hexToColor(
                                                                categoriesItem
                                                                    .effectiveColorHex,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .eventTxt)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .eventTxt,
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            FFLocalizations.of(
                                                                            context)
                                                                        .languageCode ==
                                                                    'fa'
                                                                ? categoriesItem
                                                                    .catNameFa
                                                                : (FFLocalizations.of(context)
                                                                            .languageCode ==
                                                                        'nl'
                                                                    ? categoriesItem
                                                                        .catNameNl
                                                                    : categoriesItem
                                                                        .catName),
                                                            'category',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: categoriesItem
                                                                            .catId ==
                                                                        FFAppState()
                                                                            .filterSmall
                                                                            .catId
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .bordergray,
                                                                fontSize: 13.0,
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownSortValueController4 ??=
                                              FormFieldController<String>(null),
                                          options: List<String>.from([
                                            'created_at.desc.nullslast',
                                            'post_likes.desc.nullslast,created_at.desc'
                                          ]),
                                          optionLabels: [
                                            FFLocalizations.of(context).getText(
                                              'dc06nkgi' /* Recent */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'i3smswcl' /* Popular */,
                                            )
                                          ],
                                          onChanged: (val) async {
                                            safeSetState(() => _model
                                                .dropDownSortValue4 = val);
                                            _model.sortBy =
                                                _model.dropDownSortValue4!;
                                            safeSetState(() {});
                                            safeSetState(() => _model
                                                .listviewEventsPagingController
                                                ?.refresh());
                                            await _model
                                                .waitForOnePageForListviewEvents();
                                          },
                                          width: 130.0,
                                          height: 34.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'borgvgtn' /* Sort by */,
                                          ),
                                          icon: Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .bordergray,
                                          borderWidth: 0.3,
                                          borderRadius: 24.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        safeSetState(() => _model
                                            .listviewEventsPagingController
                                            ?.refresh());
                                      },
                                      child: PagedListView<ApiPagingParams,
                                          dynamic>.separated(
                                        pagingController:
                                            _model.setListviewEventsController(
                                          (nextPageMarker) =>
                                              FilterApiCall.call(
                                            offset:
                                                nextPageMarker.nextPageNumber *
                                                    (_model.limit!),
                                            limit: _model.limit,
                                            mainCatId: valueOrDefault<int>(
                                              FFAppState()
                                                  .filterSmall
                                                  .mainCatId,
                                              2,
                                            ),
                                            catId: valueOrDefault<int>(
                                              FFAppState().filterSmall.catId,
                                              1,
                                            ),
                                            sortby: valueOrDefault<String>(
                                              _model.sortBy,
                                              'created_at.desc.nullslast',
                                            ),
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
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<dynamic>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
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
                                          ),

                                          itemBuilder:
                                              (context, _, filterResultsIndex) {
                                            final filterResultsItem = _model
                                                .listviewEventsPagingController!
                                                .itemList![filterResultsIndex];
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
                                                        filterResultsItem
                                                            .postId,
                                                        ParamType.String,
                                                      ),
                                                      'detailDataName':
                                                          serializeParam(
                                                        filterResultsItem
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
                                                          filterResultsItem
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          filterResultsItem
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
                                                          filterResultsItem
                                                              .postId,
                                                          ParamType.String,
                                                        ),
                                                        'detailDataName':
                                                            serializeParam(
                                                          filterResultsItem
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
                                                    .itemCardGlobalModels4
                                                    .getModel(
                                                  filterResultsItem.postId,
                                                  filterResultsIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ItemCardGlobalWidget(
                                                  key: Key(
                                                    'Keynj2_${filterResultsItem.postId}',
                                                  ),
                                                  profileId:
                                                      filterResultsItem.userId,
                                                  postId:
                                                      filterResultsItem.postId,
                                                  detailTable: filterResultsItem
                                                      .detailTable,
                                                  itemData:
                                                      ItemCardGlobalStruct(
                                                    title:
                                                        filterResultsItem.title,
                                                    description:
                                                        filterResultsItem
                                                            .description,
                                                    itemLocation:
                                                        filterResultsItem.city,
                                                    createdAt: functions
                                                        .parseIsoToLocal(
                                                            filterResultsItem
                                                                .createdAt),
                                                    catID:
                                                        filterResultsItem.catId,
                                                    itemLikes: filterResultsItem
                                                        .postLikes,
                                                    mainImagePath: getJsonField(
                                                              filterResultsItem
                                                                  .toMap(),
                                                              r'''$.images[0]''',
                                                            ) !=
                                                            null
                                                        ? getJsonField(
                                                            filterResultsItem
                                                                .toMap(),
                                                            r'''$.images[0]''',
                                                          ).toString()
                                                        : null,
                                                    postUserId:
                                                        filterResultsItem
                                                            .userId,
                                                    avatar: filterResultsItem
                                                                    .profileAvatar !=
                                                                null &&
                                                            filterResultsItem
                                                                    .profileAvatar !=
                                                                ''
                                                        ? filterResultsItem
                                                            .profileAvatar
                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/n2imhdlvogb3/profile_avatar_circular.png',
                                                    subCatName:
                                                        filterResultsItem
                                                            .subCatLabel,
                                                  ),
                                                  details:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsText),
                                                  username: filterResultsItem
                                                      .userName,
                                                  detailLabels:
                                                      functions.decodeDetails(
                                                          filterResultsItem
                                                              .detailsLabelText),
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
                      ],
                    ),
                  ),
                ],
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
  }
}
