import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_box_model.dart';
export 'text_box_model.dart';

class TextBoxWidget extends StatefulWidget {
  const TextBoxWidget({super.key});

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  late TextBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextBoxModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 256.5,
        height: 157.3,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 34.9,
                fillColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 20.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('TEXT_BOX_COMP_close_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_close_dialog_drawer_etc');
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 20.0, 5.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Ask a Question',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                    hintStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          letterSpacing: 0.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFCF8F8),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.black,
                        letterSpacing: 0.0,
                      ),
                  maxLines: 4,
                  minLines: 1,
                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('TEXT_BOX_COMP_SEND_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    await SupportCenterRecord.collection
                        .doc()
                        .set(createSupportCenterRecordData(
                          question: _model.textController.text,
                        ));
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  text: 'Send',
                  icon: Icon(
                    Icons.check,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: 100.0,
                    height: 35.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
