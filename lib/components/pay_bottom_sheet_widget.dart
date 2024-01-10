import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pay_bottom_sheet_model.dart';
export 'pay_bottom_sheet_model.dart';

class PayBottomSheetWidget extends StatefulWidget {
  const PayBottomSheetWidget({
    super.key,
    this.price,
    this.businessName,
    this.collectionTimeStart,
    this.collectionTimeEnd,
    this.listingId,
    this.maxQuantity,
    this.businessId,
    this.listingRef,
    this.originalValue,
  });

  final double? price;
  final String? businessName;
  final DateTime? collectionTimeStart;
  final DateTime? collectionTimeEnd;
  final String? listingId;
  final int? maxQuantity;
  final String? businessId;
  final DocumentReference? listingRef;
  final double? originalValue;

  @override
  _PayBottomSheetWidgetState createState() => _PayBottomSheetWidgetState();
}

class _PayBottomSheetWidgetState extends State<PayBottomSheetWidget> {
  late PayBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PayBottomSheetModel());
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
        height: 350.0,
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
            mainAxisSize: MainAxisSize.max,
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.businessName!,
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time_sharp,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Pick-up ${dateTimeFormat(
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
                                  style: FlutterFlowTheme.of(context).bodySmall,
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
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'aqxfl21a' /* Select Quantity */,
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ],
                  ),
                  Container(
                    width: 160.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(25.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minusCircle,
                        color: enabled
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 32.0,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plusCircle,
                        color: enabled
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 32.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      count: _model.quantityBuyValue ??= 1,
                      updateCount: (count) =>
                          setState(() => _model.quantityBuyValue = count),
                      stepSize: 1,
                      minimum: 1,
                      maximum: 10,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'x7znbwup' /* Total */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          formatNumber(
                            functions.getTotalPrice(
                                _model.quantityBuyValue!, widget.price!),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.automatic,
                            currency: '\$',
                          ),
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: FutureBuilder<List<UsersRecord>>(
                      future: queryUsersRecordOnce(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'uid',
                          isEqualTo: widget.businessId != ''
                              ? widget.businessId
                              : null,
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> buttonUsersRecordList =
                            snapshot.data!;
                        final buttonUsersRecord =
                            buttonUsersRecordList.isNotEmpty
                                ? buttonUsersRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PAY_BOTTOM_SHEET_PAY_WITH_STRIPE_BTN_ON_');
                            if (_model.quantityBuyValue! <=
                                widget.maxQuantity!) {
                              final paymentResponse =
                                  await processStripePayment(
                                context,
                                amount: valueOrDefault<int>(
                                  functions.doubleToCurrencySmallestUnit(
                                      valueOrDefault<double>(
                                    functions.getTotalPrice(
                                        _model.quantityBuyValue!,
                                        widget.price!),
                                    20.0,
                                  )),
                                  20,
                                ),
                                currency: 'AUD',
                                customerEmail: currentUserEmail,
                                customerName: currentUserDisplayName,
                                description:
                                    'Purchase of ${valueOrDefault<String>(
                                  _model.quantityBuyValue?.toString(),
                                  '0',
                                )} snack(s) from ${widget.businessName} with a total price of ${valueOrDefault<String>(
                                  functions
                                      .getTotalPrice(_model.quantityBuyValue!,
                                          widget.price!)
                                      .toString(),
                                  '20',
                                )}',
                                allowGooglePay: true,
                                allowApplePay: true,
                                buttonColor:
                                    FlutterFlowTheme.of(context).secondary,
                                buttonTextColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              );
                              if (paymentResponse.paymentId == null &&
                                  paymentResponse.errorMessage != null) {
                                showSnackbar(
                                  context,
                                  FFLocalizations.of(context)
                                      .getText(
                                        'zxzvm4wg' /* Error: [error] */,
                                      )
                                      .replaceAll('[error]',
                                          paymentResponse.errorMessage!),
                                );
                              }
                              _model.paymentId =
                                  paymentResponse.paymentId ?? '';

                              if (_model.paymentId != null &&
                                  _model.paymentId != '') {
                                await OrdersRecord.collection
                                    .doc()
                                    .set(createOrdersRecordData(
                                      price: valueOrDefault<double>(
                                        functions.getTotalPrice(
                                            _model.quantityBuyValue!,
                                            widget.price!),
                                        0.0,
                                      ),
                                      quantity: _model.quantityBuyValue,
                                      collectionStartTime:
                                          widget.collectionTimeStart,
                                      collectionEndTime:
                                          widget.collectionTimeEnd,
                                      purchaseTime: getCurrentTimestamp,
                                      userId: currentUserUid,
                                      listingUid: widget.listingId,
                                      businessName: widget.businessName,
                                      businessId: widget.businessId,
                                      userName: valueOrDefault<String>(
                                        loggedIn
                                            ? currentUserDisplayName
                                            : 'Unknown',
                                        'Unknown',
                                      ),
                                      totalOriginalValue:
                                          functions.getTotalPrice(
                                              _model.quantityBuyValue!,
                                              widget.originalValue!),
                                    ));

                                await widget.listingRef!.update({
                                  ...mapToFirestore(
                                    {
                                      'quantity': FieldValue.increment(
                                          -(_model.quantityBuyValue!)),
                                    },
                                  ),
                                });
                                if (buttonUsersRecord != null) {
                                  triggerPushNotification(
                                    notificationTitle:
                                        '${valueOrDefault<String>(
                                      loggedIn
                                          ? currentUserDisplayName
                                          : 'Someone',
                                      'Someone',
                                    )} bought one of your snacks!',
                                    notificationText:
                                        'Click here to see it in the app and get ready for your customers arrival.',
                                    notificationImageUrl:
                                        'https://uploads-ssl.webflow.com/630cbc7d2f07f41dce5a5178/630d506a39ea85cdabe9a0fa_SnackSavers%20Logo%20Color.svg',
                                    scheduledTime: getCurrentTimestamp,
                                    notificationSound: 'default',
                                    userRefs: [buttonUsersRecord.reference],
                                    initialPageName: 'BusinessOrdersView',
                                    parameterData: {},
                                  );
                                }
                              } else {
                                context.pushNamed(
                                  'ErrorScreen',
                                  queryParameters: {
                                    'errorTitle': serializeParam(
                                      'Oops!',
                                      ParamType.String,
                                    ),
                                    'errorSubtitle': serializeParam(
                                      'Something went wrong with your payment. Please try again or contact support at info@snacksavers.com.au',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              }

                              context.goNamed(
                                'SuccessScreen',
                                queryParameters: {
                                  'successTitle': serializeParam(
                                    'Purchase successful!',
                                    ParamType.String,
                                  ),
                                  'sucessSubtitle': serializeParam(
                                    'You just helped reduce food waste! You can find your orders under Account -> Your Orders.',
                                    ParamType.String,
                                  ),
                                  'isPurchase': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('To many selected'),
                                    content: const Text(
                                        'You cannot select a quantity higher than what is available in the listing'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
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
                            '3zxgi802' /* Pay with Stripe */,
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.stripe,
                          ),
                          options: FFButtonOptions(
                            width: 270.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        );
                      },
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
