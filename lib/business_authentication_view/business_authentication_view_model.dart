import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'business_authentication_view_widget.dart'
    show BusinessAuthenticationViewWidget;
import 'package:flutter/material.dart';

class BusinessAuthenticationViewModel
    extends FlutterFlowModel<BusinessAuthenticationViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name-Create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateController;
  String? Function(BuildContext, String?)? nameCreateControllerValidator;
  String? _nameCreateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gyt15jsn' /* Business name required */,
      );
    }

    return null;
  }

  // State field(s) for ABNNumber-Create widget.
  FocusNode? aBNNumberCreateFocusNode;
  TextEditingController? aBNNumberCreateController;
  String? Function(BuildContext, String?)? aBNNumberCreateControllerValidator;
  String? _aBNNumberCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm3yl35oa' /* ABN number required */,
      );
    }

    return null;
  }

  // State field(s) for address-Create widget.
  var addressCreateValue = const FFPlace();
  // State field(s) for emailAddress-Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  String? _emailAddressCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gnfkvdgo' /* Email required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for phoneNumber-Create widget.
  FocusNode? phoneNumberCreateFocusNode;
  TextEditingController? phoneNumberCreateController;
  String? Function(BuildContext, String?)? phoneNumberCreateControllerValidator;
  String? _phoneNumberCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '39o5o5c1' /* Phone number required */,
      );
    }

    return null;
  }

  // State field(s) for password-Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  String? _passwordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '72ix6940' /* Enter a password for your acco... */,
      );
    }

    return null;
  }

  // State field(s) for confirmPassword-Create widget.
  FocusNode? confirmPasswordCreateFocusNode;
  TextEditingController? confirmPasswordCreateController;
  late bool confirmPasswordCreateVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordCreateControllerValidator;
  String? _confirmPasswordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9mzmqkdm' /* Enter the same password */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Create Express Account Stripe Production)] action in Button-CreateUser widget.
  ApiCallResponse? stripeExpressAccount;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameCreateControllerValidator = _nameCreateControllerValidator;
    aBNNumberCreateControllerValidator = _aBNNumberCreateControllerValidator;
    emailAddressCreateControllerValidator =
        _emailAddressCreateControllerValidator;
    phoneNumberCreateControllerValidator =
        _phoneNumberCreateControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateControllerValidator = _passwordCreateControllerValidator;
    confirmPasswordCreateVisibility = false;
    confirmPasswordCreateControllerValidator =
        _confirmPasswordCreateControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameCreateFocusNode?.dispose();
    nameCreateController?.dispose();

    aBNNumberCreateFocusNode?.dispose();
    aBNNumberCreateController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateController?.dispose();

    phoneNumberCreateFocusNode?.dispose();
    phoneNumberCreateController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();

    confirmPasswordCreateFocusNode?.dispose();
    confirmPasswordCreateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
