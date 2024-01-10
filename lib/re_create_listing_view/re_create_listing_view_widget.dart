import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 're_create_listing_view_model.dart';
export 're_create_listing_view_model.dart';

class ReCreateListingViewWidget extends StatefulWidget {
  const ReCreateListingViewWidget({
    super.key,
    this.title,
    this.description,
    this.quantity,
    this.price,
    this.category,
    this.photoUrl,
    this.collectionTimeStart,
    this.collectionTimeEnd,
    this.originalValue,
  });

  final String? title;
  final String? description;
  final int? quantity;
  final double? price;
  final String? category;
  final String? photoUrl;
  final DateTime? collectionTimeStart;
  final DateTime? collectionTimeEnd;
  final double? originalValue;

  @override
  _ReCreateListingViewWidgetState createState() =>
      _ReCreateListingViewWidgetState();
}

class _ReCreateListingViewWidgetState extends State<ReCreateListingViewWidget> {
  late ReCreateListingViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReCreateListingViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ReCreateListingView'});
    _model.titleController ??= TextEditingController(
        text: widget.title != null && widget.title != '' ? widget.title : ' ');
    _model.titleFocusNode ??= FocusNode();

    _model.descriptionController ??= TextEditingController(
        text: widget.description != null && widget.description != ''
            ? widget.description
            : ' ');
    _model.descriptionFocusNode ??= FocusNode();

