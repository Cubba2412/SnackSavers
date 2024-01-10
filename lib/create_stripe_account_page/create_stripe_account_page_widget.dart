import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'create_stripe_account_page_model.dart';
export 'create_stripe_account_page_model.dart';

class CreateStripeAccountPageWidget extends StatefulWidget {
  const CreateStripeAccountPageWidget({super.key});

  @override
  _CreateStripeAccountPageWidgetState createState() =>
      _CreateStripeAccountPageWidgetState();
}

class _CreateStripeAccountPageWidgetState
    extends State<CreateStripeAccountPageWidget> {
  late CreateStripeAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateStripeAccountPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateStripeAccountPage'});
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
                            'assets/lottie_animations/103761-3d-stripe.json',
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
                            'dcrue3v2' /* Connect your account to Stripe */,
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
                            'dui5cm1g' /* We use Stripe to make sure you... */,
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
                              'CREATE_STRIPE_ACCOUNT_SET_UP_PAYMENTS_BT');
                          _model.apiResultx02 =
                              await CreateAccountLinkStripeProductionCall
                                  .call();
                          if ((_model.apiResultx02?.succeeded ?? true)) {
                            await launchURL(valueOrDefault<String>(
                              CreateAccountLinkStripeProductionCall
                                  .accountLinkUrl(
                                (_model.apiResultx02?.jsonBody ?? ''),
                              ).toString(),
                              'https://www.snacksavers.com.au',
                            ));
                          } else {
                            context.pushNamed('StripeRefreshPage');
                          }

                          FFAppState().update(() {
                            FFAppState().activePage = 'ListView';
                          });

                          context.pushNamed('ListView');

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'zji66sys' /* Set Up Payments */,
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CREATE_STRIPE_ACCOUNT_Text_1s6724kz_ON_T');
                              FFAppState().update(() {
                                FFAppState().activePage = 'ListView';
                              });

                              context.pushNamed('ListView');
                            },
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'lmn5aw5j' /* Setup Later */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    decoration: TextDecoration.underline,
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
        ),
      ),
    );
  }
}
