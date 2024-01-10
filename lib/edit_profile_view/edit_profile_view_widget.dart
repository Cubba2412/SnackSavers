import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'edit_profile_view_model.dart';
export 'edit_profile_view_model.dart';

class EditProfileViewWidget extends StatefulWidget {
  const EditProfileViewWidget({super.key});

  @override
  _EditProfileViewWidgetState createState() => _EditProfileViewWidgetState();
}

class _EditProfileViewWidgetState extends State<EditProfileViewWidget> {
  late EditProfileViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EditProfileView'});
    _model.displayNameUpdateUserController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.displayNameUpdateUserFocusNode ??= FocusNode();

    _model.emailUpdateUserController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailUpdateUserFocusNode ??= FocusNode();

    _model.phoneNumberUpdateUserController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneNumberUpdateUserFocusNode ??= FocusNode();

    _model.displayNameUpdateBusinessController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.displayNameUpdateBusinessFocusNode ??= FocusNode();

    _model.emailUpdateBusinessController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailUpdateBusinessFocusNode ??= FocusNode();

    _model.phoneNumberUpdateBusinessController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.phoneNumberUpdateBusinessFocusNode ??= FocusNode();

    _model.aBNNumberUpdateController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.aBNNumber, 0).toString());
    _model.aBNNumberUpdateFocusNode ??= FocusNode();

    _model.streetAddressUpdateController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.streetAddress, '') != ''
            ? valueOrDefault(currentUserDocument?.streetAddress, '')
            : _model.streetAddressUpdateValue.address);
    _model.streetAddressUpdateFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('EDIT_PROFILE_VIEW_arrow_back_ICN_ON_TAP');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'zeyir2h5' /* Edit Profile */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).displaySmall,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (loggedIn
                  ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) ==
                          null) ||
                      (valueOrDefault(currentUserDocument?.aBNNumber, 0) == 0))
                  : false)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Form(
                      key: _model.formKey2,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFDBE2E7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: 90.0,
                                          height: 90.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: valueOrDefault<String>(
                                              () {
                                                if (currentUserPhoto != '') {
                                                  return currentUserPhoto;
                                                } else if (_model.uploadedFileUrl1 !=
                                                        '') {
                                                  return _model
                                                      .uploadedFileUrl1;
                                                } else {
                                                  return 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg';
                                                }
                                              }(),
                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'EDIT_PROFILE_VIEW_UPLOAD_PHOTO_BTN_ON_TA');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading1 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          FFLocalizations.of(context).getText(
                                            'f8ivf1wi' /* Uploading file... */,
                                          ),
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading1 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl1 =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(
                                            context,
                                            FFLocalizations.of(context).getText(
                                              'owmbr330' /* Success! */,
                                            ));
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context,
                                            FFLocalizations.of(context).getText(
                                              'kr0wi6mc' /* Failed to upload media */,
                                            ));
                                        return;
                                      }
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'tpa7z11m' /* Upload photo */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller:
                                      _model.displayNameUpdateUserController,
                                  focusNode:
                                      _model.displayNameUpdateUserFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: (valueOrDefault(
                                                    currentUserDocument
                                                        ?.aBNNumber,
                                                    0) !=
                                                null) &&
                                            (valueOrDefault(
                                                    currentUserDocument
                                                        ?.aBNNumber,
                                                    0) !=
                                                0)
                                        ? 'Business Name'
                                        : 'Name',
                                    hintText: valueOrDefault(
                                                currentUserDocument?.aBNNumber,
                                                0) !=
                                            null
                                        ? 'Business Name'
                                        : 'Your Name',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .displayNameUpdateUserControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller: _model.emailUpdateUserController,
                                  focusNode: _model.emailUpdateUserFocusNode,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'mb7ntx2f' /* Email */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'v2wboeak' /* Email */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model
                                      .emailUpdateUserControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller:
                                      _model.phoneNumberUpdateUserController,
                                  focusNode:
                                      _model.phoneNumberUpdateUserFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'de87i6vh' /* Phone Number */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'rjzg6pod' /* Phone Number */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.phone,
                                  validator: _model
                                      .phoneNumberUpdateUserControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (loggedIn
                  ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                          null) &&
                      (valueOrDefault(currentUserDocument?.aBNNumber, 0) != 0))
                  : false)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 65.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Form(
                      key: _model.formKey1,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFDBE2E7),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'EDIT_PROFILE_VIEW_CircleImage_b3vpavu4_O');
                                            if ((await getPermissionStatus(
                                                    cameraPermission)) ||
                                                (await getPermissionStatus(
                                                    photoLibraryPermission))) {
                                              if (loggedIn) {
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  allowPhoto: true,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'f8ivf1wi' /* Uploading file... */,
                                                      ),
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile2 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl2 =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context,
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'owmbr330' /* Success! */,
                                                        ));
                                                  } else {
                                                    setState(() {});
                                                    showUploadMessage(
                                                        context,
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'kr0wi6mc' /* Failed to upload media */,
                                                        ));
                                                    return;
                                                  }
                                                }

                                                if (loggedIn
                                                    ? ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aBNNumber,
                                                                0) !=
                                                            null) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.aBNNumber,
                                                                0) !=
                                                            0))
                                                    : false) {
                                                  if (_model.formKey1
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey1
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    aBNNumber: int.tryParse(_model
                                                        .aBNNumberUpdateController
                                                        .text),
                                                    displayName: _model
                                                        .displayNameUpdateBusinessController
                                                        .text,
                                                    phoneNumber: _model
                                                        .phoneNumberUpdateBusinessController
                                                        .text,
                                                    location: _model
                                                        .streetAddressUpdateValue
                                                        .latLng,
                                                    streetAddress: _model
                                                        .streetAddressUpdateValue
                                                        .address,
                                                    photoUrl:
                                                        valueOrDefault<String>(
                                                      () {
                                                        if (_model.uploadedFileUrl1 !=
                                                                '') {
                                                          return _model
                                                              .uploadedFileUrl1;
                                                        } else if (_model.uploadedFileUrl3 !=
                                                                '') {
                                                          return _model
                                                              .uploadedFileUrl3;
                                                        } else {
                                                          return 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg';
                                                        }
                                                      }(),
                                                      'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                                    ),
                                                  ));
                                                } else {
                                                  if (_model.formKey2
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey2
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    displayName: _model
                                                        .displayNameUpdateUserController
                                                        .text,
                                                    phoneNumber: _model
                                                        .phoneNumberUpdateUserController
                                                        .text,
                                                    photoUrl:
                                                        _model.uploadedFileUrl1,
                                                  ));
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Login or Sign Up'),
                                                      content: const Text(
                                                          'You need to be signed in to use this feature'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('OK'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Insufficient permissions'),
                                                    content: const Text(
                                                        'You need to give SnackSavers Permission to use your photo library or camera to use this feature'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 90.0,
                                            height: 90.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 500),
                                              imageUrl: valueOrDefault<String>(
                                                () {
                                                  if (_model.uploadedFileUrl1 !=
                                                          '') {
                                                    return _model
                                                        .uploadedFileUrl1;
                                                  } else if (_model.uploadedFileUrl3 !=
                                                          '') {
                                                    return _model
                                                        .uploadedFileUrl3;
                                                  } else if (loggedIn) {
                                                    return (currentUserPhoto !=
                                                                ''
                                                        ? currentUserPhoto
                                                        : 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg');
                                                  } else {
                                                    return 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg';
                                                  }
                                                }(),
                                                'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'EDIT_PROFILE_VIEW_UPLOAD_PHOTO_BTN_ON_TA');
                                    if ((await getPermissionStatus(
                                            cameraPermission)) ||
                                        (await getPermissionStatus(
                                            photoLibraryPermission))) {
                                      if (loggedIn) {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading3 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            showUploadMessage(
                                              context,
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'f8ivf1wi' /* Uploading file... */,
                                              ),
                                              showLoading: true,
                                            );
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            _model.isDataUploading3 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile3 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl3 =
                                                  downloadUrls.first;
                                            });
                                            showUploadMessage(
                                                context,
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'owmbr330' /* Success! */,
                                                ));
                                          } else {
                                            setState(() {});
                                            showUploadMessage(
                                                context,
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kr0wi6mc' /* Failed to upload media */,
                                                ));
                                            return;
                                          }
                                        }

                                        if (loggedIn
                                            ? ((valueOrDefault(
                                                        currentUserDocument
                                                            ?.aBNNumber,
                                                        0) !=
                                                    null) &&
                                                (valueOrDefault(
                                                        currentUserDocument
                                                            ?.aBNNumber,
                                                        0) !=
                                                    0))
                                            : false) {
                                          if (_model.formKey1.currentState ==
                                                  null ||
                                              !_model.formKey1.currentState!
                                                  .validate()) {
                                            return;
                                          }

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            aBNNumber: int.tryParse(_model
                                                .aBNNumberUpdateController
                                                .text),
                                            displayName: _model
                                                .displayNameUpdateBusinessController
                                                .text,
                                            phoneNumber: _model
                                                .phoneNumberUpdateBusinessController
                                                .text,
                                            location: _model
                                                .streetAddressUpdateValue
                                                .latLng,
                                            streetAddress: _model
                                                .streetAddressUpdateValue
                                                .address,
                                            photoUrl: valueOrDefault<String>(
                                              () {
                                                if (_model.uploadedFileUrl1 !=
                                                        '') {
                                                  return _model
                                                      .uploadedFileUrl1;
                                                } else if (_model.uploadedFileUrl3 !=
                                                        '') {
                                                  return _model
                                                      .uploadedFileUrl3;
                                                } else {
                                                  return 'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg';
                                                }
                                              }(),
                                              'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                                            ),
                                          ));
                                        } else {
                                          if (_model.formKey2.currentState ==
                                                  null ||
                                              !_model.formKey2.currentState!
                                                  .validate()) {
                                            return;
                                          }

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            displayName: _model
                                                .displayNameUpdateUserController
                                                .text,
                                            phoneNumber: _model
                                                .phoneNumberUpdateUserController
                                                .text,
                                            photoUrl: _model.uploadedFileUrl1,
                                          ));
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('Login or Sign Up'),
                                              content: const Text(
                                                  'You need to be signed in to use this feature'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Insufficient permissions'),
                                            content: const Text(
                                                'You need to give SnackSavers Permission to use your photo library or camera to use this feature'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'u7blv2da' /* Upload photo */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller: _model
                                      .displayNameUpdateBusinessController,
                                  focusNode:
                                      _model.displayNameUpdateBusinessFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: (valueOrDefault(
                                                    currentUserDocument
                                                        ?.aBNNumber,
                                                    0) !=
                                                null) &&
                                            (valueOrDefault(
                                                    currentUserDocument
                                                        ?.aBNNumber,
                                                    0) !=
                                                0)
                                        ? 'Business Name'
                                        : 'Name',
                                    hintText: valueOrDefault(
                                                currentUserDocument?.aBNNumber,
                                                0) !=
                                            null
                                        ? 'Business Name'
                                        : 'Your Name',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.name,
                                  validator: _model
                                      .displayNameUpdateBusinessControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller:
                                      _model.emailUpdateBusinessController,
                                  focusNode:
                                      _model.emailUpdateBusinessFocusNode,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'o84ytfn8' /* Email */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'nyb68wvb' /* Email */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model
                                      .emailUpdateBusinessControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller: _model
                                      .phoneNumberUpdateBusinessController,
                                  focusNode:
                                      _model.phoneNumberUpdateBusinessFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'oba5s7b9' /* Phone Number */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'gps4x8bo' /* Phone Number */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.phone,
                                  validator: _model
                                      .phoneNumberUpdateBusinessControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller: _model.aBNNumberUpdateController,
                                  focusNode: _model.aBNNumberUpdateFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'cnwdxycd' /* ABN Number */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'p327npvu' /* ABN Number */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.number,
                                  validator: _model
                                      .aBNNumberUpdateControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 12.0),
                                child: TextFormField(
                                  controller:
                                      _model.streetAddressUpdateController,
                                  focusNode:
                                      _model.streetAddressUpdateFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'sdvindu4' /* Address */,
                                    ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'eal0jq8i' /* Address */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 0.0, 24.0),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.streetAddress,
                                  validator: _model
                                      .streetAddressUpdateControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyDhKX2Q2A1CpMqDy5N_ayKlUrwYZFHcSkg',
                                androidGoogleMapsApiKey:
                                    'AIzaSyB97fIi4C5MT-VNqhHmVGrQ_OQsazjXDEM',
                                webGoogleMapsApiKey:
                                    'AIzaSyCTzMwQ2Ggjr0JXXhae353bpu7CJcSnuMk',
                                onSelect: (place) async {
                                  setState(() =>
                                      _model.streetAddressUpdateValue = place);
                                },
                                defaultText:
                                    FFLocalizations.of(context).getText(
                                  '5xyyxirx' /* Change Address */,
                                ),
                                icon: const Icon(
                                  Icons.place,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (loggedIn)
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_PROFILE_VIEW_saveUpdateChanges_ON_T');
                        if (loggedIn
                            ? ((valueOrDefault(
                                        currentUserDocument?.aBNNumber, 0) !=
                                    null) &&
                                (valueOrDefault(
                                        currentUserDocument?.aBNNumber, 0) !=
                                    0))
                            : false) {
                          if (_model.formKey1.currentState == null ||
                              !_model.formKey1.currentState!.validate()) {
                            return;
                          }

                          await currentUserReference!
                              .update(createUsersRecordData(
                            aBNNumber: int.tryParse(
                                _model.aBNNumberUpdateController.text),
                            displayName:
                                _model.displayNameUpdateBusinessController.text,
                            phoneNumber:
                                _model.phoneNumberUpdateBusinessController.text,
                            location: _model.streetAddressUpdateValue.latLng,
                            streetAddress:
                                _model.streetAddressUpdateValue.address,
                            photoUrl: () {
                              if (_model.uploadedFileUrl1 != '') {
                                return _model.uploadedFileUrl1;
                              } else if (_model.uploadedFileUrl3 != '') {
                                return _model.uploadedFileUrl3;
                              } else {
                                return 's';
                              }
                            }(),
                          ));
                        } else {
                          if (_model.formKey2.currentState == null ||
                              !_model.formKey2.currentState!.validate()) {
                            return;
                          }

                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName:
                                _model.displayNameUpdateUserController.text,
                            phoneNumber:
                                _model.phoneNumberUpdateUserController.text,
                            photoUrl: _model.uploadedFileUrl1,
                          ));
                        }

                        context.pushNamed(
                          'SuccessScreen',
                          queryParameters: {
                            'successTitle': serializeParam(
                              'Account updated',
                              ParamType.String,
                            ),
                            'sucessSubtitle': serializeParam(
                              'Your account information has been updated in the database',
                              ParamType.String,
                            ),
                            'isPurchase': serializeParam(
                              false,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        '1n4ijqrh' /* Save Changes */,
                      ),
                      options: FFButtonOptions(
                        width: 340.0,
                        height: 60.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 2.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
