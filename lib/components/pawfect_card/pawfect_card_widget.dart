import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pawfect_card_model.dart';
export 'pawfect_card_model.dart';

class PawfectCardWidget extends StatefulWidget {
  const PawfectCardWidget({
    super.key,
    this.petRef,
  });

  final PetsRecord? petRef;

  @override
  State<PawfectCardWidget> createState() => _PawfectCardWidgetState();
}

class _PawfectCardWidgetState extends State<PawfectCardWidget> {
  late PawfectCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PawfectCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('PAWFECT_CARD_COMP_Column_7nse8gf3_ON_TAP');
            logFirebaseEvent('Column_haptic_feedback');
            HapticFeedback.lightImpact();
            logFirebaseEvent('Column_navigate_to');

            context.pushNamed(
              'PetDetails',
              pathParameters: {
                'petRef': serializeParam(
                  widget!.petRef,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'petRef': widget!.petRef,
              },
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('PAWFECT_CARD_Container_xsjr6r56_ON_TAP');
                  logFirebaseEvent('Container_haptic_feedback');
                  HapticFeedback.lightImpact();
                  logFirebaseEvent('Container_navigate_to');

                  context.pushNamed(
                    'PetDetails',
                    pathParameters: {
                      'petRef': serializeParam(
                        widget!.petRef,
                        ParamType.Document,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      'petRef': widget!.petRef,
                    },
                  );
                },
                onDoubleTap: () async {
                  logFirebaseEvent('PAWFECT_CARD_Container_xsjr6r56_ON_DOUBL');
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.48,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        widget!.petRef!.photoUrl,
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 1.0,
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'PAWFECT_CARD_COMP_Stack_nseosxmo_ON_TAP');
                          if ((currentUserDocument?.petsFavorite?.toList() ??
                                      [])
                                  .contains(widget!.petRef?.reference) ==
                              true) {
                            logFirebaseEvent('Stack_haptic_feedback');
                            HapticFeedback.lightImpact();
                            logFirebaseEvent('Stack_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'petsFavorite': FieldValue.arrayRemove(
                                      [widget!.petRef?.reference]),
                                },
                              ),
                            });
                            logFirebaseEvent('Stack_update_app_state');
                            FFAppState().favoriteOrNot =
                                (currentUserDocument?.petsFavorite?.toList() ??
                                            [])
                                        .contains(widget!.petRef?.reference) ==
                                    true;
                            safeSetState(() {});
                          } else {
                            logFirebaseEvent('Stack_haptic_feedback');
                            HapticFeedback.lightImpact();
                            logFirebaseEvent('Stack_wait__delay');
                            await Future.delayed(
                                const Duration(milliseconds: 200));
                            logFirebaseEvent('Stack_haptic_feedback');
                            HapticFeedback.lightImpact();
                            logFirebaseEvent('Stack_backend_call');

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'petsFavorite': FieldValue.arrayUnion(
                                      [widget!.petRef?.reference]),
                                },
                              ),
                            });
                            logFirebaseEvent('Stack_update_app_state');
                            FFAppState().favoriteOrNot =
                                (currentUserDocument?.petsFavorite?.toList() ??
                                            [])
                                        .contains(widget!.petRef?.reference) ==
                                    true;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                              if ((currentUserDocument?.petsFavorite
                                              ?.toList() ??
                                          [])
                                      .contains(widget!.petRef?.reference) ==
                                  true)
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Icon(
                                        Icons.favorite_rounded,
                                        color: Color(0xFFDD4040),
                                        size: 24.0,
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
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.petRef?.petName,
                    'Name',
                  ).maybeHandleOverflow(
                    maxChars: 36,
                    replacement: '…',
                  ),
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent1,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            currentUserEmail,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  lineHeight: 1.0,
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
      ],
    );
  }
}
