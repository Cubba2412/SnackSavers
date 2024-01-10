import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'stripe_info_page_model.dart';
export 'stripe_info_page_model.dart';

class StripeInfoPageWidget extends StatefulWidget {
  const StripeInfoPageWidget({super.key});

  @override
  _StripeInfoPageWidgetState createState() => _StripeInfoPageWidgetState();
}

class _StripeInfoPageWidgetState extends State<StripeInfoPageWidget> {
  late StripeInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripeInfoPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StripeInfoPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STRIPE_INFO_StripeInfoPage_ON_INIT_STATE');
      _model.stripeAccountDetails =
          await RetrieveAccountStripeProductionCall.call(
        accountId: valueOrDefault<String>(
          loggedIn
              ? valueOrDefault(currentUserDocument?.stripeAccountId, '')
              : '0',
          '0',
        ),
      );
      if ((_model.stripeAccountDetails?.succeeded ?? true)) {
        FFAppState().update(() {
          FFAppState().detailsSubmitted =
              RetrieveAccountStripeProductionCall.detailsSubmitted(
            (_model.stripeAccountDetails?.jsonBody ?? ''),
          );
        });
      } else {
        FFAppState().update(() {
          FFAppState().detailsSubmitted = false;
        });
      }
    });
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
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('STRIPE_INFO_arrow_back_rounded_ICN_ON_TA');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'xocgpzjp' /* Stripe Account */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(-0.05, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!FFAppState().detailsSubmitted)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SelectionArea(
                              child: Text(
                            FFLocalizations.of(context).getText(
                              'cwdf8j0e' /* You have not completed the set... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          )),
                          SelectionArea(
                              child: Text(
                            FFLocalizations.of(context).getText(
                              'ls3vjmhi' /* To get paid from your sold sna... */,
                            ),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                          )),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STRIPE_INFO_PAGE_PAGE_SETUP_BTN_ON_TAP');
                                _model.accountLinkUrl =
                                    await CreateAccountLinkStripeProductionCall
                                        .call(
                                  account: loggedIn
                                      ? valueOrDefault(
                                          currentUserDocument?.stripeAccountId,
                                          '')
                                      : '0',
                                );
                                if ((_model.accountLinkUrl?.succeeded ??
                                    true)) {
                                  await launchURL(valueOrDefault<String>(
                                    CreateAccountLinkStripeProductionCall
                                        .accountLinkUrl(
                                      (_model.accountLinkUrl?.jsonBody ?? ''),
                                    ).toString(),
                                    'https://www.snacksavers.com.au',
                                  ));
                                } else {
                                  context.pushNamed('StripeRefreshPage');
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'z7d1no7q' /* Setup */,
                              ),
                              icon: const FaIcon(
                                FontAwesomeIcons.stripe,
                                size: 32.0,
                              ),
                              options: FFButtonOptions(
                                width: 240.0,
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF635BFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (FFAppState().detailsSubmitted)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SelectionArea(
                              child: Text(
                            FFLocalizations.of(context).getText(
                              'qy40ichx' /* See your stripe account */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).titleMedium,
                          )),
                          SelectionArea(
                              child: Text(
                            FFLocalizations.of(context).getText(
                              '6fv3ouj6' /* Check your payout data via you... */,
                            ),
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                          )),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'STRIPE_INFO_DASHBOARD_BTN_ON_TAP');
                                _model.loginLinkUrl =
                                    await CreateLoginLinkProductionCall.call(
                                  accountId: valueOrDefault<String>(
                                    loggedIn
                                        ? valueOrDefault(
                                            currentUserDocument
                                                ?.stripeAccountId,
                                            '')
                                        : '0',
                                    '0',
                                  ),
                                );
                                if ((_model.loginLinkUrl?.succeeded ?? true)) {
                                  await launchURL(valueOrDefault<String>(
                                    CreateLoginLinkProductionCall.loginLinkUrl(
                                      (_model.loginLinkUrl?.jsonBody ?? ''),
                                    ).toString(),
                                    'https://www.snacksavers.com.au',
                                  ));
                                } else {
                                  await launchURL('https://stripe.com');
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'udayofk3' /* Dashboard */,
                              ),
                              icon: const FaIcon(
                                FontAwesomeIcons.stripe,
                                size: 32.0,
                              ),
                              options: FFButtonOptions(
                                width: 240.0,
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF635BFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
      ),
    );
  }
}
