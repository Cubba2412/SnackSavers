import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateAccountLinkStripeTestCall {
  static Future<ApiCallResponse> call({
    String? account = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Account Link Stripe Test',
      apiUrl: 'https://api.stripe.com/v1/account_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfdGVzdF81MUxvbkxHQk95TlZLYjB2Z1kwM09OZmZzb1N1SHlLRnl1RE53OWxMdldMd2ZUWDZtNnJoZ0pIbFpRU0VEOEd5Mm0xdnN6SHpMRHlkbDdKNnNReG1HUmUyWjAwOFU0RmdUMzg6',
      },
      params: {
        'account': account,
        'refresh_url': "https://snacksavers.page.link/stripeRefreshPage",
        'return_url': "https://snacksavers.page.link",
        'type': "account_onboarding",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accountLinkUrl(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class CreateAccountLinkStripeProductionCall {
  static Future<ApiCallResponse> call({
    String? account = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Account Link Stripe Production',
      apiUrl: 'https://api.stripe.com/v1/account_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV81MUxvbkxHQk95TlZLYjB2Z0xjVVBKMFpnTHI4WjNUQ0t4ZjFWMUJETjZuelcxYWZKU09ERHNPY25UNjJDSjVaTElmeWNRSXdISkpMUmFWTndlTzJnN1F4STAwaGtCRUFEU3E6',
      },
      params: {
        'account': account,
        'refresh_url': "https://snacksavers.page.link/stripeRefreshPage",
        'return_url': "https://snacksavers.page.link",
        'type': "account_onboarding",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accountLinkUrl(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class CreateExpressAccountStripeTestCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Express Account Stripe Test',
      apiUrl: 'https://api.stripe.com/v1/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfdGVzdF81MUxvbkxHQk95TlZLYjB2Z1kwM09OZmZzb1N1SHlLRnl1RE53OWxMdldMd2ZUWDZtNnJoZ0pIbFpRU0VEOEd5Mm0xdnN6SHpMRHlkbDdKNnNReG1HUmUyWjAwOFU0RmdUMzg6',
      },
      params: {
        'type': "express",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accountId(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class CreateExpressAccountStripeProductionCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Express Account Stripe Production',
      apiUrl: 'https://api.stripe.com/v1/accounts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV81MUxvbkxHQk95TlZLYjB2Z0xjVVBKMFpnTHI4WjNUQ0t4ZjFWMUJETjZuelcxYWZKU09ERHNPY25UNjJDSjVaTElmeWNRSXdISkpMUmFWTndlTzJnN1F4STAwaGtCRUFEU3E6',
      },
      params: {
        'type': "express",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accountId(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class RetrieveAccountStripeTestCall {
  static Future<ApiCallResponse> call({
    String? accountId = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Account Stripe Test',
      apiUrl: 'https://api.stripe.com/v1/accounts/$accountId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic c2tfdGVzdF81MUxvbkxHQk95TlZLYjB2Z1kwM09OZmZzb1N1SHlLRnl1RE53OWxMdldMd2ZUWDZtNnJoZ0pIbFpRU0VEOEd5Mm0xdnN6SHpMRHlkbDdKNnNReG1HUmUyWjAwOFU0RmdUMzg6',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? accountId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static dynamic businessProfile(dynamic response) => getJsonField(
        response,
        r'''$.business_profile''',
      );
  static String? externalAccountsUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.external_accounts.url''',
      ));
  static dynamic settings(dynamic response) => getJsonField(
        response,
        r'''$.settings''',
      );
  static dynamic chargesEnabled(dynamic response) => getJsonField(
        response,
        r'''$.charges_enabled''',
      );
  static dynamic detailsSubmitted(dynamic response) => getJsonField(
        response,
        r'''$.details_submitted''',
      );
}

class RetrieveAccountStripeProductionCall {
  static Future<ApiCallResponse> call({
    String? accountId = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Retrieve Account Stripe Production',
      apiUrl: 'https://api.stripe.com/v1/accounts/$accountId',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV81MUxvbkxHQk95TlZLYjB2Z0xjVVBKMFpnTHI4WjNUQ0t4ZjFWMUJETjZuelcxYWZKU09ERHNPY25UNjJDSjVaTElmeWNRSXdISkpMUmFWTndlTzJnN1F4STAwaGtCRUFEU3E6',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accountId(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic businessProfile(dynamic response) => getJsonField(
        response,
        r'''$.business_profile''',
      );
  static dynamic externalAccountsUrl(dynamic response) => getJsonField(
        response,
        r'''$.external_accounts.url''',
      );
  static dynamic settings(dynamic response) => getJsonField(
        response,
        r'''$.settings''',
      );
  static dynamic chargesEnabled(dynamic response) => getJsonField(
        response,
        r'''$.charges_enabled''',
      );
  static dynamic detailsSubmitted(dynamic response) => getJsonField(
        response,
        r'''$.details_submitted''',
      );
}

class CreateLoginLinkTestCall {
  static Future<ApiCallResponse> call({
    String? accountId = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Login Link Test',
      apiUrl: 'https://api.stripe.com/v1/accounts/$accountId/login_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfdGVzdF81MUxvbkxHQk95TlZLYjB2Z1kwM09OZmZzb1N1SHlLRnl1RE53OWxMdldMd2ZUWDZtNnJoZ0pIbFpRU0VEOEd5Mm0xdnN6SHpMRHlkbDdKNnNReG1HUmUyWjAwOFU0RmdUMzg6',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic loginLinkUrl(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class CreateLoginLinkProductionCall {
  static Future<ApiCallResponse> call({
    String? accountId = '0',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Login Link Production',
      apiUrl: 'https://api.stripe.com/v1/accounts/$accountId/login_links',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV81MUxvbkxHQk95TlZLYjB2Z0xjVVBKMFpnTHI4WjNUQ0t4ZjFWMUJETjZuelcxYWZKU09ERHNPY25UNjJDSjVaTElmeWNRSXdISkpMUmFWTndlTzJnN1F4STAwaGtCRUFEU3E6',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic loginLinkUrl(dynamic response) => getJsonField(
        response,
        r'''$.url''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
