import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? HomePageWidget()
          : SplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? HomePageWidget()
              : SplashWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyPageWidget.routeName,
          path: PrivacyPolicyPageWidget.routePath,
          builder: (context, params) => PrivacyPolicyPageWidget(),
        ),
        FFRoute(
          name: FaqWidget.routeName,
          path: FaqWidget.routePath,
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: EventsWidget.routeName,
          path: EventsWidget.routePath,
          builder: (context, params) => EventsWidget(),
        ),
        FFRoute(
          name: ReportedPostWidget.routeName,
          path: ReportedPostWidget.routePath,
          builder: (context, params) => ReportedPostWidget(),
        ),
        FFRoute(
          name: OnboardingPageWidget.routeName,
          path: OnboardingPageWidget.routePath,
          builder: (context, params) => OnboardingPageWidget(),
        ),
        FFRoute(
          name: ImageGalleryPageWidget.routeName,
          path: ImageGalleryPageWidget.routePath,
          builder: (context, params) => ImageGalleryPageWidget(
            marketId: params.getParam(
              'marketId',
              ParamType.String,
            ),
            previewImages: params.getParam<String>(
              'previewImages',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: EventItmePageWidget.routeName,
          path: EventItmePageWidget.routePath,
          builder: (context, params) => EventItmePageWidget(),
        ),
        FFRoute(
          name: IranNLItemPageWidget.routeName,
          path: IranNLItemPageWidget.routePath,
          builder: (context, params) => IranNLItemPageWidget(),
        ),
        FFRoute(
          name: CreateItemSubCatWidget.routeName,
          path: CreateItemSubCatWidget.routePath,
          builder: (context, params) => CreateItemSubCatWidget(),
        ),
        FFRoute(
          name: CreateWishlistWidget.routeName,
          path: CreateWishlistWidget.routePath,
          builder: (context, params) => CreateWishlistWidget(),
        ),
        FFRoute(
          name: SignInConfirmWidget.routeName,
          path: SignInConfirmWidget.routePath,
          builder: (context, params) => SignInConfirmWidget(),
        ),
        FFRoute(
          name: PreviewPostWidget.routeName,
          path: PreviewPostWidget.routePath,
          builder: (context, params) => PreviewPostWidget(),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: CreateItemCatWidget.routeName,
          path: CreateItemCatWidget.routePath,
          builder: (context, params) => CreateItemCatWidget(),
        ),
        FFRoute(
          name: CreateItemImagesWidget.routeName,
          path: CreateItemImagesWidget.routePath,
          builder: (context, params) => CreateItemImagesWidget(),
        ),
        FFRoute(
          name: ChangePasswordPageWidget.routeName,
          path: ChangePasswordPageWidget.routePath,
          builder: (context, params) => ChangePasswordPageWidget(),
        ),
        FFRoute(
          name: EditPostWidget.routeName,
          path: EditPostWidget.routePath,
          builder: (context, params) => EditPostWidget(
            postId: params.getParam(
              'postId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: OverviewMarketWidget.routeName,
          path: OverviewMarketWidget.routePath,
          builder: (context, params) => OverviewMarketWidget(),
        ),
        FFRoute(
          name: OverviewCareWidget.routeName,
          path: OverviewCareWidget.routePath,
          builder: (context, params) => OverviewCareWidget(),
        ),
        FFRoute(
          name: ResetPasswordPageWidget.routeName,
          path: ResetPasswordPageWidget.routePath,
          builder: (context, params) => ResetPasswordPageWidget(),
        ),
        FFRoute(
          name: TermsConditionsPageWidget.routeName,
          path: TermsConditionsPageWidget.routePath,
          builder: (context, params) => TermsConditionsPageWidget(),
        ),
        FFRoute(
          name: CreateItemDetailWidget.routeName,
          path: CreateItemDetailWidget.routePath,
          builder: (context, params) => CreateItemDetailWidget(),
        ),
        FFRoute(
          name: ReportedUserWidget.routeName,
          path: ReportedUserWidget.routePath,
          builder: (context, params) => ReportedUserWidget(),
        ),
        FFRoute(
          name: SignInPageWidget.routeName,
          path: SignInPageWidget.routePath,
          builder: (context, params) => SignInPageWidget(),
        ),
        FFRoute(
          name: ScoringSystemWidget.routeName,
          path: ScoringSystemWidget.routePath,
          builder: (context, params) => ScoringSystemWidget(),
        ),
        FFRoute(
          name: ContactYEKJAWidget.routeName,
          path: ContactYEKJAWidget.routePath,
          builder: (context, params) => ContactYEKJAWidget(),
        ),
        FFRoute(
          name: CreateItemMainCatWidget.routeName,
          path: CreateItemMainCatWidget.routePath,
          builder: (context, params) => CreateItemMainCatWidget(),
        ),
        FFRoute(
          name: SwipableWidget.routeName,
          path: SwipableWidget.routePath,
          builder: (context, params) => SwipableWidget(),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(
            searchTermParam: params.getParam(
              'searchTermParam',
              ParamType.String,
            ),
            navigateBackTo: params.getParam(
              'navigateBackTo',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfilePageWidget(
            profileId: params.getParam(
              'profileId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SignUpPageWidget.routeName,
          path: SignUpPageWidget.routePath,
          builder: (context, params) => SignUpPageWidget(),
        ),
        FFRoute(
          name: ProductDetailWidget.routeName,
          path: ProductDetailWidget.routePath,
          builder: (context, params) => ProductDetailWidget(
            postID: params.getParam(
              'postID',
              ParamType.String,
            ),
            mainCatID: params.getParam(
              'mainCatID',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ChatdetailWidget.routeName,
          path: ChatdetailWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatdetailWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.int,
            ),
            ownerID: params.getParam(
              'ownerID',
              ParamType.String,
            ),
            postID: params.getParam(
              'postID',
              ParamType.String,
            ),
            ownerUserName: params.getParam(
              'ownerUserName',
              ParamType.String,
            ),
            ownerAvatar: params.getParam(
              'ownerAvatar',
              ParamType.String,
            ),
            senderID: params.getParam(
              'senderID',
              ParamType.String,
            ),
            senderUserName: params.getParam(
              'senderUserName',
              ParamType.String,
            ),
            senderAvatar: params.getParam(
              'senderAvatar',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: ChatdetailCopyWidget.routeName,
          path: ChatdetailCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatdetailCopyWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.int,
            ),
            ownerID: params.getParam(
              'ownerID',
              ParamType.String,
            ),
            postID: params.getParam(
              'postID',
              ParamType.String,
            ),
            ownerUserName: params.getParam(
              'ownerUserName',
              ParamType.String,
            ),
            ownerAvatar: params.getParam(
              'ownerAvatar',
              ParamType.String,
            ),
            senderID: params.getParam(
              'senderID',
              ParamType.String,
            ),
            senderUserName: params.getParam(
              'senderUserName',
              ParamType.String,
            ),
            senderAvatar: params.getParam(
              'senderAvatar',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChatdetailWithYekjaWidget.routeName,
          path: ChatdetailWithYekjaWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatdetailWithYekjaWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.int,
            ),
            postID: params.getParam(
              'postID',
              ParamType.String,
            ),
            ownerUserName: params.getParam(
              'ownerUserName',
              ParamType.String,
            ),
            ownerID: params.getParam(
              'ownerID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProfilePageCopyWidget.routeName,
          path: ProfilePageCopyWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfilePageCopyWidget(
            profileId: params.getParam(
              'profileId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ForgotPasswordPageWidget.routeName,
          path: ForgotPasswordPageWidget.routePath,
          builder: (context, params) => ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: ProfileExtendedWidget.routeName,
          path: ProfileExtendedWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfileExtendedWidget(
            profileId: params.getParam(
              'profileId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChatPageWidget.routeName,
          path: ChatPageWidget.routePath,
          builder: (context, params) => ChatPageWidget(
            profileid: params.getParam(
              'profileid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditProfilePageWidget.routeName,
          path: EditProfilePageWidget.routePath,
          builder: (context, params) => EditProfilePageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitChasingDots(
                      color: FlutterFlowTheme.of(context).greenInit,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
