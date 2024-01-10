import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stripe_refresh_page_widget.dart' show StripeRefreshPageWidget;
import 'package:flutter/material.dart';

class StripeRefreshPageModel extends FlutterFlowModel<StripeRefreshPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Create Account Link Stripe Production)] action in Button widget.
  ApiCallResponse? accountLinkUrl;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
