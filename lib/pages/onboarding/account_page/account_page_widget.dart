import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar/custom_appbar_widget.dart';
import '/components/title_with_subtitle/title_with_subtitle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_page_model.dart';
export 'account_page_model.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({super.key});

  @override
  State<AccountPageWidget> createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  late AccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AccountPage'});
    _model.emailAddressTextController ??=
        TextEditingController(text: currentUserEmail);
    _model.emailAddressFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.customAppbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CustomAppbarWidget(),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Text(
                        'Your Account',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Inter',
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.titleWithSubtitleModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: TitleWithSubtitleWidget(
                      title: 'Reset Password',
                      subtitle:
                          'Receive a link via email to reset your password.',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('ACCOUNT_RESET_PASSWORD_BTN_ON_TAP');
                        logFirebaseEvent('Button_auth');
                        if (_model.emailAddressTextController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email required!',
                              ),
                            ),
                          );
                          return;
                        }
                        await authManager.resetPassword(
                          email: _model.emailAddressTextController.text,
                          context: context,
                        );
                      },
                      text: 'Reset Password',
                      icon: FaIcon(
                        FontAwesomeIcons.paw,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.titleWithSubtitleModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: TitleWithSubtitleWidget(
                      title: 'Delete Account',
                      subtitle: 'The data from your account will be deleted.',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 48.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('ACCOUNT_DELETE_ACCOUNT_BTN_ON_TAP');
                        logFirebaseEvent('Button_auth');
                        await authManager.deleteUser(context);
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed(
                          'SplashPage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      text: 'Delete Account',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: Color(0xFFB74D4D),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _model.emailAddressTextController,
                    focusNode: _model.emailAddressFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.words,
                    readOnly: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 1.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          lineHeight: 1.0,
                        ),
                    minLines: 1,
                    validator: _model.emailAddressTextControllerValidator
                        .asValidator(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
