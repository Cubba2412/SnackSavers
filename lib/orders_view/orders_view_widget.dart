import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/listing_card_widget.dart';
import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'orders_view_model.dart';
export 'orders_view_model.dart';

class OrdersViewWidget extends StatefulWidget {
  const OrdersViewWidget({super.key});

  @override
  _OrdersViewWidgetState createState() => _OrdersViewWidgetState();
}

class _OrdersViewWidgetState extends State<OrdersViewWidget> {
  late OrdersViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdersViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'OrdersView'});
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'ORDERS_VIEW_PAGE_arrow_back_ICN_ON_TAP');
                          context.pop();
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'mdsndvqo' /* Your Orders */,
                        ),
                        style: FlutterFlowTheme.of(context).displaySmall,
                      ),
                      if (FFAppState().futureRelease)
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.tune_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                    ],
                  ),
                ),
                if (loggedIn)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 75.0, 8.0, 0.0),
                    child: FutureBuilder<List<OrdersRecord>>(
                      future: (_model.firestoreRequestCompleter ??= Completer<
                              List<OrdersRecord>>()
                            ..complete(queryOrdersRecordOnce(
                              queryBuilder: (ordersRecord) => ordersRecord
                                  .where(
                                    'user_id',
                                    isEqualTo: currentUserUid,
                                  )
                                  .orderBy('purchase_time', descending: true),
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
                        List<OrdersRecord> orderColumnOrdersRecordList =
                            snapshot.data!;
                        if (orderColumnOrdersRecordList.isEmpty) {
                          return const NoDataFoundWidget(
                            businessUser: false,
                            favouriteView: false,
                            orderView: true,
                            filter: false,
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            logFirebaseEvent(
                                'ORDERS_VIEW_OrderColumn_ON_PULL_TO_REFRE');
                            setState(
                                () => _model.firestoreRequestCompleter = null);
                            await _model.waitForFirestoreRequestCompleted();
                          },
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(
                                  orderColumnOrdersRecordList.length,
                                  (orderColumnIndex) {
                                final orderColumnOrdersRecord =
                                    orderColumnOrdersRecordList[
                                        orderColumnIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: StreamBuilder<List<ListingsRecord>>(
                                    stream: queryListingsRecord(
                                      queryBuilder: (listingsRecord) =>
                                          listingsRecord.where(
                                        'listing_uid',
                                        isEqualTo:
                                            orderColumnOrdersRecord.listingUid,
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
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<ListingsRecord>
                                          listingCardListingsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final listingCardListingsRecord =
                                          listingCardListingsRecordList
                                                  .isNotEmpty
                                              ? listingCardListingsRecordList
                                                  .first
                                              : null;
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'ORDERS_VIEW_Container_qqcb8qiq_ON_TAP');

                                          context.pushNamed(
                                            'ListingView',
                                            queryParameters: {
                                              'title': serializeParam(
                                                valueOrDefault<String>(
                                                  listingCardListingsRecord
                                                      ?.title,
                                                  'Title not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'location': serializeParam(
                                                listingCardListingsRecord
                                                    ?.location,
                                                ParamType.LatLng,
                                              ),
                                              'price': serializeParam(
                                                valueOrDefault<double>(
                                                  orderColumnOrdersRecord.price,
                                                  0.0,
                                                ),
                                                ParamType.double,
                                              ),
                                              'quantity': serializeParam(
                                                valueOrDefault<int>(
                                                  orderColumnOrdersRecord
                                                      .quantity,
                                                  0,
                                                ),
                                                ParamType.int,
                                              ),
                                              'collectionTimeStart':
                                                  serializeParam(
                                                orderColumnOrdersRecord
                                                    .collectionStartTime,
                                                ParamType.DateTime,
                                              ),
                                              'collectionTimeEnd':
                                                  serializeParam(
                                                orderColumnOrdersRecord
                                                    .collectionEndTime,
                                                ParamType.DateTime,
                                              ),
                                              'description': serializeParam(
                                                valueOrDefault<String>(
                                                  listingCardListingsRecord
                                                      ?.description,
                                                  'Description not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'businessName': serializeParam(
                                                valueOrDefault<String>(
                                                  orderColumnOrdersRecord
                                                      .businessName,
                                                  'Business name not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'imagePath': serializeParam(
                                                valueOrDefault<String>(
                                                  listingCardListingsRecord
                                                      ?.photoUrl,
                                                  'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                                ),
                                                ParamType.String,
                                              ),
                                              'listingUid': serializeParam(
                                                valueOrDefault<String>(
                                                  orderColumnOrdersRecord
                                                      .listingUid,
                                                  'Listing id not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'streetAddress': serializeParam(
                                                valueOrDefault<String>(
                                                  listingCardListingsRecord
                                                      ?.streetAddress,
                                                  'Address not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'isOrder': serializeParam(
                                                true,
                                                ParamType.bool,
                                              ),
                                              'orderNumber': serializeParam(
                                                valueOrDefault<String>(
                                                  orderColumnOrdersRecord
                                                      .orderId,
                                                  'Order id not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'purchaseTime': serializeParam(
                                                orderColumnOrdersRecord
                                                    .purchaseTime,
                                                ParamType.DateTime,
                                              ),
                                              'businessId': serializeParam(
                                                valueOrDefault<String>(
                                                  orderColumnOrdersRecord
                                                      .businessId,
                                                  'Business id not found',
                                                ),
                                                ParamType.String,
                                              ),
                                              'listingRef': serializeParam(
                                                listingCardListingsRecord
                                                    ?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'userName': serializeParam(
                                                orderColumnOrdersRecord
                                                    .userName,
                                                ParamType.String,
                                              ),
                                              'originalValue': serializeParam(
                                                orderColumnOrdersRecord
                                                    .totalOriginalValue,
                                                ParamType.double,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: ListingCardWidget(
                                          key: Key(
                                              'Keyqqc_${orderColumnIndex}_of_${orderColumnOrdersRecordList.length}'),
                                          postTitle: valueOrDefault<String>(
                                            listingCardListingsRecord?.title,
                                            'Title not found',
                                          ),
                                          price: valueOrDefault<double>(
                                            orderColumnOrdersRecord.price,
                                            0.0,
                                          ),
                                          quantity: valueOrDefault<int>(
                                            orderColumnOrdersRecord.quantity,
                                            0,
                                          ),
                                          description: valueOrDefault<String>(
                                            listingCardListingsRecord
                                                ?.description,
                                            'Description not found',
                                          ),
                                          listingUid: valueOrDefault<String>(
                                            orderColumnOrdersRecord.listingUid,
                                            'Listing id not found',
                                          ),
                                          businessName: valueOrDefault<String>(
                                            orderColumnOrdersRecord
                                                .businessName,
                                            'Business name not found',
                                          ),
                                          streetAddress: valueOrDefault<String>(
                                            listingCardListingsRecord
                                                ?.streetAddress,
                                            'Address not found',
                                          ),
                                          photoURL: valueOrDefault<String>(
                                            listingCardListingsRecord?.photoUrl,
                                            'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                          ),
                                          isOrder: true,
                                          collectionTimeStart:
                                              orderColumnOrdersRecord
                                                  .collectionStartTime,
                                          collectionTimeEnd:
                                              orderColumnOrdersRecord
                                                  .collectionEndTime,
                                          location: listingCardListingsRecord
                                              ?.location,
                                          userName:
                                              orderColumnOrdersRecord.userName,
                                          originalValue: orderColumnOrdersRecord
                                              .totalOriginalValue,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (!loggedIn)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 75.0, 8.0, 100.0),
                    child: wrapWithModel(
                      model: _model.noDataFoundModel,
                      updateCallback: () => setState(() {}),
                      child: const NoDataFoundWidget(
                        filter: false,
                        businessUser: false,
                        favouriteView: false,
                        orderView: false,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
