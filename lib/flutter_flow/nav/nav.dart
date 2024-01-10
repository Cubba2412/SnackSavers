import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

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

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? const ListViewWidget() : const IntroViewWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const ListViewWidget() : const IntroViewWidget(),
          routes: [
            FFRoute(
              name: 'ListView',
              path: 'listView',
              builder: (context, params) => const ListViewWidget(),
            ),
            FFRoute(
              name: 'MapView',
              path: 'mapView',
              builder: (context, params) => const MapViewWidget(),
            ),
            FFRoute(
              name: 'AccountView',
              path: 'accountView',
              builder: (context, params) => const AccountViewWidget(),
            ),
            FFRoute(
              name: 'AccountSettingsView',
              path: 'accountSettingsView',
              builder: (context, params) => const AccountSettingsViewWidget(),
            ),
            FFRoute(
              name: 'FavouriteView',
              path: 'favouriteView',
              builder: (context, params) => const FavouriteViewWidget(),
            ),
            FFRoute(
              name: 'ListingView',
              path: 'listingView',
              builder: (context, params) => ListingViewWidget(
                title: params.getParam('title', ParamType.String),
                location: params.getParam('location', ParamType.LatLng),
                price: params.getParam('price', ParamType.double),
                quantity: params.getParam('quantity', ParamType.int),
                collectionTimeStart:
                    params.getParam('collectionTimeStart', ParamType.DateTime),
                collectionTimeEnd:
                    params.getParam('collectionTimeEnd', ParamType.DateTime),
                description: params.getParam('description', ParamType.String),
                businessName: params.getParam('businessName', ParamType.String),
                imagePath: params.getParam('imagePath', ParamType.String),
                listingUid: params.getParam('listingUid', ParamType.String),
                streetAddress:
                    params.getParam('streetAddress', ParamType.String),
                isOrder: params.getParam('isOrder', ParamType.bool),
                orderNumber: params.getParam('orderNumber', ParamType.String),
                purchaseTime:
                    params.getParam('purchaseTime', ParamType.DateTime),
                businessId: params.getParam('businessId', ParamType.String),
                listingRef: params.getParam('listingRef',
                    ParamType.DocumentReference, false, ['listings']),
                userName: params.getParam('userName', ParamType.String),
                originalValue:
                    params.getParam('originalValue', ParamType.double),
                category: params.getParam('category', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AppSettings',
              path: 'appSettings',
              builder: (context, params) => const AppSettingsWidget(),
            ),
            FFRoute(
              name: 'EditProfileView',
              path: 'editProfileView',
              builder: (context, params) => const EditProfileViewWidget(),
            ),
            FFRoute(
              name: 'AuthenticationView',
              path: 'authenticationView',
              builder: (context, params) => const AuthenticationViewWidget(),
            ),
            FFRoute(
              name: 'ForgotPasswordView',
              path: 'forgotPasswordView',
              builder: (context, params) => const ForgotPasswordViewWidget(),
            ),
            FFRoute(
              name: 'IntroView',
              path: 'introView',
              builder: (context, params) => const IntroViewWidget(),
            ),
            FFRoute(
              name: 'BusinessAuthenticationView',
              path: 'businessAuthenticationView',
              builder: (context, params) => const BusinessAuthenticationViewWidget(),
            ),
            FFRoute(
              name: 'CreateListingView',
              path: 'createListingView',
              builder: (context, params) => CreateListingViewWidget(
                title: params.getParam('title', ParamType.String),
                description: params.getParam('description', ParamType.String),
                quantity: params.getParam('quantity', ParamType.int),
                price: params.getParam('price', ParamType.double),
                category: params.getParam('category', ParamType.String),
                photoUrl: params.getParam('photoUrl', ParamType.String),
                collectionTimeStart:
                    params.getParam('collectionTimeStart', ParamType.DateTime),
                collectionTimeEnd:
                    params.getParam('collectionTimeEnd', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'SuccessScreen',
              path: 'successScreen',
              builder: (context, params) => SuccessScreenWidget(
                successTitle: params.getParam('successTitle', ParamType.String),
                sucessSubtitle:
                    params.getParam('sucessSubtitle', ParamType.String),
                isPurchase: params.getParam('isPurchase', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'PrivacyPolicyView',
              path: 'privacyPolicyView',
              builder: (context, params) => const PrivacyPolicyViewWidget(),
            ),
            FFRoute(
              name: 'ErrorScreen',
              path: 'errorScreen',
              builder: (context, params) => ErrorScreenWidget(
                errorTitle: params.getParam('errorTitle', ParamType.String),
                errorSubtitle:
                    params.getParam('errorSubtitle', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OrdersView',
              path: 'ordersView',
              builder: (context, params) => const OrdersViewWidget(),
            ),
            FFRoute(
              name: 'BusinessOrdersView',
              path: 'businessOrdersView',
              builder: (context, params) => const BusinessOrdersViewWidget(),
            ),
            FFRoute(
              name: 'StripeRefreshPage',
              path: 'stripeRefreshPage',
              builder: (context, params) => const StripeRefreshPageWidget(),
            ),
            FFRoute(
              name: 'CreateStripeAccountPage',
              path: 'createStripeAccountPage',
              builder: (context, params) => const CreateStripeAccountPageWidget(),
            ),
            FFRoute(
              name: 'StripeInfoPage',
              path: 'stripeInfoPage',
              builder: (context, params) => const StripeInfoPageWidget(),
            ),
            FFRoute(
              name: 'AfterPurchaseInstructionView',
              path: 'afterPurchaseInstructionView',
              builder: (context, params) =>
                  const AfterPurchaseInstructionViewWidget(),
            ),
            FFRoute(
              name: 'CreateAListingInstructionView',
              path: 'createAListingInstructionView',
              builder: (context, params) =>
                  const CreateAListingInstructionViewWidget(),
            ),
            FFRoute(
              name: 'UpdateListingView',
              path: 'updateListingView',
              builder: (context, params) => UpdateListingViewWidget(
                title: params.getParam('title', ParamType.String),
                description: params.getParam('description', ParamType.String),
                quantity: params.getParam('quantity', ParamType.int),
                price: params.getParam('price', ParamType.double),
                category: params.getParam('category', ParamType.String),
                photoUrl: params.getParam('photoUrl', ParamType.String),
                collectionTimeStart:
                    params.getParam('collectionTimeStart', ParamType.DateTime),
                collectionTimeEnd:
                    params.getParam('collectionTimeEnd', ParamType.DateTime),
                listingReference: params.getParam('listingReference',
                    ParamType.DocumentReference, false, ['listings']),
                originalValue:
                    params.getParam('originalValue', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'ReCreateListingView',
              path: 'reCreateListingView',
              builder: (context, params) => ReCreateListingViewWidget(
                title: params.getParam('title', ParamType.String),
                description: params.getParam('description', ParamType.String),
                quantity: params.getParam('quantity', ParamType.int),
                price: params.getParam('price', ParamType.double),
                category: params.getParam('category', ParamType.String),
                photoUrl: params.getParam('photoUrl', ParamType.String),
                collectionTimeStart:
                    params.getParam('collectionTimeStart', ParamType.DateTime),
                collectionTimeEnd:
                    params.getParam('collectionTimeEnd', ParamType.DateTime),
                originalValue:
                    params.getParam('originalValue', ParamType.double),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/introView';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).white,
                  child: Image.asset(
                    'assets/images/Logo_Text_on_top.png',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link') &&
        widget.state.location.contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}