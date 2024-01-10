import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'listing_card_model.dart';
export 'listing_card_model.dart';

class ListingCardWidget extends StatefulWidget {
  const ListingCardWidget({
    super.key,
    this.postTitle,
    this.price,
    this.collectionTimeStart,
    this.collectionTimeEnd,
    this.quantity,
    this.description,
    this.listingUid,
    this.location,
    this.businessName,
    this.streetAddress,
    this.photoURL,
    this.isOrder,
    this.userName,
    this.originalValue,
  });

  final String? postTitle;
  final double? price;
  final DateTime? collectionTimeStart;
  final DateTime? collectionTimeEnd;
  final int? quantity;
  final String? description;
  final String? listingUid;
  final LatLng? location;
  final String? businessName;
  final String? streetAddress;
  final String? photoURL;
  final bool? isOrder;
  final String? userName;
  final double? originalValue;

  @override
  _ListingCardWidgetState createState() => _ListingCardWidgetState();
}

class _ListingCardWidgetState extends State<ListingCardWidget>
    with TickerProviderStateMixin {
  late ListingCardModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 70.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListingCardModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.22,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x2B202529),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 15.0, 0.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 300.0,
                              ),
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: AutoSizeText(
                                                widget.businessName!,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: AutoSizeText(
                                              widget.postTitle!,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                () {
                                                  if (widget.isOrder!) {
                                                    return '${valueOrDefault<String>(
                                                      widget.quantity
                                                          ?.toString(),
                                                      '0',
                                                    )} snacks purchased';
                                                  } else if (widget.quantity ==
                                                      0) {
                                                    return 'Sold out';
                                                  } else if (widget
                                                          .collectionTimeEnd! <=
                                                      getCurrentTimestamp) {
                                                    return 'Sold out';
                                                  } else {
                                                    return '${valueOrDefault<String>(
                                                      widget.quantity
                                                          ?.toString(),
                                                      '0',
                                                    )} Available';
                                                  }
                                                }(),
                                                'No snacks found',
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget.isOrder!
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : valueOrDefault<
                                                              Color>(
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(25.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget.photoURL,
                                        'https://img.freepik.com/free-photo/peas-plate_23-2148177805.jpg?w=2000&t=st=1664870975~exp=1664871575~hmac=0e658cdda6a5b44d6babc1964490a7ee9a18debd05af25200f6b1663b19d7f84 ',
                                      ),
                                      fit: BoxFit.contain,
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
                ),
              ),
              const StyledDivider(
                thickness: 0.0,
                lineStyle: DividerLineStyle.dotted,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 10.0),
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
                                  formatNumber(
                                    widget.price,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
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
                                      8.0, 0.0, 30.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      formatNumber(
                                        widget.originalValue,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: '',
                                      ),
                                      '20',
                                    ),
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
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
