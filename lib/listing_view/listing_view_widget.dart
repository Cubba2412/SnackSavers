import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_listing_verification_widget.dart';
import '/components/open_maps_widget.dart';
import '/components/pay_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'listing_view_model.dart';
export 'listing_view_model.dart';

class ListingViewWidget extends StatefulWidget {
  const ListingViewWidget({
    super.key,
    this.title,
    this.location,
    this.price,
    this.quantity,
    this.collectionTimeStart,
    this.collectionTimeEnd,
    this.description,
    this.businessName,
    this.imagePath,
    this.listingUid,
    this.streetAddress,
    this.isOrder,
    this.orderNumber,
    this.purchaseTime,
    this.businessId,
    this.listingRef,
    this.userName,
    this.originalValue,
    this.category,
  });

  final String? title;
  final LatLng? location;
  final double? price;
  final int? quantity;
  final DateTime? collectionTimeStart;
  final DateTime? collectionTimeEnd;
  final String? description;
  final String? businessName;
  final String? imagePath;
  final String? listingUid;
  final String? streetAddress;
  final bool? isOrder;
  final String? orderNumber;
  final DateTime? purchaseTime;
  final String? businessId;
  final DocumentReference? listingRef;
  final String? userName;
  final double? originalValue;
  final String? category;

  @override
  _ListingViewWidgetState createState() => _ListingViewWidgetState();
}

