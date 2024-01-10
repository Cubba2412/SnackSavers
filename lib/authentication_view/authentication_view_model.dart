import '/flutter_flow/flutter_flow_util.dart';
import 'authentication_view_widget.dart' show AuthenticationViewWidget;
import 'package:flutter/material.dart';

class AuthenticationViewModel
    extends FlutterFlowModel<AuthenticationViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lfnjyq3y' /* Please enter your email */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'chujvub9' /* Please enter your password */,
      );
    }

    return null;
  }

  // State field(s) for Name-Create widget.
  FocusNode? nameCreateFocusNode;
  TextEditingController? nameCreateController;
  String? Function(BuildContext, String?)? nameCreateControllerValidator;
  String? _nameCreateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'txk32liy' /* Please enter your name */,
      );
    }

    return null;
  }

  // State field(s) for emailAddress-Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  String? _emailAddressCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yeeh3xhu' /* Email required for sign up */,
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
        '8n5f9n18' /* Phonenumber required for sign ... */,
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
        'viaphkn4' /* Enter a password for your acco... */,
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
        '4nr8xfrw' /* Enter the same password */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailAddressControllerValidator = _emailAddressControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    nameCreateControllerValidator = _nameCreateControllerValidator;
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
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    nameCreateFocusNode?.dispose();
    nameCreateController?.dispose();

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
