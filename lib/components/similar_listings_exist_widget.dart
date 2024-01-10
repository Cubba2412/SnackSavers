import '/backend/backend.dart';
import '/components/listing_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'similar_listings_exist_model.dart';
export 'similar_listings_exist_model.dart';

class SimilarListingsExistWidget extends StatefulWidget {
  const SimilarListingsExistWidget({
    super.key,
    this.previousListings,
  });

  final List<ListingsRecord>? previousListings;

  @override
  _SimilarListingsExistWidgetState createState() =>
      _SimilarListingsExistWidgetState();
}

class _SimilarListingsExistWidgetState
    extends State<SimilarListingsExistWidget> {
  late SimilarListingsExistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimilarListingsExistModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x32171717),
              offset: Offset(0.0, -4.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 60.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).lineColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 0.9,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'mkt519h0' /* You already have previous list... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ajmhgvz0' /* If you would like to reuse the... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  final previousListingsCol =
                      widget.previousListings?.toList() ?? [];
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(previousListingsCol.length,
                          (previousListingsColIndex) {
                        final previousListingsColItem =
                            previousListingsCol[previousListingsColIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SIMILAR_LISTINGS_EXIST_Container_qxvkgbv');

                                    context.pushNamed(
                                      'ReCreateListingView',
                                      queryParameters: {
                                        'title': serializeParam(
                                          previousListingsColItem.title,
                                          ParamType.String,
                                        ),
                                        'description': serializeParam(
                                          previousListingsColItem.description,
                                          ParamType.String,
                                        ),
                                        'quantity': serializeParam(
                                          previousListingsColItem.quantity,
                                          ParamType.int,
                                        ),
                                        'price': serializeParam(
                                          previousListingsColItem.price,
                                          ParamType.double,
                                        ),
                                        'category': serializeParam(
                                          previousListingsColItem.category,
                                          ParamType.String,
                                        ),
                                        'photoUrl': serializeParam(
                                          previousListingsColItem.photoUrl,
                                          ParamType.String,
                                        ),
                                        'collectionTimeStart': serializeParam(
                                          previousListingsColItem
                                              .collectionTimeStart,
                                          ParamType.DateTime,
                                        ),
                                        'collectionTimeEnd': serializeParam(
                                          previousListingsColItem
                                              .collectionTimeEnd,
                                          ParamType.DateTime,
                                        ),
                                        'originalValue': serializeParam(
                                          previousListingsColItem.originalValue,
                                          ParamType.double,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: ListingCardWidget(
                                    key: Key(
                                        'Keyqxv_${previousListingsColIndex}_of_${previousListingsCol.length}'),
                                    postTitle: previousListingsColItem.title,
                                    price: previousListingsColItem.price,
                                    quantity: previousListingsColItem.quantity,
                                    description:
                                        previousListingsColItem.description,
                                    listingUid:
                                        previousListingsColItem.listingUid,
                                    businessName:
                                        previousListingsColItem.businessName,
                                    streetAddress:
                                        previousListingsColItem.streetAddress,
                                    photoURL: previousListingsColItem.photoUrl,
                                    isOrder: false,
                                    userName: 'Unknown',
                                    collectionTimeStart: previousListingsColItem
                                        .collectionTimeStart,
                                    collectionTimeEnd: previousListingsColItem
                                        .collectionTimeEnd,
                                    location: previousListingsColItem.location,
                                    originalValue:
                                        previousListingsColItem.originalValue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
