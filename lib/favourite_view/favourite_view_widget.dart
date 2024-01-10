import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/listing_card_widget.dart';
import '/components/nav_bar_floting_widget.dart';
import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'favourite_view_model.dart';
export 'favourite_view_model.dart';

class FavouriteViewWidget extends StatefulWidget {
  const FavouriteViewWidget({super.key});

  @override
  _FavouriteViewWidgetState createState() => _FavouriteViewWidgetState();
}

class _FavouriteViewWidgetState extends State<FavouriteViewWidget> {
  late FavouriteViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouriteViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FavouriteView'});
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'q81s4m6b' /* Favourite stores */,
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
                      const EdgeInsetsDirectional.fromSTEB(8.0, 75.0, 8.0, 100.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => StreamBuilder<List<ListingsRecord>>(
                      stream: queryListingsRecord(
                        queryBuilder: (listingsRecord) =>
                            listingsRecord.whereIn(
                                'listing_uid',
                                loggedIn
                                    ? (currentUserDocument?.likedListingUids
                                            .toList() ??
                                        [])
                                    : FFAppState().Categories),
                        limit: 20,
                      ),
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
                        List<ListingsRecord> favouriteColumnListingsRecordList =
                            snapshot.data!;
                        if (favouriteColumnListingsRecordList.isEmpty) {
                          return const NoDataFoundWidget(
                            businessUser: false,
                            favouriteView: true,
                            orderView: false,
                            filter: false,
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                                favouriteColumnListingsRecordList.length,
                                (favouriteColumnIndex) {
                              final favouriteColumnListingsRecord =
                                  favouriteColumnListingsRecordList[
                                      favouriteColumnIndex];
                              return Visibility(
                                visible: loggedIn
                                    ? (currentUserDocument?.likedListingUids
                                                .toList() ??
                                            [])
                                        .contains(favouriteColumnListingsRecord
                                            .listingUid)
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
                                          'FAVOURITE_VIEW_Container_rzaelms3_ON_TAP');

                                      context.pushNamed(
                                        'ListingView',
                                        queryParameters: {
                                          'title': serializeParam(
                                            valueOrDefault<String>(
                                              favouriteColumnListingsRecord
                                                  .title,
                                              'Title not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'location': serializeParam(
                                            favouriteColumnListingsRecord
                                                .location,
                                            ParamType.LatLng,
                                          ),
                                          'price': serializeParam(
                                            valueOrDefault<double>(
                                              favouriteColumnListingsRecord
                                                  .price,
                                              0.0,
                                            ),
                                            ParamType.double,
                                          ),
                                          'quantity': serializeParam(
                                            valueOrDefault<int>(
                                              favouriteColumnListingsRecord
                                                  .quantity,
                                              0,
                                            ),
                                            ParamType.int,
                                          ),
                                          'collectionTimeStart': serializeParam(
                                            favouriteColumnListingsRecord
                                                .collectionTimeStart,
                                            ParamType.DateTime,
                                          ),
                                          'collectionTimeEnd': serializeParam(
                                            favouriteColumnListingsRecord
                                                .collectionTimeEnd,
                                            ParamType.DateTime,
                                          ),
                                          'description': serializeParam(
                                            valueOrDefault<String>(
                                              favouriteColumnListingsRecord
                                                  .description,
                                              'Description not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'businessName': serializeParam(
                                            valueOrDefault<String>(
                                              favouriteColumnListingsRecord
                                                  .businessName,
                                              'Business name not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'imagePath': serializeParam(
                                            valueOrDefault<String>(
                                              favouriteColumnListingsRecord
                                                  .photoUrl,
                                              'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingUid': serializeParam(
                                            valueOrDefault<String>(
                                              favouriteColumnListingsRecord
                                                  .listingUid,
                                              'Listing id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'streetAddress': serializeParam(
                                            valueOrDefault<String>(
                                              favouriteColumnListingsRecord
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
                                              favouriteColumnListingsRecord
                                                  .businessUid,
                                              'Business id not found',
                                            ),
                                            ParamType.String,
                                          ),
                                          'listingRef': serializeParam(
                                            favouriteColumnListingsRecord
                                                .reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'userName': serializeParam(
                                            '',
                                            ParamType.String,
                                          ),
                                          'originalValue': serializeParam(
                                            favouriteColumnListingsRecord
                                                .originalValue,
                                            ParamType.double,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: ListingCardWidget(
                                      key: Key(
                                          'Keyrza_${favouriteColumnIndex}_of_${favouriteColumnListingsRecordList.length}'),
                                      postTitle: valueOrDefault<String>(
                                        favouriteColumnListingsRecord.title,
                                        'Title not found',
                                      ),
                                      price: valueOrDefault<double>(
                                        favouriteColumnListingsRecord.price,
                                        0.0,
                                      ),
                                      collectionTimeStart:
                                          favouriteColumnListingsRecord
                                              .collectionTimeStart,
                                      collectionTimeEnd:
                                          favouriteColumnListingsRecord
                                              .collectionTimeEnd,
                                      quantity: valueOrDefault<int>(
                                        favouriteColumnListingsRecord.quantity,
                                        0,
                                      ),
                                      businessName: valueOrDefault<String>(
                                        favouriteColumnListingsRecord
                                            .businessName,
                                        'Business name not found',
                                      ),
                                      description: valueOrDefault<String>(
                                        favouriteColumnListingsRecord
                                            .description,
                                        'Description not found',
                                      ),
                                      listingUid: valueOrDefault<String>(
                                        favouriteColumnListingsRecord
                                            .listingUid,
                                        'Listing id not found',
                                      ),
                                      streetAddress: valueOrDefault<String>(
                                        favouriteColumnListingsRecord
                                            .streetAddress,
                                        'Address not found',
                                      ),
                                      location: favouriteColumnListingsRecord
                                          .location,
                                      photoURL: valueOrDefault<String>(
                                        favouriteColumnListingsRecord.photoUrl,
                                        'https://i.postimg.cc/P5NQGv0b/no-category.png',
                                      ),
                                      isOrder: false,
                                      userName: ' Unknown',
                                      originalValue:
                                          favouriteColumnListingsRecord
                                              .originalValue,
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
              if (() {
                if (!loggedIn) {
                  return true;
                } else if (loggedIn) {
                  return ((currentUserDocument?.likedListingUids.toList() ??
                              []).isEmpty);
                } else {
                  return false;
                }
              }())
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 75.0, 8.0, 100.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.noDataFoundModel,
                        updateCallback: () => setState(() {}),
                        child: const NoDataFoundWidget(
                          filter: false,
                          businessUser: false,
                          favouriteView: true,
                          orderView: false,
                        ),
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