class _ListingViewWidgetState extends State<ListingViewWidget> {
  late ListingViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListingViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ListingView'});
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 325.0, 24.0, 65.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 0.8,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.businessName,
                                    'Unknown',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 0.8,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LISTING_VIEW_PAGE_Text_ypdlcvg4_ON_TAP');
                                    if (isAndroid) {
                                      await launchMap(
                                        mapType: $ml.MapType.google,
                                        address: widget.streetAddress,
                                        title: widget.streetAddress!,
                                      );
                                    } else {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: const Color(0x00000000),
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: const OpenMapsWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    }
                                  },
                                  child: Text(
                                    widget.streetAddress!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!widget.isOrder!)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: FutureBuilder<List<UsersRecord>>(
                              future: queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'uid',
                                  isEqualTo: widget.businessId,
                                ),
                                singleRecord: true,
                              ),
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
                                List<UsersRecord> ratingBarUsersRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final ratingBarUsersRecord =
                                    ratingBarUsersRecordList.isNotEmpty
                                        ? ratingBarUsersRecordList.first
                                        : null;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        spacing: 12.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFFA130),
                                            ),
                                            direction: Axis.horizontal,
                                            rating:
                                                ratingBarUsersRecord!.rating,
                                            unratedColor: const Color(0xFF95A1AC),
                                            itemCount: 5,
                                            itemSize: 24.0,
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Text(
                                              '${ratingBarUsersRecord.numberOfRatings.toString()} Reviews',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if ((loggedIn
                                ? ((valueOrDefault(
                                            currentUserDocument?.aBNNumber,
                                            0) ==
                                        null) ||
                                    (valueOrDefault(
                                            currentUserDocument?.aBNNumber,
                                            0) ==
                                        0))
                                : false) &&
                            widget.isOrder!)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Wrap(
                                      spacing: 12.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        FutureBuilder<List<UsersRecord>>(
                                          future: queryUsersRecordOnce(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'uid',
                                              isEqualTo: widget.businessId,
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                ratingBarInteractiveUsersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final ratingBarInteractiveUsersRecord =
                                                ratingBarInteractiveUsersRecordList
                                                        .isNotEmpty
                                                    ? ratingBarInteractiveUsersRecordList
                                                        .first
                                                    : null;
                                            return RatingBar.builder(
                                              onRatingUpdate: (newValue) async {
                                                setState(() => _model
                                                        .ratingBarInteractiveValue =
                                                    newValue);
                                                logFirebaseEvent(
                                                    'LISTING_VIEW_RatingBarInteractive_ON_TAP');

                                                await ratingBarInteractiveUsersRecord!
                                                    .reference
                                                    .update({
                                                  ...createUsersRecordData(
                                                    rating: _model
                                                        .ratingBarInteractiveValue,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'number_of_ratings':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                              },
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star_rounded,
                                                color: Color(0xFFFFA130),
                                              ),
                                              direction: Axis.horizontal,
                                              initialRating: _model
                                                      .ratingBarInteractiveValue ??=
                                                  0.0,
                                              unratedColor: const Color(0xFF95A1AC),
                                              itemCount: 5,
                                              itemSize: 24.0,
                                              glowColor: const Color(0xFFFFA130),
                                            );
                                          },
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Text(
                                            (_model.ratingBarInteractiveValue !=
                                                        null) &&
                                                    (_model.ratingBarInteractiveValue !=
                                                        0.0)
                                                ? 'Thank you for your feedback!'
                                                : 'How was your order?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    spacing: 10.0,
                                    runSpacing: 5.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        constraints: const BoxConstraints(
                                          maxWidth: 50.0,
                                          maxHeight: 50.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF1F4F8),
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Icon(
                                                Icons.access_time_rounded,
                                                color: Color(0xFF57636C),
                                                size: 20.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      AutoSizeText(
                                        valueOrDefault<String>(
                                          () {
                                            if (widget.isOrder!) {
                                              return '${valueOrDefault<String>(
                                                widget.quantity?.toString(),
                                                '0',
                                              )} snacks purchased';
                                            } else if (widget.quantity == 0) {
                                              return 'Sold out';
                                            } else if (widget
                                                    .collectionTimeEnd! <=
                                                getCurrentTimestamp) {
                                              return 'Sold out';
                                            } else {
                                              return '${valueOrDefault<String>(
                                                widget.quantity?.toString(),
                                                '0',
                                              )} Available';
                                            }
                                          }(),
                                          'No snacks found',
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style:
                                            FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: valueOrDefault<Color>(
                                                    widget.isOrder!
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : valueOrDefault<Color>(
                                                            () {
                                                              if (widget
                                                                      .collectionTimeEnd! <=
                                                                  getCurrentTimestamp) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText;
                                                              } else if (widget
                                                                      .quantity ==
                                                                  0) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText;
                                                              } else if (widget
                                                                      .quantity! >=
                                                                  4) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if (widget
                                                                      .quantity! >=
                                                                  3) {
                                                                return const Color(
                                                                    0xFFFFE200);
                                                              } else if (widget
                                                                      .quantity! <=
                                                                  2) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Text(
                                          '${dateTimeFormat(
                                            'd/M h:mm a',
                                            widget.collectionTimeStart,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )} - ${dateTimeFormat(
                                            'jm',
                                            widget.collectionTimeEnd,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (widget.isOrder ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.userAlt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gfx15s2c' /* Purchased by:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.userName,
                                            'Unknown',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.isOrder ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.shopping_cart_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ik12cyxt' /* Purchase time:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              'd/M h:mm a',
                                              widget.purchaseTime,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            'Purchase time not found',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.isOrder ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.hashtag,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ca90e5kf' /* Order Number:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.orderNumber,
                                            'Order number not found',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.isOrder ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: Icon(
                                                  FFIcons
                                                      .kquantityFlaticonFilled,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'q80d7dau' /* Quantity: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.quantity?.toString(),
                                            'Quantity not found',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (widget.isOrder ?? true)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .fileInvoiceDollar,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2fbx0y41' /* Order Total: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            widget.price?.toString(),
                                            'Order total not found',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                      ),
                                      child: Text(
                                        widget.title!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    AutoSizeText(
                                      '\$ ${widget.price?.toString()}',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: AutoSizeText(
                                      FFLocalizations.of(context).getText(
                                        '5yfyh31x' /* Valued at: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .grayText,
                                          ),
                                    ),
                                  ),
                                  AutoSizeText(
                                    '\$ ${valueOrDefault<String>(
                                      widget.originalValue?.toString(),
                                      '20',
                                    )}',
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .grayText,
                                          fontSize: 14.0,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 24.0),
                                  child: Text(
                                    widget.description!,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  if (loggedIn ? (widget.businessId == currentUserUid) : false)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (widget.collectionTimeEnd! >=
                                getCurrentTimestamp)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 12.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.45,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x55000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LISTING_VIEW_ButtonUpdateListing_ON_TAP');
                                              if (loggedIn) {
                                                if (widget.businessId ==
                                                    currentUserUid) {
                                                  context.pushNamed(
                                                    'UpdateListingView',
                                                    queryParameters: {
                                                      'title': serializeParam(
                                                        widget.title,
                                                        ParamType.String,
                                                      ),
                                                      'description':
                                                          serializeParam(
                                                        widget.description,
                                                        ParamType.String,
                                                      ),
                                                      'quantity':
                                                          serializeParam(
                                                        widget.quantity,
                                                        ParamType.int,
                                                      ),
                                                      'price': serializeParam(
                                                        widget.price,
                                                        ParamType.double,
                                                      ),
                                                      'category':
                                                          serializeParam(
                                                        widget.category,
                                                        ParamType.String,
                                                      ),
                                                      'photoUrl':
                                                          serializeParam(
                                                        widget.imagePath,
                                                        ParamType.String,
                                                      ),
                                                      'collectionTimeStart':
                                                          serializeParam(
                                                        widget
                                                            .collectionTimeStart,
                                                        ParamType.DateTime,
                                                      ),
                                                      'collectionTimeEnd':
                                                          serializeParam(
                                                        widget
                                                            .collectionTimeEnd,
                                                        ParamType.DateTime,
                                                      ),
                                                      'listingReference':
                                                          serializeParam(
                                                        widget.listingRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'originalValue':
                                                          serializeParam(
                                                        widget.originalValue,
                                                        ParamType.double,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Unauthorised access'),
                                                        content: const Text(
                                                            'You are not authorised to delete this listing'),
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

                                                return;
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Login or create account'),
                                                      content: const Text(
                                                          'Please create a profile or Log in to purchase snacks'),
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

                                                context.pushNamed(
                                                    'AuthenticationView');

                                                if (loggedIn) {
                                                  context.pushNamed(
                                                    'ListingView',
                                                    queryParameters: {
                                                      'title': serializeParam(
                                                        widget.title,
                                                        ParamType.String,
                                                      ),
                                                      'location':
                                                          serializeParam(
                                                        widget.location,
                                                        ParamType.LatLng,
                                                      ),
                                                      'price': serializeParam(
                                                        widget.price,
                                                        ParamType.double,
                                                      ),
                                                      'quantity':
                                                          serializeParam(
                                                        widget.quantity,
                                                        ParamType.int,
                                                      ),
                                                      'collectionTimeStart':
                                                          serializeParam(
                                                        widget
                                                            .collectionTimeStart,
                                                        ParamType.DateTime,
                                                      ),
                                                      'collectionTimeEnd':
                                                          serializeParam(
                                                        widget
                                                            .collectionTimeEnd,
                                                        ParamType.DateTime,
                                                      ),
                                                      'description':
                                                          serializeParam(
                                                        widget.description,
                                                        ParamType.String,
                                                      ),
                                                      'businessName':
                                                          serializeParam(
                                                        widget.businessName,
                                                        ParamType.String,
                                                      ),
                                                      'imagePath':
                                                          serializeParam(
                                                        widget.imagePath,
                                                        ParamType.String,
                                                      ),
                                                      'listingUid':
                                                          serializeParam(
                                                        widget.listingUid,
                                                        ParamType.String,
                                                      ),
                                                      'streetAddress':
                                                          serializeParam(
                                                        widget.streetAddress,
                                                        ParamType.String,
                                                      ),
                                                      'isOrder': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                      'orderNumber':
                                                          serializeParam(
                                                        '0',
                                                        ParamType.String,
                                                      ),
                                                      'purchaseTime':
                                                          serializeParam(
                                                        widget.purchaseTime,
                                                        ParamType.DateTime,
                                                      ),
                                                      'businessId':
                                                          serializeParam(
                                                        widget.businessId,
                                                        ParamType.String,
                                                      ),
                                                      'listingRef':
                                                          serializeParam(
                                                        widget.listingRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  if (widget.businessId ==
                                                      currentUserUid) {
                                                    context.pushNamed(
                                                      'UpdateListingView',
                                                      queryParameters: {
                                                        'title': serializeParam(
                                                          widget.title,
                                                          ParamType.String,
                                                        ),
                                                        'description':
                                                            serializeParam(
                                                          widget.description,
                                                          ParamType.String,
                                                        ),
                                                        'quantity':
                                                            serializeParam(
                                                          widget.quantity,
                                                          ParamType.int,
                                                        ),
                                                        'price': serializeParam(
                                                          widget.price,
                                                          ParamType.double,
                                                        ),
                                                        'category':
                                                            serializeParam(
                                                          widget.category,
                                                          ParamType.String,
                                                        ),
                                                        'photoUrl':
                                                            serializeParam(
                                                          widget.imagePath,
                                                          ParamType.String,
                                                        ),
                                                        'collectionTimeStart':
                                                            serializeParam(
                                                          widget
                                                              .collectionTimeStart,
                                                          ParamType.DateTime,
                                                        ),
                                                        'collectionTimeEnd':
                                                            serializeParam(
                                                          widget
                                                              .collectionTimeEnd,
                                                          ParamType.DateTime,
                                                        ),
                                                        'listingReference':
                                                            serializeParam(
                                                          widget.listingRef,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'originalValue':
                                                            serializeParam(
                                                          widget.originalValue,
                                                          ParamType.double,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Unauthorised access'),
                                                          content: const Text(
                                                              'You are not authorised to delete this listing'),
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

                                                  return;
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Login or create account'),
                                                        content: const Text(
                                                            'Please create a profile or Log in to purchase snacks'),
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

                                                  context.pushNamed(
                                                    'ListingView',
                                                    queryParameters: {
                                                      'title': serializeParam(
                                                        widget.title,
                                                        ParamType.String,
                                                      ),
                                                      'location':
                                                          serializeParam(
                                                        widget.location,
                                                        ParamType.LatLng,
                                                      ),
                                                      'price': serializeParam(
                                                        widget.price,
                                                        ParamType.double,
                                                      ),
                                                      'quantity':
                                                          serializeParam(
                                                        widget.quantity,
                                                        ParamType.int,
                                                      ),
                                                      'collectionTimeStart':
                                                          serializeParam(
                                                        widget
                                                            .collectionTimeStart,
                                                        ParamType.DateTime,
                                                      ),
                                                      'collectionTimeEnd':
                                                          serializeParam(
                                                        widget
                                                            .collectionTimeEnd,
                                                        ParamType.DateTime,
                                                      ),
                                                      'description':
                                                          serializeParam(
                                                        widget.description,
                                                        ParamType.String,
                                                      ),
                                                      'businessName':
                                                          serializeParam(
                                                        widget.businessName,
                                                        ParamType.String,
                                                      ),
                                                      'imagePath':
                                                          serializeParam(
                                                        widget.imagePath,
                                                        ParamType.String,
                                                      ),
                                                      'listingUid':
                                                          serializeParam(
                                                        widget.listingUid,
                                                        ParamType.String,
                                                      ),
                                                      'streetAddress':
                                                          serializeParam(
                                                        widget.streetAddress,
                                                        ParamType.String,
                                                      ),
                                                      'isOrder': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                      'orderNumber':
                                                          serializeParam(
                                                        '0',
                                                        ParamType.String,
                                                      ),
                                                      'purchaseTime':
                                                          serializeParam(
                                                        widget.purchaseTime,
                                                        ParamType.DateTime,
                                                      ),
                                                      'businessId':
                                                          serializeParam(
                                                        widget.businessId,
                                                        ParamType.String,
                                                      ),
                                                      'listingRef':
                                                          serializeParam(
                                                        widget.listingRef,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  return;
                                                }
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'xzt3boze' /* Update Listing */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130.0,
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Container(
                                  width: valueOrDefault<double>(
                                    (widget.collectionTimeEnd! >=
                                                getCurrentTimestamp
                                            ? 45
                                            : 90)
                                        .toDouble(),
                                    45.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x55000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'LISTING_VIEW_ButtonDeleteListing_ON_TAP');
                                            if (loggedIn) {
                                              if (widget.businessId ==
                                                  currentUserUid) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      const Color(0x00000000),
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            DeleteListingVerificationWidget(
                                                          listingRef:
                                                              widget.listingRef,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Unauthorised access'),
                                                      content: const Text(
                                                          'You are not authorised to delete this listing'),
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

                                              return;
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Login or create account'),
                                                    content: const Text(
                                                        'Please create a profile or Log in to purchase snacks'),
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

                                              context.pushNamed(
                                                  'AuthenticationView');

                                              if (loggedIn) {
                                                context.pushNamed(
                                                  'ListingView',
                                                  queryParameters: {
                                                    'title': serializeParam(
                                                      widget.title,
                                                      ParamType.String,
                                                    ),
                                                    'location': serializeParam(
                                                      widget.location,
                                                      ParamType.LatLng,
                                                    ),
                                                    'price': serializeParam(
                                                      widget.price,
                                                      ParamType.double,
                                                    ),
                                                    'quantity': serializeParam(
                                                      widget.quantity,
                                                      ParamType.int,
                                                    ),
                                                    'collectionTimeStart':
                                                        serializeParam(
                                                      widget
                                                          .collectionTimeStart,
                                                      ParamType.DateTime,
                                                    ),
                                                    'collectionTimeEnd':
                                                        serializeParam(
                                                      widget.collectionTimeEnd,
                                                      ParamType.DateTime,
                                                    ),
                                                    'description':
                                                        serializeParam(
                                                      widget.description,
                                                      ParamType.String,
                                                    ),
                                                    'businessName':
                                                        serializeParam(
                                                      widget.businessName,
                                                      ParamType.String,
                                                    ),
                                                    'imagePath': serializeParam(
                                                      widget.imagePath,
                                                      ParamType.String,
                                                    ),
                                                    'listingUid':
                                                        serializeParam(
                                                      widget.listingUid,
                                                      ParamType.String,
                                                    ),
                                                    'streetAddress':
                                                        serializeParam(
                                                      widget.streetAddress,
                                                      ParamType.String,
                                                    ),
                                                    'isOrder': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'orderNumber':
                                                        serializeParam(
                                                      '0',
                                                      ParamType.String,
                                                    ),
                                                    'purchaseTime':
                                                        serializeParam(
                                                      widget.purchaseTime,
                                                      ParamType.DateTime,
                                                    ),
                                                    'businessId':
                                                        serializeParam(
                                                      widget.businessId,
                                                      ParamType.String,
                                                    ),
                                                    'listingRef':
                                                        serializeParam(
                                                      widget.listingRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (widget.businessId ==
                                                    currentUserUid) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        const Color(0x00000000),
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              DeleteListingVerificationWidget(
                                                            listingRef: widget
                                                                .listingRef,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Unauthorised access'),
                                                        content: const Text(
                                                            'You are not authorised to delete this listing'),
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

                                                return;
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Login or create account'),
                                                      content: const Text(
                                                          'Please create a profile or Log in to purchase snacks'),
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

                                                context.pushNamed(
                                                  'ListingView',
                                                  queryParameters: {
                                                    'title': serializeParam(
                                                      widget.title,
                                                      ParamType.String,
                                                    ),
                                                    'location': serializeParam(
                                                      widget.location,
                                                      ParamType.LatLng,
                                                    ),
                                                    'price': serializeParam(
                                                      widget.price,
                                                      ParamType.double,
                                                    ),
                                                    'quantity': serializeParam(
                                                      widget.quantity,
                                                      ParamType.int,
                                                    ),
                                                    'collectionTimeStart':
                                                        serializeParam(
                                                      widget
                                                          .collectionTimeStart,
                                                      ParamType.DateTime,
                                                    ),
                                                    'collectionTimeEnd':
                                                        serializeParam(
                                                      widget.collectionTimeEnd,
                                                      ParamType.DateTime,
                                                    ),
                                                    'description':
                                                        serializeParam(
                                                      widget.description,
                                                      ParamType.String,
                                                    ),
                                                    'businessName':
                                                        serializeParam(
                                                      widget.businessName,
                                                      ParamType.String,
                                                    ),
                                                    'imagePath': serializeParam(
                                                      widget.imagePath,
                                                      ParamType.String,
                                                    ),
                                                    'listingUid':
                                                        serializeParam(
                                                      widget.listingUid,
                                                      ParamType.String,
                                                    ),
                                                    'streetAddress':
                                                        serializeParam(
                                                      widget.streetAddress,
                                                      ParamType.String,
                                                    ),
                                                    'isOrder': serializeParam(
                                                      false,
                                                      ParamType.bool,
                                                    ),
                                                    'orderNumber':
                                                        serializeParam(
                                                      '0',
                                                      ParamType.String,
                                                    ),
                                                    'purchaseTime':
                                                        serializeParam(
                                                      widget.purchaseTime,
                                                      ParamType.DateTime,
                                                    ),
                                                    'businessId':
                                                        serializeParam(
                                                      widget.businessId,
                                                      ParamType.String,
                                                    ),
                                                    'listingRef':
                                                        serializeParam(
                                                      widget.listingRef,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                return;
                                              }
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7xmals27' /* Delete Listing */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (!widget.isOrder! &&
                      (loggedIn
                          ? ((widget.businessName != currentUserDisplayName) ||
                              (widget.streetAddress !=
                                  valueOrDefault(
                                      currentUserDocument?.streetAddress, '')))
                          : true))
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x55000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'LISTING_VIEW_PAGE_ButtonBuy_ON_TAP');
                                          if (loggedIn) {
                                            if ((widget.quantity! > 0) &&
                                                (widget.collectionTimeEnd! >=
                                                    getCurrentTimestamp)) {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor: const Color(0x00000000),
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          PayBottomSheetWidget(
                                                        price: widget.price,
                                                        businessName:
                                                            widget.businessName,
                                                        collectionTimeStart: widget
                                                            .collectionTimeStart,
                                                        collectionTimeEnd: widget
                                                            .collectionTimeEnd,
                                                        listingId:
                                                            widget.listingUid,
                                                        maxQuantity:
                                                            widget.quantity,
                                                        businessId:
                                                            widget.businessId,
                                                        listingRef:
                                                            widget.listingRef,
                                                        originalValue: widget
                                                            .originalValue,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Login or create account'),
                                                  content: const Text(
                                                      'Please create a profile or Log in to purchase snacks'),
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

                                            context.pushNamed(
                                                'AuthenticationView');

                                            if (loggedIn) {
                                              context.pushNamed(
                                                'ListingView',
                                                queryParameters: {
                                                  'title': serializeParam(
                                                    widget.title,
                                                    ParamType.String,
                                                  ),
                                                  'location': serializeParam(
                                                    widget.location,
                                                    ParamType.LatLng,
                                                  ),
                                                  'price': serializeParam(
                                                    widget.price,
                                                    ParamType.double,
                                                  ),
                                                  'quantity': serializeParam(
                                                    widget.quantity,
                                                    ParamType.int,
                                                  ),
                                                  'collectionTimeStart':
                                                      serializeParam(
                                                    widget.collectionTimeStart,
                                                    ParamType.DateTime,
                                                  ),
                                                  'collectionTimeEnd':
                                                      serializeParam(
                                                    widget.collectionTimeEnd,
                                                    ParamType.DateTime,
                                                  ),
                                                  'description': serializeParam(
                                                    widget.description,
                                                    ParamType.String,
                                                  ),
                                                  'businessName':
                                                      serializeParam(
                                                    widget.businessName,
                                                    ParamType.String,
                                                  ),
                                                  'imagePath': serializeParam(
                                                    widget.imagePath,
                                                    ParamType.String,
                                                  ),
                                                  'listingUid': serializeParam(
                                                    widget.listingUid,
                                                    ParamType.String,
                                                  ),
                                                  'streetAddress':
                                                      serializeParam(
                                                    widget.streetAddress,
                                                    ParamType.String,
                                                  ),
                                                  'isOrder': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                  'orderNumber': serializeParam(
                                                    '0',
                                                    ParamType.String,
                                                  ),
                                                  'purchaseTime':
                                                      serializeParam(
                                                    widget.purchaseTime,
                                                    ParamType.DateTime,
                                                  ),
                                                  'businessId': serializeParam(
                                                    widget.businessId,
                                                    ParamType.String,
                                                  ),
                                                  'listingRef': serializeParam(
                                                    widget.listingRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              if ((widget.quantity! > 0) &&
                                                  (widget.collectionTimeEnd! >=
                                                      getCurrentTimestamp)) {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      const Color(0x00000000),
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            PayBottomSheetWidget(
                                                          price: widget.price,
                                                          businessName: widget
                                                              .businessName,
                                                          collectionTimeStart:
                                                              widget
                                                                  .collectionTimeStart,
                                                          collectionTimeEnd: widget
                                                              .collectionTimeEnd,
                                                          listingId:
                                                              widget.listingUid,
                                                          maxQuantity:
                                                              widget.quantity,
                                                          businessId:
                                                              widget.businessId,
                                                          listingRef:
                                                              widget.listingRef,
                                                          originalValue: widget
                                                              .originalValue,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                return;
                                              } else {
                                                return;
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Login or create account'),
                                                    content: const Text(
                                                        'Please create a profile or Log in to purchase snacks'),
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

                                              context.pushNamed(
                                                'ListingView',
                                                queryParameters: {
                                                  'title': serializeParam(
                                                    widget.title,
                                                    ParamType.String,
                                                  ),
                                                  'location': serializeParam(
                                                    widget.location,
                                                    ParamType.LatLng,
                                                  ),
                                                  'price': serializeParam(
                                                    widget.price,
                                                    ParamType.double,
                                                  ),
                                                  'quantity': serializeParam(
                                                    widget.quantity,
                                                    ParamType.int,
                                                  ),
                                                  'collectionTimeStart':
                                                      serializeParam(
                                                    widget.collectionTimeStart,
                                                    ParamType.DateTime,
                                                  ),
                                                  'collectionTimeEnd':
                                                      serializeParam(
                                                    widget.collectionTimeEnd,
                                                    ParamType.DateTime,
                                                  ),
                                                  'description': serializeParam(
                                                    widget.description,
                                                    ParamType.String,
                                                  ),
                                                  'businessName':
                                                      serializeParam(
                                                    widget.businessName,
                                                    ParamType.String,
                                                  ),
                                                  'imagePath': serializeParam(
                                                    widget.imagePath,
                                                    ParamType.String,
                                                  ),
                                                  'listingUid': serializeParam(
                                                    widget.listingUid,
                                                    ParamType.String,
                                                  ),
                                                  'streetAddress':
                                                      serializeParam(
                                                    widget.streetAddress,
                                                    ParamType.String,
                                                  ),
                                                  'isOrder': serializeParam(
                                                    false,
                                                    ParamType.bool,
                                                  ),
                                                  'orderNumber': serializeParam(
                                                    '0',
                                                    ParamType.String,
                                                  ),
                                                  'purchaseTime':
                                                      serializeParam(
                                                    widget.purchaseTime,
                                                    ParamType.DateTime,
                                                  ),
                                                  'businessId': serializeParam(
                                                    widget.businessId,
                                                    ParamType.String,
                                                  ),
                                                  'listingRef': serializeParam(
                                                    widget.listingRef,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              return;
                                            }
                                          }
                                        },
                                        text: () {
                                          if ((widget.quantity! > 0) &&
                                              (widget.collectionTimeEnd! >=
                                                  getCurrentTimestamp)) {
                                            return 'Buy  Now';
                                          } else if ((widget.quantity! > 0) &&
                                              (widget.collectionTimeEnd! <=
                                                  getCurrentTimestamp)) {
                                            return 'Listing Expired';
                                          } else {
                                            return 'Sold Out';
                                          }
                                        }(),
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: valueOrDefault<Color>(
                                            () {
                                              if ((widget.quantity! > 0) &&
                                                  (widget.collectionTimeEnd! >=
                                                      getCurrentTimestamp)) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondary;
                                              } else if ((widget.quantity! >
                                                      0) &&
                                                  (widget.collectionTimeEnd! <=
                                                      getCurrentTimestamp)) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              }
                                            }(),
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 320.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBE2E7),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              widget.imagePath!,
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: const Color(0x3A000000),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 46.0,
                                      icon: const Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'LISTING_VIEW_arrow_back_rounded_ICN_ON_T');
                                        context.pop();
                                      },
                                    ),
                                  ),
                                  if (loggedIn)
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: const Color(0x3A000000),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            currentUserReference!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final stackUsersRecord =
                                              snapshot.data!;
                                          return Stack(
                                            children: [
                                              if (() {
                                                if (loggedIn) {
                                                  return !stackUsersRecord
                                                      .likedListingUids
                                                      .contains(
                                                          widget.listingUid);
                                                } else if (!loggedIn) {
                                                  return true;
                                                } else {
                                                  return false;
                                                }
                                              }())
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 46.0,
                                                  icon: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LISTING_VIEW_favorite_border_ICN_ON_TAP');
                                                    if (loggedIn) {
                                                      if (!(currentUserDocument
                                                                  ?.likedListingUids
                                                                  .toList() ??
                                                              [])
                                                          .contains(widget
                                                              .listingUid)) {
                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'liked_listing_uids':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                widget
                                                                    .listingUid
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Login or Sign up'),
                                                            content: const Text(
                                                                'Login or sign up to start saving your favourite snacks'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('OK'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                              if (loggedIn
                                                  ? stackUsersRecord
                                                      .likedListingUids
                                                      .contains(
                                                          widget.listingUid)
                                                  : false)
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 46.0,
                                                  icon: const Icon(
                                                    Icons.favorite_outlined,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'LISTING_VIEW_favorite_outlined_ICN_ON_TA');
                                                    if (loggedIn) {
                                                      if ((currentUserDocument
                                                                  ?.likedListingUids
                                                                  .toList() ??
                                                              [])
                                                          .contains(widget
                                                              .listingUid)) {
                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'liked_listing_uids':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget
                                                                    .listingUid
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Login or Sign up'),
                                                            content: const Text(
                                                                'Login or sign up to start saving your favourite snacks'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('OK'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
