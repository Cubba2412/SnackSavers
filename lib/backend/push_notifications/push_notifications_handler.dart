import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).white,
          child: Image.asset(
            'assets/images/Logo_Text_on_top.png',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'ListView': ParameterData.none(),
  'MapView': ParameterData.none(),
  'AccountView': ParameterData.none(),
  'AccountSettingsView': ParameterData.none(),
  'FavouriteView': ParameterData.none(),
  'ListingView': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'location': getParameter<LatLng>(data, 'location'),
          'price': getParameter<double>(data, 'price'),
          'quantity': getParameter<int>(data, 'quantity'),
          'collectionTimeStart':
              getParameter<DateTime>(data, 'collectionTimeStart'),
          'collectionTimeEnd':
              getParameter<DateTime>(data, 'collectionTimeEnd'),
          'description': getParameter<String>(data, 'description'),
          'businessName': getParameter<String>(data, 'businessName'),
          'imagePath': getParameter<String>(data, 'imagePath'),
          'listingUid': getParameter<String>(data, 'listingUid'),
          'streetAddress': getParameter<String>(data, 'streetAddress'),
          'isOrder': getParameter<bool>(data, 'isOrder'),
          'orderNumber': getParameter<String>(data, 'orderNumber'),
          'purchaseTime': getParameter<DateTime>(data, 'purchaseTime'),
          'businessId': getParameter<String>(data, 'businessId'),
          'listingRef': getParameter<DocumentReference>(data, 'listingRef'),
          'userName': getParameter<String>(data, 'userName'),
          'originalValue': getParameter<double>(data, 'originalValue'),
          'category': getParameter<String>(data, 'category'),
        },
      ),
  'AppSettings': ParameterData.none(),
  'EditProfileView': ParameterData.none(),
  'AuthenticationView': ParameterData.none(),
  'ForgotPasswordView': ParameterData.none(),
  'IntroView': ParameterData.none(),
  'BusinessAuthenticationView': ParameterData.none(),
  'CreateListingView': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'description': getParameter<String>(data, 'description'),
          'quantity': getParameter<int>(data, 'quantity'),
          'price': getParameter<double>(data, 'price'),
          'category': getParameter<String>(data, 'category'),
          'photoUrl': getParameter<String>(data, 'photoUrl'),
          'collectionTimeStart':
              getParameter<DateTime>(data, 'collectionTimeStart'),
          'collectionTimeEnd':
              getParameter<DateTime>(data, 'collectionTimeEnd'),
        },
      ),
  'SuccessScreen': (data) async => ParameterData(
        allParams: {
          'successTitle': getParameter<String>(data, 'successTitle'),
          'sucessSubtitle': getParameter<String>(data, 'sucessSubtitle'),
          'isPurchase': getParameter<bool>(data, 'isPurchase'),
        },
      ),
  'PrivacyPolicyView': ParameterData.none(),
  'ErrorScreen': (data) async => ParameterData(
        allParams: {
          'errorTitle': getParameter<String>(data, 'errorTitle'),
          'errorSubtitle': getParameter<String>(data, 'errorSubtitle'),
        },
      ),
  'OrdersView': ParameterData.none(),
  'BusinessOrdersView': ParameterData.none(),
  'StripeRefreshPage': ParameterData.none(),
  'CreateStripeAccountPage': ParameterData.none(),
  'StripeInfoPage': ParameterData.none(),
  'AfterPurchaseInstructionView': ParameterData.none(),
  'CreateAListingInstructionView': ParameterData.none(),
  'UpdateListingView': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'description': getParameter<String>(data, 'description'),
          'quantity': getParameter<int>(data, 'quantity'),
          'price': getParameter<double>(data, 'price'),
          'category': getParameter<String>(data, 'category'),
          'photoUrl': getParameter<String>(data, 'photoUrl'),
          'collectionTimeStart':
              getParameter<DateTime>(data, 'collectionTimeStart'),
          'collectionTimeEnd':
              getParameter<DateTime>(data, 'collectionTimeEnd'),
          'listingReference':
              getParameter<DocumentReference>(data, 'listingReference'),
          'originalValue': getParameter<double>(data, 'originalValue'),
        },
      ),
  'ReCreateListingView': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'description': getParameter<String>(data, 'description'),
          'quantity': getParameter<int>(data, 'quantity'),
          'price': getParameter<double>(data, 'price'),
          'category': getParameter<String>(data, 'category'),
          'photoUrl': getParameter<String>(data, 'photoUrl'),
          'collectionTimeStart':
              getParameter<DateTime>(data, 'collectionTimeStart'),
          'collectionTimeEnd':
              getParameter<DateTime>(data, 'collectionTimeEnd'),
          'originalValue': getParameter<double>(data, 'originalValue'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
