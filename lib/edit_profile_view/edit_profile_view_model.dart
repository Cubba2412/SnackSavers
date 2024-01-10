import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_view_widget.dart' show EditProfileViewWidget;
import 'package:flutter/material.dart';

class EditProfileViewModel extends FlutterFlowModel<EditProfileViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for displayName-UpdateUser widget.
  FocusNode? displayNameUpdateUserFocusNode;
  TextEditingController? displayNameUpdateUserController;
  String? Function(BuildContext, String?)?
      displayNameUpdateUserControllerValidator;
  String? _displayNameUpdateUserControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'szlly8fb' /* Name is required */,
      );
    }

    return null;
  }

  // State field(s) for email-UpdateUser widget.
  FocusNode? emailUpdateUserFocusNode;
  TextEditingController? emailUpdateUserController;
  String? Function(BuildContext, String?)? emailUpdateUserControllerValidator;
  String? _emailUpdateUserControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w4ix31j3' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for phoneNumber-UpdateUser widget.
  FocusNode? phoneNumberUpdateUserFocusNode;
  TextEditingController? phoneNumberUpdateUserController;
  String? Function(BuildContext, String?)?
      phoneNumberUpdateUserControllerValidator;
  String? _phoneNumberUpdateUserControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fkufzhfc' /* Phone number is required */,
      );
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for displayName-UpdateBusiness widget.
  FocusNode? displayNameUpdateBusinessFocusNode;
  TextEditingController? displayNameUpdateBusinessController;
  String? Function(BuildContext, String?)?
      displayNameUpdateBusinessControllerValidator;
  String? _displayNameUpdateBusinessControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'izo8318o' /* Business name is required */,
      );
    }

    return null;
  }

  // State field(s) for email-UpdateBusiness widget.
  FocusNode? emailUpdateBusinessFocusNode;
  TextEditingController? emailUpdateBusinessController;
  String? Function(BuildContext, String?)?
      emailUpdateBusinessControllerValidator;
  String? _emailUpdateBusinessControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yt31l3iq' /* Email is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for phoneNumber-UpdateBusiness widget.
  FocusNode? phoneNumberUpdateBusinessFocusNode;
  TextEditingController? phoneNumberUpdateBusinessController;
  String? Function(BuildContext, String?)?
      phoneNumberUpdateBusinessControllerValidator;
  String? _phoneNumberUpdateBusinessControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iww1oqi6' /* Phonenumber is required */,
      );
    }

    return null;
  }

  // State field(s) for ABNNumber-Update widget.
  FocusNode? aBNNumberUpdateFocusNode;
  TextEditingController? aBNNumberUpdateController;
  String? Function(BuildContext, String?)? aBNNumberUpdateControllerValidator;
  String? _aBNNumberUpdateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rqf2cqoo' /* ABN number is required */,
      );
    }

    return null;
  }

  // State field(s) for streetAddress-Update widget.
  FocusNode? streetAddressUpdateFocusNode;
  TextEditingController? streetAddressUpdateController;
  String? Function(BuildContext, String?)?
      streetAddressUpdateControllerValidator;
  String? _streetAddressUpdateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '24her7nj' /* Street address is required (se... */,
      );
    }

    return null;
  }

  // State field(s) for streetAddress-Update widget.
  var streetAddressUpdateValue = const FFPlace();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    displayNameUpdateUserControllerValidator =
        _displayNameUpdateUserControllerValidator;
    emailUpdateUserControllerValidator = _emailUpdateUserControllerValidator;
    phoneNumberUpdateUserControllerValidator =
        _phoneNumberUpdateUserControllerValidator;
    displayNameUpdateBusinessControllerValidator =
        _displayNameUpdateBusinessControllerValidator;
    emailUpdateBusinessControllerValidator =
        _emailUpdateBusinessControllerValidator;
    phoneNumberUpdateBusinessControllerValidator =
        _phoneNumberUpdateBusinessControllerValidator;
    aBNNumberUpdateControllerValidator = _aBNNumberUpdateControllerValidator;
    streetAddressUpdateControllerValidator =
        _streetAddressUpdateControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    displayNameUpdateUserFocusNode?.dispose();
    displayNameUpdateUserController?.dispose();

    emailUpdateUserFocusNode?.dispose();
    emailUpdateUserController?.dispose();

    phoneNumberUpdateUserFocusNode?.dispose();
    phoneNumberUpdateUserController?.dispose();

    displayNameUpdateBusinessFocusNode?.dispose();
    displayNameUpdateBusinessController?.dispose();

    emailUpdateBusinessFocusNode?.dispose();
    emailUpdateBusinessController?.dispose();

    phoneNumberUpdateBusinessFocusNode?.dispose();
    phoneNumberUpdateBusinessController?.dispose();

    aBNNumberUpdateFocusNode?.dispose();
    aBNNumberUpdateController?.dispose();

    streetAddressUpdateFocusNode?.dispose();
    streetAddressUpdateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
