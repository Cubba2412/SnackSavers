import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/listing_card_widget.dart';
import '/components/nav_bar_floting_widget.dart';
import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'list_view_model.dart';
export 'list_view_model.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  late ListViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ListView'});
    _model.searchFieldUserController ??= TextEditingController();
    _model.searchFieldUserFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (FFAppState().algoliaSearched ||
                  (FFAppState().algoliaSearched &&
                      (loggedIn
                          ? ((valueOrDefault(
                                      currentUserDocument?.aBNNumber, 0) ==
                                  null) ||
                              (valueOrDefault(
                                      currentUserDocument?.aBNNumber, 0) ==
                                  0))
                          : false)))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 125.0, 8.0, 100.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Builder(
                      builder: (context) {
                        if (_model.algoliaSearchResults == null) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final algoliaSearchResult =
                            _model.algoliaSearchResults?.toList() ?? [];
                        if (algoliaSearchResult.isEmpty) {
                          return NoDataFoundWidget(
                            businessUser: loggedIn
                                ? ((valueOrDefault(
                                            currentUserDocument?.aBNNumber,
                                            0) !=
                                        null) &&
                                    (valueOrDefault(
                                            currentUserDocument?.aBNNumber,
                                            0) !=
                                        0))
                                : false,
                            favouriteView: false,
                            orderView: false,
                            filter: true,
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(algoliaSearchResult.length,
                                (algoliaSearchResultIndex) {
                              final algoliaSearchResultItem =
                                  algoliaSearchResult[algoliaSearchResultIndex];
                              return Visibility(
                                visible: (algoliaSearchResultItem.reference !=
                                            null) &&
                                        FFAppState().algoliaSearched
                                    ? (algoliaSearchResultItem
                                            .collectionTimeStart! >=
                                        getCurrentTimestamp)
                                    : false,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_VIEW_PAGE_Container_jed097wr_ON_TAP');

                                      context.pushNamed(
                                        'ListingView',
                                        queryParameters: {
                                          'title': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem.title,
                                              'Title not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'location': serializeParam(
                                            algoliaSearchResultItem.location,
                                            ParamType.LatLng,
                                          ),
                                          'price': serializeParam(
                                            valueOrDefault<double>(
                                              algoliaSearchResultItem.price,
                                              0.0,
                                            ),
                                            ParamType.double,
                                          ),
                                          'quantity': serializeParam(
                                            valueOrDefault<int>(
                                              algoliaSearchResultItem.quantity,
                                              0,
                                            ),
                                            ParamType.int,
                                          ),
                                          'collectionTimeStart': serializeParam(
                                            algoliaSearchResultItem
                                                .collectionTimeStart,
                                            ParamType.DateTime,
                                          ),
                                          'collectionTimeEnd': serializeParam(
                                            algoliaSearchResultItem
                                                .collectionTimeEnd,
                                            ParamType.DateTime,
                                          ),
                                          'description': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem
                                                  .description,
                                              'Description not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'businessName': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem
                                                  .businessName,
                                              'Business name not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'imagePath': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem.photoUrl,
                                              'https://i.postimg.cc/MqmPQyDL/no-category.png',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingUid': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem
                                                  .listingUid,
                                              'Listing id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'streetAddress': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem
                                                  .streetAddress,
                                              'Address not found',
                                            ),
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
                                          'purchaseTime': serializeParam(
                                            getCurrentTimestamp,
                                            ParamType.DateTime,
                                          ),
                                          'businessId': serializeParam(
                                            valueOrDefault<String>(
                                              algoliaSearchResultItem
                                                  .businessUid,
                                              'Business id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingRef': serializeParam(
                                            algoliaSearchResultItem.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userName': serializeParam(
                                            ' ',
                                            ParamType.String,
                                          ),
                                          'originalValue': serializeParam(
                                            algoliaSearchResultItem
                                                .originalValue,
                                            ParamType.double,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListingCardWidget(
                                      key: Key(
                                          'Keyjed_${algoliaSearchResultIndex}_of_${algoliaSearchResult.length}'),
                                      businessName: valueOrDefault<String>(
                                        algoliaSearchResultItem.businessName,
                                        'Business name not found',
                                      ),
                                      postTitle: valueOrDefault<String>(
                                        algoliaSearchResultItem.title,
                                        'Title not found',
                                      ),
                                      price: valueOrDefault<double>(
                                        algoliaSearchResultItem.price,
                                        0.0,
                                      ),
                                      collectionTimeStart:
                                          algoliaSearchResultItem
                                              .collectionTimeStart,
                                      collectionTimeEnd: algoliaSearchResultItem
                                          .collectionTimeEnd,
                                      quantity: valueOrDefault<int>(
                                        algoliaSearchResultItem.quantity,
                                        0,
                                      ),
                                      description: valueOrDefault<String>(
                                        algoliaSearchResultItem.description,
                                        'Description not found',
                                      ),
                                      listingUid: valueOrDefault<String>(
                                        algoliaSearchResultItem.listingUid,
                                        'Listing id not found',
                                      ),
                                      streetAddress: valueOrDefault<String>(
                                        algoliaSearchResultItem.streetAddress,
                                        'Address not found',
                                      ),
                                      location:
                                          algoliaSearchResultItem.location,
                                      photoURL: valueOrDefault<String>(
                                        algoliaSearchResultItem.photoUrl,
                                        'https://i.postimg.cc/MqmPQyDL/no-category.png',
                                      ),
                                      isOrder: false,
                                      userName: ' Unknown',
                                      originalValue:
                                          algoliaSearchResultItem.originalValue,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if ((!FFAppState().algoliaSearched && !loggedIn) ||
                  (!FFAppState().algoliaSearched &&
                      (loggedIn
                          ? ((valueOrDefault(
                                      currentUserDocument?.aBNNumber, 0) ==
                                  null) ||
                              (valueOrDefault(
                                      currentUserDocument?.aBNNumber, 0) ==
                                  0))
                          : false)) ||
                  (!FFAppState().algoliaSearched &&
                      (loggedIn
                          ? ((valueOrDefault(
                                      currentUserDocument?.aBNNumber, 0) !=
                                  null) &&
                              (valueOrDefault(
                                      currentUserDocument?.aBNNumber, 0) !=
                                  0) &&
                              !FFAppState().ShowBusinessColumn)
                          : false)))
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 125.0, 8.0, 100.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FutureBuilder<List<ListingsRecord>>(
                      future: (_model.firestoreRequestCompleter1 ??=
                              Completer<List<ListingsRecord>>()
                                ..complete(queryListingsRecordOnce(
                                  queryBuilder: (listingsRecord) =>
                                      listingsRecord
                                          .whereIn(
                                              'category',
                                              FFAppState().Categories != ''
                                                  ? FFAppState().Categories
                                                  : null)
                                          .orderBy('collection_time_start',
                                              descending: true),
                                  limit: 100,
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ListingsRecord> columnUserListingsRecordList =
                            snapshot.data!;
                        if (columnUserListingsRecordList.isEmpty) {
                          return NoDataFoundWidget(
                            businessUser: false,
                            favouriteView: false,
                            orderView: false,
                            filter: () {
                              if (FFAppState().algoliaSearched) {
                                return true;
                              } else if (FFAppState().categoryFilter) {
                                return true;
                              } else {
                                return false;
                              }
                            }(),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            logFirebaseEvent(
                                'LIST_VIEW_ColumnUser_ON_PULL_TO_REFRESH');
                            setState(
                                () => _model.firestoreRequestCompleter1 = null);
                            await _model.waitForFirestoreRequestCompleted1();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnUserListingsRecordList.length,
                                  (columnUserIndex) {
                                final columnUserListingsRecord =
                                    columnUserListingsRecordList[
                                        columnUserIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_VIEW_PAGE_Container_mqeq5nmy_ON_TAP');

                                      context.pushNamed(
                                        'ListingView',
                                        queryParameters: {
                                          'title': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord.title,
                                              'Title not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'location': serializeParam(
                                            columnUserListingsRecord.location,
                                            ParamType.LatLng,
                                          ),
                                          'price': serializeParam(
                                            valueOrDefault<double>(
                                              columnUserListingsRecord.price,
                                              0.0,
                                            ),
                                            ParamType.double,
                                          ),
                                          'quantity': serializeParam(
                                            valueOrDefault<int>(
                                              columnUserListingsRecord.quantity,
                                              0,
                                            ),
                                            ParamType.int,
                                          ),
                                          'collectionTimeStart': serializeParam(
                                            columnUserListingsRecord
                                                .collectionTimeStart,
                                            ParamType.DateTime,
                                          ),
                                          'collectionTimeEnd': serializeParam(
                                            columnUserListingsRecord
                                                .collectionTimeEnd,
                                            ParamType.DateTime,
                                          ),
                                          'description': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord
                                                  .description,
                                              'Description not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'businessName': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord
                                                  .businessName,
                                              'Business name not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'imagePath': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord.photoUrl,
                                              'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingUid': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord
                                                  .listingUid,
                                              'Listing id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'streetAddress': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord
                                                  .streetAddress,
                                              'Address not found',
                                            ),
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
                                          'purchaseTime': serializeParam(
                                            getCurrentTimestamp,
                                            ParamType.DateTime,
                                          ),
                                          'businessId': serializeParam(
                                            valueOrDefault<String>(
                                              columnUserListingsRecord
                                                  .businessUid,
                                              'Business id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingRef': serializeParam(
                                            columnUserListingsRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userName': serializeParam(
                                            ' ',
                                            ParamType.String,
                                          ),
                                          'originalValue': serializeParam(
                                            columnUserListingsRecord
                                                .originalValue,
                                            ParamType.double,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListingCardWidget(
                                      key: Key(
                                          'Keymqe_${columnUserIndex}_of_${columnUserListingsRecordList.length}'),
                                      businessName: valueOrDefault<String>(
                                        columnUserListingsRecord.businessName,
                                        'Business name not found',
                                      ),
                                      postTitle: valueOrDefault<String>(
                                        columnUserListingsRecord.title,
                                        'Title not found',
                                      ),
                                      price: valueOrDefault<double>(
                                        columnUserListingsRecord.price,
                                        0.0,
                                      ),
                                      collectionTimeStart:
                                          columnUserListingsRecord
                                              .collectionTimeStart,
                                      collectionTimeEnd:
                                          columnUserListingsRecord
                                              .collectionTimeEnd,
                                      quantity: valueOrDefault<int>(
                                        columnUserListingsRecord.quantity,
                                        0,
                                      ),
                                      description: valueOrDefault<String>(
                                        columnUserListingsRecord.description,
                                        'Description not found',
                                      ),
                                      listingUid: valueOrDefault<String>(
                                        columnUserListingsRecord.listingUid,
                                        'Listing id not found',
                                      ),
                                      streetAddress: valueOrDefault<String>(
                                        columnUserListingsRecord.streetAddress,
                                        'Address not found',
                                      ),
                                      location:
                                          columnUserListingsRecord.location,
                                      photoURL: valueOrDefault<String>(
                                        columnUserListingsRecord.photoUrl,
                                        'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                      ),
                                      isOrder: false,
                                      userName: ' Unknown',
                                      originalValue: columnUserListingsRecord
                                          .originalValue,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if ((loggedIn
                      ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                              null) &&
                          (valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                              0) &&
                          FFAppState().ShowBusinessColumn)
                      : false) &&
                  !FFAppState().algoliaSearched)
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 125.0, 8.0, 100.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FutureBuilder<List<ListingsRecord>>(
                      future: (_model.firestoreRequestCompleter2 ??=
                              Completer<List<ListingsRecord>>()
                                ..complete(queryListingsRecordOnce(
                                  queryBuilder: (listingsRecord) =>
                                      listingsRecord
                                          .where(
                                            'business_uid',
                                            isEqualTo: loggedIn
                                                ? currentUserUid
                                                : 'None' != ''
                                                    ? loggedIn
                                                        ? currentUserUid
                                                        : 'None'
                                                    : null,
                                          )
                                          .orderBy('collection_time_start',
                                              descending: true),
                                  limit: 20,
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ListingsRecord> columnBusinessListingsRecordList =
                            snapshot.data!;
                        if (columnBusinessListingsRecordList.isEmpty) {
                          return NoDataFoundWidget(
                            businessUser: loggedIn
                                ? ((valueOrDefault(
                                            currentUserDocument?.aBNNumber,
                                            0) !=
                                        null) &&
                                    (valueOrDefault(
                                            currentUserDocument?.aBNNumber,
                                            0) !=
                                        0))
                                : false,
                            favouriteView: false,
                            orderView: false,
                            filter: false,
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            logFirebaseEvent(
                                'LIST_VIEW_ColumnBusiness_ON_PULL_TO_REFR');
                            setState(
                                () => _model.firestoreRequestCompleter2 = null);
                            await _model.waitForFirestoreRequestCompleted2();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnBusinessListingsRecordList.length,
                                  (columnBusinessIndex) {
                                final columnBusinessListingsRecord =
                                    columnBusinessListingsRecordList[
                                        columnBusinessIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_VIEW_PAGE_Container_ll1ywa2i_ON_TAP');

                                      context.pushNamed(
                                        'ListingView',
                                        queryParameters: {
                                          'title': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .title,
                                              'Title not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'location': serializeParam(
                                            columnBusinessListingsRecord
                                                .location,
                                            ParamType.LatLng,
                                          ),
                                          'price': serializeParam(
                                            valueOrDefault<double>(
                                              columnBusinessListingsRecord
                                                  .price,
                                              0.0,
                                            ),
                                            ParamType.double,
                                          ),
                                          'quantity': serializeParam(
                                            valueOrDefault<int>(
                                              columnBusinessListingsRecord
                                                  .quantity,
                                              0,
                                            ),
                                            ParamType.int,
                                          ),
                                          'collectionTimeStart': serializeParam(
                                            columnBusinessListingsRecord
                                                .collectionTimeStart,
                                            ParamType.DateTime,
                                          ),
                                          'collectionTimeEnd': serializeParam(
                                            columnBusinessListingsRecord
                                                .collectionTimeEnd,
                                            ParamType.DateTime,
                                          ),
                                          'description': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .description,
                                              'Description not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'businessName': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .businessName,
                                              'Business name not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'imagePath': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .photoUrl,
                                              'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingUid': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .listingUid,
                                              'Listing id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'streetAddress': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .streetAddress,
                                              'Address not found',
                                            ),
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
                                          'purchaseTime': serializeParam(
                                            getCurrentTimestamp,
                                            ParamType.DateTime,
                                          ),
                                          'businessId': serializeParam(
                                            valueOrDefault<String>(
                                              columnBusinessListingsRecord
                                                  .businessUid,
                                              'Business id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingRef': serializeParam(
                                            columnBusinessListingsRecord
                                                .reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userName': serializeParam(
                                            ' ',
                                            ParamType.String,
                                          ),
                                          'originalValue': serializeParam(
                                            columnBusinessListingsRecord
                                                .originalValue,
                                            ParamType.double,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListingCardWidget(
                                      key: Key(
                                          'Keyll1_${columnBusinessIndex}_of_${columnBusinessListingsRecordList.length}'),
                                      businessName: valueOrDefault<String>(
                                        columnBusinessListingsRecord
                                            .businessName,
                                        'Business name not found',
                                      ),
                                      postTitle: valueOrDefault<String>(
                                        columnBusinessListingsRecord.title,
                                        'Title not found',
                                      ),
                                      price: valueOrDefault<double>(
                                        columnBusinessListingsRecord.price,
                                        0.0,
                                      ),
                                      collectionTimeStart:
                                          columnBusinessListingsRecord
                                              .collectionTimeStart,
                                      collectionTimeEnd:
                                          columnBusinessListingsRecord
                                              .collectionTimeEnd,
                                      quantity: valueOrDefault<int>(
                                        columnBusinessListingsRecord.quantity,
                                        0,
                                      ),
                                      description: valueOrDefault<String>(
                                        columnBusinessListingsRecord
                                            .description,
                                        'Description not found',
                                      ),
                                      listingUid: valueOrDefault<String>(
                                        columnBusinessListingsRecord.listingUid,
                                        'Listing id not found',
                                      ),
                                      streetAddress: valueOrDefault<String>(
                                        columnBusinessListingsRecord
                                            .streetAddress,
                                        'Address not found',
                                      ),
                                      location:
                                          columnBusinessListingsRecord.location,
                                      photoURL: valueOrDefault<String>(
                                        columnBusinessListingsRecord.photoUrl,
                                        'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                      ),
                                      isOrder: false,
                                      userName: ' Unknown',
                                      originalValue:
                                          columnBusinessListingsRecord
                                              .originalValue,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        );
                      },
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
              Stack(
                children: [
                  if (loggedIn
                      ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                              null) &&
                          (valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                              0))
                      : false)
                    AuthUserStreamWidget(
                      builder: (context) => Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 125.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (FFAppState().ShowBusinessColumn)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'fd1wp338' /* Your Listings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  if (loggedIn
                      ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) ==
                              null) ||
                          (valueOrDefault(currentUserDocument?.aBNNumber, 0) ==
                              0) ||
                          !FFAppState().ShowBusinessColumn)
                      : true)
                    AuthUserStreamWidget(
                      builder: (context) => Container(
                        width: double.infinity,
                        height: 120.0,
                        decoration: const BoxDecoration(),
                        child: SizedBox(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    26.0, 75.0, 26.0, 0.0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'n7ge3ut7' /* Bakery */,
                                              ),
                                              FFIcons.kbread),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gxvryn8x' /* Restaurant */,
                                              ),
                                              FFIcons.knounRestaurant),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'luih89km' /* Cafe */,
                                              ),
                                              FFIcons.kcoffee)
                                        ],
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.choiceChipsValues = val);
                                          logFirebaseEvent(
                                              'LIST_VIEW_ChoiceChips_ov4cy584_ON_FORM_W');
                                          if ((_model.choiceChipsValues
                                                      ?.length !=
                                                  null) &&
                                              (_model.choiceChipsValues!.isNotEmpty)) {
                                            FFAppState().update(() {
                                              FFAppState().categoryFilter =
                                                  true;
                                              FFAppState().Categories = [];
                                            });
                                            if (_model.choiceChipsValues!
                                                .contains(
                                                    FFAppState().Bakery)) {
                                              FFAppState().update(() {
                                                FFAppState().addToCategories(
                                                    FFAppState().Bakery);
                                              });
                                            } else {
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .removeFromCategories(
                                                        FFAppState().Bakery);
                                              });
                                            }

                                            if (_model.choiceChipsValues!
                                                .contains(
                                                    FFAppState().Restaurant)) {
                                              FFAppState().update(() {
                                                FFAppState().addToCategories(
                                                    FFAppState().Restaurant);
                                              });
                                            } else {
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .removeFromCategories(
                                                        FFAppState()
                                                            .Restaurant);
                                              });
                                            }

                                            if (_model.choiceChipsValues!
                                                .contains(FFAppState().Cafe)) {
                                              FFAppState().update(() {
                                                FFAppState().addToCategories(
                                                    FFAppState().Cafe);
                                              });
                                            } else {
                                              FFAppState().update(() {
                                                FFAppState()
                                                    .removeFromCategories(
                                                        FFAppState().Cafe);
                                              });
                                            }
                                          } else {
                                            FFAppState().update(() {
                                              FFAppState().Categories = [];
                                              FFAppState().addToCategories(
                                                  FFAppState().Cafe);
                                            });
                                            FFAppState().update(() {
                                              FFAppState().addToCategories(
                                                  FFAppState().Restaurant);
                                              FFAppState().addToCategories(
                                                  FFAppState().Bakery);
                                            });
                                            FFAppState().update(() {
                                              FFAppState().categoryFilter =
                                                  false;
                                            });
                                          }

                                          setState(() => _model
                                                  .firestoreRequestCompleter1 =
                                              null);
                                          await _model
                                              .waitForFirestoreRequestCompleted1();
                                        },
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          iconColor: Colors.white,
                                          iconSize: 22.0,
                                          labelPadding: const EdgeInsets.all(4.0),
                                          elevation: 4.0,
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                          iconColor: Colors.white,
                                          iconSize: 22.0,
                                          labelPadding: const EdgeInsets.all(4.0),
                                          elevation: 4.0,
                                        ),
                                        chipSpacing: 10.0,
                                        rowSpacing: 12.0,
                                        multiselect: true,
                                        initialized:
                                            _model.choiceChipsValues != null,
                                        alignment: WrapAlignment.spaceEvenly,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    25.0, 20.0, 25.0, 0.0),
                                child: Container(
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.95, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 50.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'LIST_VIEW_PAGE_clear_ICN_ON_TAP');
                                            setState(() {
                                              _model.searchFieldUserController
                                                  ?.clear();
                                            });
                                            FFAppState().update(() {
                                              FFAppState().algoliaSearched =
                                                  false;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 45.0, 0.0),
                                        child: TextFormField(
                                          controller:
                                              _model.searchFieldUserController,
                                          focusNode:
                                              _model.searchFieldUserFocusNode,
                                          onFieldSubmitted: (_) async {
                                            logFirebaseEvent(
                                                'LIST_VIEW_SearchFieldUser_ON_TEXTFIELD_S');
                                            safeSetState(() => _model
                                                .algoliaSearchResults = null);
                                            await ListingsRecord.search(
                                              term: _model
                                                  .searchFieldUserController
                                                  .text,
                                              maxResults: 100,
                                              useCache: true,
                                            )
                                                .then((r) => _model
                                                    .algoliaSearchResults = r)
                                                .onError((_, __) => _model
                                                    .algoliaSearchResults = [])
                                                .whenComplete(
                                                    () => setState(() {}));

                                            FFAppState().update(() {
                                              FFAppState().algoliaSearched =
                                                  true;
                                            });
                                          },
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'dn4aeljg' /* What would you like to save? */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 22.0,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          textAlign: TextAlign.start,
                                          validator: _model
                                              .searchFieldUserControllerValidator
                                              .asValidator(context),
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
                    ),
                ],
              ),
              if (loggedIn
                  ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                          null) &&
                      (valueOrDefault(currentUserDocument?.aBNNumber, 0) != 0))
                  : false)
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.7),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 1.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LIST_VIEW_PAGE_Container_bclrn1nr_ON_TAP');
                              FFAppState().update(() {
                                FFAppState().ShowBusinessColumn = true;
                              });
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Container(
                                height: 40.0,
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 0.35,
                                ),
                                decoration: BoxDecoration(
                                  color: FFAppState().ShowBusinessColumn
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(50.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(50.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'fcqynxjv' /* Your listings */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                          ),
                                    ),
                                  ),
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
                                  'LIST_VIEW_PAGE_Container_nx8qn68z_ON_TAP');
                              FFAppState().update(() {
                                FFAppState().ShowBusinessColumn = false;
                              });
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(50.0),
                                ),
                              ),
                              child: Container(
                                height: 40.0,
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 0.35,
                                ),
                                decoration: BoxDecoration(
                                  color: !FFAppState().ShowBusinessColumn
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(50.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(50.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 10.0, 5.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vesd9j7x' /* Other listings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .white,
                                          ),
                                    ),
                                  ),
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
    );
  }
}
