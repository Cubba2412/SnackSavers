import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'stripe_refresh_page_model.dart';
export 'stripe_refresh_page_model.dart';

class StripeRefreshPageWidget extends StatefulWidget {
  const StripeRefreshPageWidget({super.key});

  @override
  _StripeRefreshPageWidgetState createState() =>
      _StripeRefreshPageWidgetState();
}

class _StripeRefreshPageWidgetState extends State<StripeRefreshPageWidget> {
  late StripeRefreshPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripeRefreshPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'StripeRefreshPage'});
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
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, -0.05),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/lottie_animations/76705-error-animation.json',
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                            frameRate: FrameRate(60.0),
                            repeat: false,
                            animate: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'pbx0xnth' /* Failed Stripe account setup */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 32.0,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250.0,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'hxrotyys' /* Something went wrong while set... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'STRIPE_REFRESH_CREATE_STRIPE_ACCOUNT_BTN');
                          _model.accountLinkUrl =
                              await CreateAccountLinkStripeProductionCall.call(
                            account: loggedIn
                                ? valueOrDefault(
                                    currentUserDocument?.stripeAccountId, '')
                                : '0',
                          );
                          if ((_model.accountLinkUrl?.succeeded ?? true)) {
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
                          'n2wk1dme' /* Create Stripe Account */,
                        ),
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).white,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'STRIPE_REFRESH_Text_sownqo9h_ON_TAP');
                          FFAppState().update(() {
                            FFAppState().activePage = 'ListView';
                          });

                          context.pushNamed('ListView');
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'uoxvyrga' /* Setup Later */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