    _model.priceController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.price != null
          ? valueOrDefault<String>(
              widget.price?.toString(),
              '0',
            )
          : '0',
      '0',
    ));
    _model.priceFocusNode ??= FocusNode();

    _model.originalValueController ??= TextEditingController(
        text: (widget.originalValue != null) && (widget.originalValue != 0.0)
            ? widget.originalValue?.toString()
            : functions
                .getTotalPrice(2, double.parse(_model.priceController.text))
                .toString());
    _model.originalValueFocusNode ??= FocusNode();
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
          title: Text(
            FFLocalizations.of(context).getText(
              'gioisvj3' /* Create listing */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                buttonSize: 48.0,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('RE_CREATE_LISTING_VIEW_close_rounded_ICN');
                  FFAppState().update(() {
                    FFAppState().activePage = 'ListView';
                  });

                  context.pushNamed('ListView');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 100.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.titleController,
                                  focusNode: _model.titleFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'p7umeuhs' /* Title */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'kvjujeyq' /* Give your listing a title... */,
                                    ),
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
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 32.0, 20.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                  validator: _model.titleControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 12.0),
                                child: TextFormField(
                                  controller: _model.descriptionController,
                                  focusNode: _model.descriptionFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'jhj7d940' /* Description */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '4u5xo6n1' /* Enter a short description here... */,
                                    ),
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
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 32.0, 20.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model
                                      .descriptionControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'x8ims07d' /* Select how many you want to se... */,
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Container(
                                width: 160.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(25.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: FlutterFlowCountController(
                                  decrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.minusCircle,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    size: 32.0,
                                  ),
                                  incrementIconBuilder: (enabled) => FaIcon(
                                    FontAwesomeIcons.plusCircle,
                                    color: enabled
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    size: 32.0,
                                  ),
                                  countBuilder: (count) => Text(
                                    count.toString(),
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  count: _model.quantitySellValue ??=
                                      valueOrDefault<int>(
                                    widget.quantity != null
                                        ? valueOrDefault<int>(
                                            widget.quantity! > 0
                                                ? widget.quantity
                                                : 1,
                                            1,
                                          )
                                        : 1,
                                    1,
                                  ),
                                  updateCount: (count) => setState(
                                      () => _model.quantitySellValue = count),
                                  stepSize: 1,
                                  minimum: 1,
                                  maximum: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.priceController,
                                  focusNode: _model.priceFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      '2f1wgm0b' /* Price */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '1kof77rn' /* How much should each bag cost? */,
                                    ),
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
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 32.0, 20.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  validator: _model.priceControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.originalValueController,
                                  focusNode: _model.originalValueFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      's5p9dzek' /* Valued at */,
                                    ),
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '17a2z6q0' /* What is the original price of ... */,
                                    ),
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
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 32.0, 20.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  validator: _model
                                      .originalValueControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 12.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.categoryValueController ??=
                                      FormFieldController<String>(
                                    _model.categoryValue ??=
                                        valueOrDefault<String>(
                                      widget.category != null &&
                                              widget.category != ''
                                          ? widget.category
                                          : 'Restaurant',
                                      'Restaurant',
                                    ),
                                  ),
                                  options: [
                                    FFLocalizations.of(context).getText(
                                      'yv49fx0l' /* Bakery */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'wvqw9vs2' /* Restaurant */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'inj1wpw1' /* Cafe */,
                                    )
                                  ],
                                  onChanged: (val) => setState(
                                      () => _model.categoryValue = val),
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'eztfpkwg' /* Please select a category */,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              if (_model.categoryValue != null &&
                                  _model.categoryValue != '')
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'RE_CREATE_LISTING_VIEW_UPLOAD_PHOTO_BTN_');
                                      if (FFAppState()
                                          .photoUploadedForListing) {
                                        FFAppState().update(() {
                                          FFAppState().photoUploadedForListing =
                                              false;
                                        });
                                      }
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
                                            _model.isDataUploading = true);
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
                                                    height:
                                                        m.dimensions?.height,
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
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
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

                                      FFAppState().update(() {
                                        FFAppState().photoUploadedForListing =
                                            true;
                                      });
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'xjd24l3h' /* Upload photo */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).white,
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
                              if (!FFAppState().photoUploadedForListing)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '08rnu6eq' /* Please upload a photo of the f... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.sizeOf(context).height * 0.5,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      () {
                                        if (_model.uploadedFileUrl != '') {
                                          return _model.uploadedFileUrl;
                                        } else if (widget.photoUrl != null &&
                                            widget.photoUrl != '') {
                                          return widget.photoUrl;
                                        } else if (_model.categoryValue ==
                                            'Bakery') {
                                          return 'https://images.unsplash.com/photo-1612539466296-4ecf1db303e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2743&q=80';
                                        } else if (_model.categoryValue ==
                                            'Cafe') {
                                          return 'https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                        } else if (_model.categoryValue ==
                                            'Restaurant') {
                                          return 'https://images.unsplash.com/photo-1554136512-5d996b22f5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                        } else {
                                          return 'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84';
                                        }
                                      }(),
                                      'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84',
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        spacing: 8.0,
                                        runSpacing: 10.0,
                                        alignment: WrapAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.center,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'RE_CREATE_LISTING_VIEW_StartTime_ON_TAP');
                                              // StartTime
                                              final datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
                                                lastDate: DateTime(2050),
                                              );

                                              TimeOfDay? datePicked1Time;
                                              if (datePicked1Date != null) {
                                                datePicked1Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime:
                                                      TimeOfDay.fromDateTime(
                                                          getCurrentTimestamp),
                                                );
                                              }

                                              if (datePicked1Date != null &&
                                                  datePicked1Time != null) {
                                                safeSetState(() {
                                                  _model.datePicked1 = DateTime(
                                                    datePicked1Date.year,
                                                    datePicked1Date.month,
                                                    datePicked1Date.day,
                                                    datePicked1Time!.hour,
                                                    datePicked1Time.minute,
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.42,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 5.0, 12.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (_model
                                                                      .datePicked1 !=
                                                                  null) {
                                                                return dateTimeFormat(
                                                                  'd/M h:mm a',
                                                                  _model
                                                                      .datePicked1,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                );
                                                              } else if (widget
                                                                      .collectionTimeStart !=
                                                                  null) {
                                                                return valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    'd/M h:mm a',
                                                                    widget
                                                                        .collectionTimeStart,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  'Collection Time Start',
                                                                );
                                                              } else {
                                                                return 'Collection Time Start';
                                                              }
                                                            }(),
                                                            'Collection Time Start',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.date_range_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'RE_CREATE_LISTING_VIEW_EndTime_ON_TAP');
                                              final datePicked2Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: ((_model
                                                                .datePicked1 !=
                                                            null
                                                        ? functions
                                                            .addToTimeStamp(
                                                                _model
                                                                    .datePicked1,
                                                                30)
                                                        : getCurrentTimestamp) ??
                                                    DateTime.now()),
                                                firstDate: ((_model
                                                                .datePicked1 !=
                                                            null
                                                        ? functions
                                                            .addToTimeStamp(
                                                                _model
                                                                    .datePicked1,
                                                                30)
                                                        : getCurrentTimestamp) ??
                                                    DateTime.now()),
                                                lastDate: DateTime(2050),
                                              );

                                              TimeOfDay? datePicked2Time;
                                              if (datePicked2Date != null) {
                                                datePicked2Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.fromDateTime(((_model
                                                                  .datePicked1 !=
                                                              null
                                                          ? functions
                                                              .addToTimeStamp(
                                                                  _model
                                                                      .datePicked1,
                                                                  30)
                                                          : getCurrentTimestamp) ??
                                                      DateTime.now())),
                                                );
                                              }

                                              if (datePicked2Date != null &&
                                                  datePicked2Time != null) {
                                                safeSetState(() {
                                                  _model.datePicked2 = DateTime(
                                                    datePicked2Date.year,
                                                    datePicked2Date.month,
                                                    datePicked2Date.day,
                                                    datePicked2Time!.hour,
                                                    datePicked2Time.minute,
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.42,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 5.0, 12.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (_model
                                                                      .datePicked2 !=
                                                                  null) {
                                                                return dateTimeFormat(
                                                                  'd/M h:mm a',
                                                                  _model
                                                                      .datePicked2,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                );
                                                              } else if (widget
                                                                      .collectionTimeEnd !=
                                                                  null) {
                                                                return valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    'd/M h:mm a',
                                                                    widget
                                                                        .collectionTimeEnd,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  'Collection Time End',
                                                                );
                                                              } else {
                                                                return 'Collection Time End';
                                                              }
                                                            }(),
                                                            'Collection Time End',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.date_range_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: FutureBuilder<List<UsersRecord>>(
                              future: queryUsersRecordOnce(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UsersRecord> buttonUsersRecordList =
                                    snapshot.data!
                                        .where((u) => u.uid != currentUserUid)
                                        .toList();
                                return FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'RE_CREATE_LISTING_VIEW_CREATE_LISTING_BT');
                                    if ((_model.priceController.text !=
                                                '') &&
                                        (_model.priceController.text != '0')) {
                                      if ((_model.datePicked1 != null) &&
                                              (_model.datePicked2 != null)
                                          ? ((_model.datePicked2! >
                                                  _model.datePicked1!) &&
                                              (_model.datePicked2! >
                                                  getCurrentTimestamp))
                                          : false) {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }

                                        var listingsRecordReference1 =
                                            ListingsRecord.collection.doc();
                                        await listingsRecordReference1
                                            .set(createListingsRecordData(
                                          description:
                                              _model.descriptionController.text,
                                          price: double.tryParse(
                                              _model.priceController.text),
                                          quantity: _model.quantitySellValue,
                                          collectionTimeEnd: () {
                                            if (_model.datePicked2 != null) {
                                              return _model.datePicked2;
                                            } else if (widget
                                                    .collectionTimeEnd !=
                                                null) {
                                              return widget.collectionTimeEnd;
                                            } else {
                                              return getCurrentTimestamp;
                                            }
                                          }(),
                                          location:
                                              currentUserDocument?.location,
                                          streetAddress: valueOrDefault(
                                              currentUserDocument
                                                  ?.streetAddress,
                                              ''),
                                          category: _model.categoryValue,
                                          photoUrl: valueOrDefault<String>(
                                            () {
                                              if (_model.uploadedFileUrl !=
                                                      '') {
                                                return _model.uploadedFileUrl;
                                              } else if (widget.photoUrl !=
                                                      null &&
                                                  widget.photoUrl != '') {
                                                return widget.photoUrl;
                                              } else if (_model.categoryValue ==
                                                  'Bakery') {
                                                return 'https://images.unsplash.com/photo-1612539466296-4ecf1db303e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2743&q=80';
                                              } else if (_model.categoryValue ==
                                                  'Cafe') {
                                                return 'https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                              } else if (_model.categoryValue ==
                                                  'Restaurant') {
                                                return 'https://images.unsplash.com/photo-1554136512-5d996b22f5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                              } else {
                                                return 'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84';
                                              }
                                            }(),
                                            'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84',
                                          ),
                                          businessUid: currentUserUid,
                                          businessName: currentUserDisplayName,
                                          title: _model.titleController.text,
                                          collectionTimeStart: () {
                                            if (_model.datePicked1 != null) {
                                              return _model.datePicked1;
                                            } else if (widget
                                                    .collectionTimeStart !=
                                                null) {
                                              return widget.collectionTimeStart;
                                            } else {
                                              return getCurrentTimestamp;
                                            }
                                          }(),
                                          originalValue: valueOrDefault<double>(
                                            (_model.originalValueController
                                                                .text !=
                                                            '') &&
                                                    (_model.originalValueController
                                                            .text !=
                                                        '0')
                                                ? double.tryParse(_model
                                                    .originalValueController
                                                    .text)
                                                : valueOrDefault<double>(
                                                    functions.getTotalPrice(
                                                        2,
                                                        double.parse(_model
                                                            .priceController
                                                            .text)),
                                                    20.0,
                                                  ),
                                            20.0,
                                          ),
                                          creationTime: getCurrentTimestamp,
                                        ));
                                        _model.listingReferenceNew =
                                            ListingsRecord.getDocumentFromData(
                                                createListingsRecordData(
                                                  description: _model
                                                      .descriptionController
                                                      .text,
                                                  price: double.tryParse(_model
                                                      .priceController.text),
                                                  quantity:
                                                      _model.quantitySellValue,
                                                  collectionTimeEnd: () {
                                                    if (_model.datePicked2 !=
                                                        null) {
                                                      return _model.datePicked2;
                                                    } else if (widget
                                                            .collectionTimeEnd !=
                                                        null) {
                                                      return widget
                                                          .collectionTimeEnd;
                                                    } else {
                                                      return getCurrentTimestamp;
                                                    }
                                                  }(),
                                                  location: currentUserDocument
                                                      ?.location,
                                                  streetAddress: valueOrDefault(
                                                      currentUserDocument
                                                          ?.streetAddress,
                                                      ''),
                                                  category:
                                                      _model.categoryValue,
                                                  photoUrl:
                                                      valueOrDefault<String>(
                                                    () {
                                                      if (_model.uploadedFileUrl !=
                                                              '') {
                                                        return _model
                                                            .uploadedFileUrl;
                                                      } else if (widget
                                                                  .photoUrl !=
                                                              null &&
                                                          widget.photoUrl !=
                                                              '') {
                                                        return widget.photoUrl;
                                                      } else if (_model
                                                              .categoryValue ==
                                                          'Bakery') {
                                                        return 'https://images.unsplash.com/photo-1612539466296-4ecf1db303e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2743&q=80';
                                                      } else if (_model
                                                              .categoryValue ==
                                                          'Cafe') {
                                                        return 'https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                                      } else if (_model
                                                              .categoryValue ==
                                                          'Restaurant') {
                                                        return 'https://images.unsplash.com/photo-1554136512-5d996b22f5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                                      } else {
                                                        return 'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84';
                                                      }
                                                    }(),
                                                    'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84',
                                                  ),
                                                  businessUid: currentUserUid,
                                                  businessName:
                                                      currentUserDisplayName,
                                                  title: _model
                                                      .titleController.text,
                                                  collectionTimeStart: () {
                                                    if (_model.datePicked1 !=
                                                        null) {
                                                      return _model.datePicked1;
                                                    } else if (widget
                                                            .collectionTimeStart !=
                                                        null) {
                                                      return widget
                                                          .collectionTimeStart;
                                                    } else {
                                                      return getCurrentTimestamp;
                                                    }
                                                  }(),
                                                  originalValue:
                                                      valueOrDefault<double>(
                                                    (_model.originalValueController
                                                                        .text !=
                                                                    '') &&
                                                            (_model.originalValueController
                                                                    .text !=
                                                                '0')
                                                        ? double.tryParse(_model
                                                            .originalValueController
                                                            .text)
                                                        : valueOrDefault<
                                                            double>(
                                                            functions.getTotalPrice(
                                                                2,
                                                                double.parse(_model
                                                                    .priceController
                                                                    .text)),
                                                            20.0,
                                                          ),
                                                    20.0,
                                                  ),
                                                  creationTime:
                                                      getCurrentTimestamp,
                                                ),
                                                listingsRecordReference1);

                                        context.goNamed(
                                          'SuccessScreen',
                                          queryParameters: {
                                            'successTitle': serializeParam(
                                              'Listing created!',
                                              ParamType.String,
                                            ),
                                            'sucessSubtitle': serializeParam(
                                              'You just started regaining revenue! You can see your sold listings in Account -> Your Sold Orders',
                                              ParamType.String,
                                            ),
                                            'isPurchase': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );

                                        triggerPushNotification(
                                          notificationTitle: 'SnackDrop Alert!',
                                          notificationText:
                                              valueOrDefault<String>(
                                            '${valueOrDefault<String>(
                                              loggedIn
                                                  ? currentUserDisplayName
                                                  : 'A restaurant',
                                              'A restaurant ',
                                            )} just dropped a new Snack in your area. Click here to see all available snacks.',
                                            'A restaurant  just dropped a new Snack in your area. Click here to see all available snacks.',
                                          ),
                                          notificationImageUrl:
                                              'https://uploads-ssl.webflow.com/630cbc7d2f07f41dce5a5178/630d506a39ea85cdabe9a0fa_SnackSavers%20Logo%20Color.svg',
                                          scheduledTime: getCurrentTimestamp,
                                          notificationSound: 'default',
                                          userRefs: buttonUsersRecordList
                                              .where((e) => e != null)
                                              .toList()
                                              .map((e) => e.reference)
                                              .toList(),
                                          initialPageName: 'ListView',
                                          parameterData: {},
                                        );
                                        triggerPushNotification(
                                          notificationTitle: 'Listing expired',
                                          notificationText:
                                              'Your listings has expired. Would you like to extend the pick-up period? Click here to edit the listing',
                                          notificationImageUrl:
                                              'https://uploads-ssl.webflow.com/630cbc7d2f07f41dce5a5178/630d506a39ea85cdabe9a0fa_SnackSavers%20Logo%20Color.svg',
                                          scheduledTime: _model
                                              .listingReferenceNew!
                                              .collectionTimeEnd!,
                                          notificationSound: 'default',
                                          userRefs: [currentUserReference!],
                                          initialPageName: 'UpdateListingView',
                                          parameterData: {
                                            'title': _model
                                                .listingReferenceNew?.title,
                                            'description': _model
                                                .listingReferenceNew
                                                ?.description,
                                            'quantity': _model
                                                .listingReferenceNew?.quantity,
                                            'price': _model
                                                .listingReferenceNew?.price,
                                            'category': _model
                                                .listingReferenceNew?.category,
                                            'photoUrl': _model
                                                .listingReferenceNew?.photoUrl,
                                            'collectionTimeStart': _model
                                                .listingReferenceNew
                                                ?.collectionTimeStart,
                                            'collectionTimeEnd': _model
                                                .listingReferenceNew
                                                ?.collectionTimeEnd,
                                            'listingReference': _model
                                                .listingReferenceNew?.reference,
                                            'originalValue': _model
                                                .listingReferenceNew
                                                ?.originalValue,
                                          },
                                        );
                                      } else {
                                        if ((widget.collectionTimeStart !=
                                                    null) &&
                                                (widget.collectionTimeEnd !=
                                                    null)
                                            ? ((widget.collectionTimeEnd! >
                                                    widget
                                                        .collectionTimeStart!) &&
                                                (widget.collectionTimeEnd! >
                                                    getCurrentTimestamp))
                                            : false) {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }

                                          var listingsRecordReference2 =
                                              ListingsRecord.collection.doc();
                                          await listingsRecordReference2
                                              .set(createListingsRecordData(
                                            description: _model
                                                .descriptionController.text,
                                            price: double.tryParse(
                                                _model.priceController.text),
                                            quantity: _model.quantitySellValue,
                                            collectionTimeEnd: () {
                                              if (_model.datePicked2 != null) {
                                                return _model.datePicked2;
                                              } else if (widget
                                                      .collectionTimeEnd !=
                                                  null) {
                                                return widget.collectionTimeEnd;
                                              } else {
                                                return getCurrentTimestamp;
                                              }
                                            }(),
                                            location:
                                                currentUserDocument?.location,
                                            streetAddress: valueOrDefault(
                                                currentUserDocument
                                                    ?.streetAddress,
                                                ''),
                                            category: _model.categoryValue,
                                            photoUrl: valueOrDefault<String>(
                                              () {
                                                if (_model.uploadedFileUrl !=
                                                        '') {
                                                  return _model.uploadedFileUrl;
                                                } else if (widget.photoUrl !=
                                                        null &&
                                                    widget.photoUrl != '') {
                                                  return widget.photoUrl;
                                                } else if (_model
                                                        .categoryValue ==
                                                    'Bakery') {
                                                  return 'https://images.unsplash.com/photo-1612539466296-4ecf1db303e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2743&q=80';
                                                } else if (_model
                                                        .categoryValue ==
                                                    'Cafe') {
                                                  return 'https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                                } else if (_model
                                                        .categoryValue ==
                                                    'Restaurant') {
                                                  return 'https://images.unsplash.com/photo-1554136512-5d996b22f5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                                } else {
                                                  return 'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84';
                                                }
                                              }(),
                                              'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84',
                                            ),
                                            businessUid: currentUserUid,
                                            businessName:
                                                currentUserDisplayName,
                                            title: _model.titleController.text,
                                            collectionTimeStart: () {
                                              if (_model.datePicked1 != null) {
                                                return _model.datePicked1;
                                              } else if (widget
                                                      .collectionTimeStart !=
                                                  null) {
                                                return widget
                                                    .collectionTimeStart;
                                              } else {
                                                return getCurrentTimestamp;
                                              }
                                            }(),
                                            originalValue:
                                                valueOrDefault<double>(
                                              (_model.originalValueController
                                                                  .text !=
                                                              '') &&
                                                      (_model.originalValueController
                                                              .text !=
                                                          '0')
                                                  ? double.tryParse(_model
                                                      .originalValueController
                                                      .text)
                                                  : valueOrDefault<double>(
                                                      functions.getTotalPrice(
                                                          2,
                                                          double.parse(_model
                                                              .priceController
                                                              .text)),
                                                      20.0,
                                                    ),
                                              20.0,
                                            ),
                                            creationTime: getCurrentTimestamp,
                                          ));
                                          _model.listingReferenceRecreation =
                                              ListingsRecord
                                                  .getDocumentFromData(
                                                      createListingsRecordData(
                                                        description: _model
                                                            .descriptionController
                                                            .text,
                                                        price: double.tryParse(
                                                            _model
                                                                .priceController
                                                                .text),
                                                        quantity: _model
                                                            .quantitySellValue,
                                                        collectionTimeEnd: () {
                                                          if (_model
                                                                  .datePicked2 !=
                                                              null) {
                                                            return _model
                                                                .datePicked2;
                                                          } else if (widget
                                                                  .collectionTimeEnd !=
                                                              null) {
                                                            return widget
                                                                .collectionTimeEnd;
                                                          } else {
                                                            return getCurrentTimestamp;
                                                          }
                                                        }(),
                                                        location:
                                                            currentUserDocument
                                                                ?.location,
                                                        streetAddress: valueOrDefault(
                                                            currentUserDocument
                                                                ?.streetAddress,
                                                            ''),
                                                        category: _model
                                                            .categoryValue,
                                                        photoUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          () {
                                                            if (_model.uploadedFileUrl !=
                                                                    '') {
                                                              return _model
                                                                  .uploadedFileUrl;
                                                            } else if (widget
                                                                        .photoUrl !=
                                                                    null &&
                                                                widget.photoUrl !=
                                                                    '') {
                                                              return widget
                                                                  .photoUrl;
                                                            } else if (_model
                                                                    .categoryValue ==
                                                                'Bakery') {
                                                              return 'https://images.unsplash.com/photo-1612539466296-4ecf1db303e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2743&q=80';
                                                            } else if (_model
                                                                    .categoryValue ==
                                                                'Cafe') {
                                                              return 'https://images.unsplash.com/photo-1609590981063-d495e2914ce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                                            } else if (_model
                                                                    .categoryValue ==
                                                                'Restaurant') {
                                                              return 'https://images.unsplash.com/photo-1554136512-5d996b22f5fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80';
                                                            } else {
                                                              return 'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84';
                                                            }
                                                          }(),
                                                          'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84',
                                                        ),
                                                        businessUid:
                                                            currentUserUid,
                                                        businessName:
                                                            currentUserDisplayName,
                                                        title: _model
                                                            .titleController
                                                            .text,
                                                        collectionTimeStart:
                                                            () {
                                                          if (_model
                                                                  .datePicked1 !=
                                                              null) {
                                                            return _model
                                                                .datePicked1;
                                                          } else if (widget
                                                                  .collectionTimeStart !=
                                                              null) {
                                                            return widget
                                                                .collectionTimeStart;
                                                          } else {
                                                            return getCurrentTimestamp;
                                                          }
                                                        }(),
                                                        originalValue:
                                                            valueOrDefault<
                                                                double>(
                                                          (_model.originalValueController
                                                                              .text !=
                                                                          '') &&
                                                                  (_model.originalValueController
                                                                          .text !=
                                                                      '0')
                                                              ? double.tryParse(
                                                                  _model
                                                                      .originalValueController
                                                                      .text)
                                                              : valueOrDefault<
                                                                  double>(
                                                                  functions.getTotalPrice(
                                                                      2,
                                                                      double.parse(_model
                                                                          .priceController
                                                                          .text)),
                                                                  20.0,
                                                                ),
                                                          20.0,
                                                        ),
                                                        creationTime:
                                                            getCurrentTimestamp,
                                                      ),
                                                      listingsRecordReference2);

                                          context.goNamed(
                                            'SuccessScreen',
                                            queryParameters: {
                                              'successTitle': serializeParam(
                                                'Listing created!',
                                                ParamType.String,
                                              ),
                                              'sucessSubtitle': serializeParam(
                                                'You just started regaining revenue! You can see your sold listings in Account -> Your Sold Orders',
                                                ParamType.String,
                                              ),
                                              'isPurchase': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );

                                          triggerPushNotification(
                                            notificationTitle:
                                                'SnackDrop Alert!',
                                            notificationText:
                                                valueOrDefault<String>(
                                              '${valueOrDefault<String>(
                                                loggedIn
                                                    ? currentUserDisplayName
                                                    : 'A restaurant',
                                                'A restaurant ',
                                              )} just dropped a new Snack in your area. Click here to see all available snacks.',
                                              'A restaurant  just dropped a new Snack in your area. Click here to see all available snacks.',
                                            ),
                                            notificationImageUrl:
                                                'https://uploads-ssl.webflow.com/630cbc7d2f07f41dce5a5178/630d506a39ea85cdabe9a0fa_SnackSavers%20Logo%20Color.svg',
                                            scheduledTime: getCurrentTimestamp,
                                            notificationSound: 'default',
                                            userRefs: buttonUsersRecordList
                                                .where((e) => e != null)
                                                .toList()
                                                .map((e) => e.reference)
                                                .toList(),
                                            initialPageName: 'ListView',
                                            parameterData: {},
                                          );
                                          triggerPushNotification(
                                            notificationTitle:
                                                'Listing expired',
                                            notificationText:
                                                'Your listings has expired. Would you like to extend the pick-up period? Click here to edit the listing',
                                            notificationImageUrl:
                                                'https://uploads-ssl.webflow.com/630cbc7d2f07f41dce5a5178/630d506a39ea85cdabe9a0fa_SnackSavers%20Logo%20Color.svg',
                                            scheduledTime: _model
                                                .listingReferenceRecreation!
                                                .collectionTimeEnd!,
                                            notificationSound: 'default',
                                            userRefs: [currentUserReference!],
                                            initialPageName:
                                                'UpdateListingView',
                                            parameterData: {
                                              'title': _model
                                                  .listingReferenceRecreation
                                                  ?.title,
                                              'description': _model
                                                  .listingReferenceRecreation
                                                  ?.description,
                                              'quantity': _model
                                                  .listingReferenceRecreation
                                                  ?.quantity,
                                              'price': _model
                                                  .listingReferenceRecreation
                                                  ?.price,
                                              'category': _model.categoryValue,
                                              'photoUrl': _model
                                                  .listingReferenceRecreation
                                                  ?.photoUrl,
                                              'collectionTimeStart': _model
                                                  .listingReferenceRecreation
                                                  ?.collectionTimeStart,
                                              'collectionTimeEnd': _model
                                                  .listingReferenceRecreation
                                                  ?.collectionTimeEnd,
                                              'listingReference': _model
                                                  .listingReferenceRecreation
                                                  ?.reference,
                                              'originalValue': _model
                                                  .listingReferenceRecreation
                                                  ?.originalValue,
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Incorrect pick-up time'),
                                                content: const Text(
                                                    'Allow your customers to have time to pick-up the snack! Give them at least a 30 minute pick up window'),
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
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('No price set'),
                                            content: const Text(
                                                'To post a listing, you have to set a price for the listing'),
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

                                    setState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'f3wq4ybv' /* Create Listing */,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarFlotingModel,
                  updateCallback: () => setState(() {}),
                  child: const NavBarFlotingWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
