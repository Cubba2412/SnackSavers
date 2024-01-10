import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'map_marker_buttom_sheet_model.dart';
export 'map_marker_buttom_sheet_model.dart';

class MapMarkerButtomSheetWidget extends StatefulWidget {
  const MapMarkerButtomSheetWidget({
    super.key,
    this.details,
  });

  final ListingsRecord? details;

  @override
  _MapMarkerButtomSheetWidgetState createState() =>
      _MapMarkerButtomSheetWidgetState();
}

class _MapMarkerButtomSheetWidgetState
    extends State<MapMarkerButtomSheetWidget> {
  late MapMarkerButtomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapMarkerButtomSheetModel());
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'MAP_MARKER_BUTTOM_SHEET_Row_l3467s1j_ON_');

                    context.pushNamed(
                      'ListingView',
                      queryParameters: {
                        'title': serializeParam(
                          widget.details?.title,
                          ParamType.String,
                        ),
                        'location': serializeParam(
                          widget.details?.location,
                          ParamType.LatLng,
                        ),
                        'price': serializeParam(
                          widget.details?.price,
                          ParamType.double,
                        ),
                        'quantity': serializeParam(
                          widget.details?.quantity,
                          ParamType.int,
                        ),
                        'collectionTimeStart': serializeParam(
                          widget.details?.collectionTimeStart,
                          ParamType.DateTime,
                        ),
                        'collectionTimeEnd': serializeParam(
                          widget.details?.collectionTimeEnd,
                          ParamType.DateTime,
                        ),
                        'description': serializeParam(
                          widget.details?.description,
                          ParamType.String,
                        ),
                        'businessName': serializeParam(
                          widget.details?.businessName,
                          ParamType.String,
                        ),
                        'imagePath': serializeParam(
                          widget.details?.photoUrl,
                          ParamType.String,
                        ),
                        'listingUid': serializeParam(
                          widget.details?.listingUid,
                          ParamType.String,
                        ),
                        'streetAddress': serializeParam(
                          widget.details?.streetAddress,
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
                          widget.details?.businessUid,
                          ParamType.String,
                        ),
                        'listingRef': serializeParam(
                          widget.details?.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 11,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.details?.title,
                                    'Listing title not found',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  widget.details!.businessName,
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.details?.streetAddress,
                                    'Address not found',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleSmall,
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  valueOrDefault<String>(
                                    () {
                                      if (widget.details?.quantity == 0) {
                                        return 'Sold out';
                                      } else if (widget
                                              .details!.collectionTimeEnd! <=
                                          getCurrentTimestamp) {
                                        return 'Listing expired';
                                      } else {
                                        return valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            widget.details?.quantity
                                                .toString(),
                                            '0',
                                          )} Available',
                                          '0 Available',
                                        );
                                      }
                                    }(),
                                    'No snacks found',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (widget.details!
                                                    .collectionTimeEnd! <=
                                                getCurrentTimestamp) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryText;
                                            } else if (widget
                                                    .details?.quantity ==
                                                0) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryText;
                                            } else if (widget
                                                    .details!.quantity >=
                                                4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primary;
                                            } else if (widget
                                                    .details!.quantity >=
                                                3) {
                                              return const Color(0xFFFFE200);
                                            } else if (widget
                                                    .details!.quantity <=
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    widget.details?.photoUrl,
                                    'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84 ',
                                  ),
                                  fit: BoxFit.cover,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$ ${valueOrDefault<String>(
                                    widget.details?.price.toString(),
                                    '20',
                                  )}',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 50.0, 0.0),
                                  child: Text(
                                    '\$ ${widget.details?.originalValue.toString()}',
                                    textAlign: TextAlign.start,
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
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Icon(
                                      Icons.access_time_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: AutoSizeText(
                                      '${dateTimeFormat(
                                        'd/M h:mm a',
                                        widget.details?.collectionTimeStart,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} - ${dateTimeFormat(
                                        'jm',
                                        widget.details?.collectionTimeEnd,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      textAlign: TextAlign.end,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
