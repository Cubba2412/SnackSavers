import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'nav_bar_floting_model.dart';
export 'nav_bar_floting_model.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({super.key});

  @override
  _NavBarFlotingWidgetState createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  late NavBarFlotingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 12.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 5.0),
          )
        ],
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2.0,
            sigmaY: 2.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_Container_cxz8fgov_ON_TA');
                          FFAppState().update(() {
                            FFAppState().activePage = 'ListView';
                          });

                          context.goNamed('ListView');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.home,
                                  color: valueOrDefault<Color>(
                                    FFAppState().activePage == 'ListView'
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context).grayIcon,
                                    const Color(0xFF757575),
                                  ),
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_FLOTING_COMP_home_ICN_ON_TAP');
                                  FFAppState().update(() {
                                    FFAppState().activePage = 'ListView';
                                  });

                                  context.goNamed('ListView');
                                },
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_FLOTING_Text_zs993w04_ON_TAP');
                                    FFAppState().update(() {
                                      FFAppState().activePage = 'ListView';
                                    });

                                    context.goNamed('ListView');
                                  },
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'vjibmk3j' /* Home */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            FFAppState().activePage ==
                                                    'ListView'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                            FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_Container_q9tevfu6_ON_TA');
                          FFAppState().update(() {
                            FFAppState().activePage = 'MapView';
                          });

                          context.goNamed('MapView');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.map,
                                  color: valueOrDefault<Color>(
                                    FFAppState().activePage == 'MapView'
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context).grayIcon,
                                    FlutterFlowTheme.of(context).grayIcon,
                                  ),
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_FLOTING_COMP_map_ICN_ON_TAP');
                                  FFAppState().update(() {
                                    FFAppState().activePage = 'MapView';
                                  });

                                  context.goNamed('MapView');
                                },
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_FLOTING_Text_hun67jlg_ON_TAP');
                                    FFAppState().update(() {
                                      FFAppState().activePage = 'MapView';
                                    });

                                    context.goNamed('MapView');
                                  },
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'n11xsokt' /* Map */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            FFAppState().activePage == 'MapView'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                            FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (loggedIn
                        ? ((valueOrDefault(currentUserDocument?.aBNNumber, 0) !=
                                null) &&
                            (valueOrDefault(
                                    currentUserDocument?.aBNNumber, 0) !=
                                0))
                        : false)
                      Expanded(
                        flex: 1,
                        child: AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAV_BAR_FLOTING_Container_5egpm2t1_ON_TA');
                              if (FFAppState().newBusinessUser) {
                                context
                                    .pushNamed('CreateAListingInstructionView');
                              } else {
                                FFAppState().update(() {
                                  FFAppState().activePage = 'CreateListingView';
                                });

                                context.goNamed('CreateListingView');
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 25.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'NAV_BAR_FLOTING_COMP_add_ICN_ON_TAP');
                                        if (FFAppState().newBusinessUser) {
                                          context.pushNamed(
                                              'CreateAListingInstructionView');
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().activePage =
                                                'CreateListingView';
                                          });

                                          context.goNamed('CreateListingView');
                                        }
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'NAV_BAR_FLOTING_Text_6d41m0gd_ON_TAP');
                                        if (FFAppState().newBusinessUser) {
                                          context.pushNamed(
                                              'CreateAListingInstructionView');
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().activePage =
                                                'CreateListingView';
                                          });

                                          context.goNamed('CreateListingView');
                                        }
                                      },
                                      child: AutoSizeText(
                                        FFLocalizations.of(context).getText(
                                          '6rujgma5' /* Add */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: valueOrDefault<Color>(
                                                FFAppState().activePage ==
                                                        'CreateListingView'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .grayIcon,
                                                FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                              ),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
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
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_Container_87ucdqcm_ON_TA');
                          FFAppState().update(() {
                            FFAppState().activePage = 'FavouriteView';
                          });

                          context.goNamed('FavouriteView');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  color: valueOrDefault<Color>(
                                    FFAppState().activePage == 'FavouriteView'
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context).grayIcon,
                                    FlutterFlowTheme.of(context).grayIcon,
                                  ),
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_FLOTING_solidHeart_ICN_ON_TAP');
                                  FFAppState().update(() {
                                    FFAppState().activePage = 'FavouriteView';
                                  });

                                  context.goNamed('FavouriteView');
                                },
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_FLOTING_Text_u5ejm2ks_ON_TAP');
                                    FFAppState().update(() {
                                      FFAppState().activePage = 'FavouriteView';
                                    });

                                    context.goNamed('FavouriteView');
                                  },
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      'oc7wbgi4' /* Favourites */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            FFAppState().activePage ==
                                                    'FavouriteView'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                            FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          fontSize: 1.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NAV_BAR_FLOTING_Container_mjz7tb5j_ON_TA');
                          FFAppState().update(() {
                            FFAppState().activePage = 'AccountView';
                          });

                          context.goNamed('AccountView');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.person_outline,
                                  color: valueOrDefault<Color>(
                                    FFAppState().activePage == 'AccountView'
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context).grayIcon,
                                    FlutterFlowTheme.of(context).grayIcon,
                                  ),
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'NAV_BAR_FLOTING_person_outline_ICN_ON_TA');
                                  FFAppState().update(() {
                                    FFAppState().activePage = 'AccountView';
                                  });

                                  context.goNamed('AccountView');
                                },
                              ),
                              Container(
                                width: double.infinity,
                                height: 18.0,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NAV_BAR_FLOTING_Text_46atnubg_ON_TAP');
                                    FFAppState().update(() {
                                      FFAppState().activePage = 'AccountView';
                                    });

                                    context.goNamed('AccountView');
                                  },
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      '7eee64dn' /* Account */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: valueOrDefault<Color>(
                                            FFAppState().activePage ==
                                                    'AccountView'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondary
                                                : FlutterFlowTheme.of(context)
                                                    .grayIcon,
                                            FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
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
          ),
        ),
      ),
    );
  }
}
