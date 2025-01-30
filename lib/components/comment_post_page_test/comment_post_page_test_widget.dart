import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_post_page_test_model.dart';
export 'comment_post_page_test_model.dart';

class CommentPostPageTestWidget extends StatefulWidget {
  const CommentPostPageTestWidget({super.key});

  @override
  State<CommentPostPageTestWidget> createState() =>
      _CommentPostPageTestWidgetState();
}

class _CommentPostPageTestWidgetState extends State<CommentPostPageTestWidget> {
  late CommentPostPageTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentPostPageTestModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CommentPostPageTest'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('COMMENT_POST_TEST_CANCEL_BTN_ON_TAP');
            logFirebaseEvent('Button_navigate_back');
            context.pop();
          },
          text: 'Cancel',
          options: FFButtonOptions(
            width: 80.0,
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).alternate,
            textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
            elevation: 0.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 16.0, 8.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('COMMENT_POST_TEST_SEND_BTN_ON_TAP');
                logFirebaseEvent('Button_haptic_feedback');
                HapticFeedback.lightImpact();
                logFirebaseEvent('Button_backend_call');

                await CommentsRecord.collection.doc().set({
                  ...createCommentsRecordData(
                    postedBy: currentUserReference,
                    commentContent: _model.textController.text,
                    uploadedImage: CloudinaryPOSTCall.imageUploadedUrl(
                      (_model.apiResultl3j?.jsonBody ?? ''),
                    ),
                    imageWidth: CloudinaryPOSTCall.imageWidth(
                      (_model.apiResultl3j?.jsonBody ?? ''),
                    ),
                    imageHeight: CloudinaryPOSTCall.imageHeight(
                      (_model.apiResultl3j?.jsonBody ?? ''),
                    ),
                  ),
                  ...mapToFirestore(
                    {
                      'datePosted': FieldValue.serverTimestamp(),
                    },
                  ),
                });
                logFirebaseEvent('Button_wait__delay');
                await Future.delayed(const Duration(milliseconds: 500));
                logFirebaseEvent('Button_show_snack_bar');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Your comment has been posted.',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed('ForYouPage');
              },
              text: 'Send',
              options: FFButtonOptions(
                width: 70.0,
                height: 32.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondary,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: 40.0,
                          height: 40.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            currentUserPhoto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        AuthUserStreamWidget(
                          builder: (context) => Text(
                            '@${valueOrDefault(currentUserDocument?.username, '')}',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () => safeSetState(() {}),
                    ),
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'What\'s happening?',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                    textAlign: TextAlign.start,
                    maxLines: 7,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.add_photo_alternate_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 32.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'COMMENT_POST_TEST_add_photo_alternate_ou');
                        var _shouldSetState = false;
                        logFirebaseEvent('IconButton_store_media_for_upload');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }

                        logFirebaseEvent('IconButton_backend_call');
                        _model.apiResultl3j = await CloudinaryPOSTCall.call(
                          file: _model.uploadedLocalFile,
                        );

                        _shouldSetState = true;
                        if ((_model.apiResultl3j?.succeeded ?? true)) {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        logFirebaseEvent('IconButton_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Opps!'),
                              content: Text('Your upload has failed.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Try Again'),
                                ),
                              ],
                            );
                          },
                        );
                        if (_shouldSetState) safeSetState(() {});
                        return;
                        if (_shouldSetState) safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 271.0,
                  height: 172.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        CloudinaryPOSTCall.imageUploadedUrl(
                          (_model.apiResultl3j?.jsonBody ?? ''),
                        )!,
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                        spreadRadius: 3.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),
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
