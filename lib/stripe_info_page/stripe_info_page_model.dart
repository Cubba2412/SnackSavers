import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'stripe_info_page_widget.dart' show StripeInfoPageWidget;
import 'package:flutter/material.dart';

class StripeInfoPageModel extends FlutterFlowModel<StripeInfoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Retrieve Account Stripe Production)] action in StripeInfoPage widget.
  ApiCallResponse? stripeAccountDetails;
  // Stores action output result for [Backend Call - API (Create Account Link Stripe Production)] action in Button widget.
  ApiCallResponse? accountLinkUrl;
  // Stores action output result for [Backend Call - API (Create Login Link Production)] action in Button widget.
  ApiCallResponse? loginLinkUrl;

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
