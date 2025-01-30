import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'container_model.dart';
export 'container_model.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
    this.parameter7,
    this.parameter8,
    this.parameter9,
    this.parameter10,
    this.parameter11,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;
  final DateTime? parameter4;
  final UsersRecord? parameter5;
  final DocumentReference? parameter6;
  final String? parameter7;
  final String? parameter8;
  final int? parameter9;
  final int? parameter10;
  final DocumentReference? parameter11;

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  late ContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContainerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 5.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget!.parameter11!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }

          final containerUsersRecord = snapshot.data!;

          return Container(
            width: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondary,
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
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                containerUsersRecord.photoUrl,
                                'https://res.cloudinary.com/dd7kgf2io/image/upload/v1734245293/dp_basqmp.jpg',
                              ),
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CONTAINER_COMP_Row_202umkhi_ON_TAP');
                            if (containerUsersRecord.reference ==
                                currentUserReference) {
                              logFirebaseEvent('Row_navigate_to');

                              context.pushNamed('SocialProfilePage');
                            } else {
                              logFirebaseEvent('Row_navigate_to');

                              context.pushNamed(
                                'SocialProfileViewPage',
                                queryParameters: {
                                  'profilePara': serializeParam(
                                    containerUsersRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'profilePara': containerUsersRecord,
                                },
                              );
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    containerUsersRecord.displayName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      '@${containerUsersRecord.username}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                                child: VerticalDivider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              Opacity(
                                opacity: 0.7,
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.timeAgo(widget!.parameter4),
                                        '1m',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Text(
                            widget!.parameter7!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          width: widget!.parameter8 != null &&
                                  widget!.parameter8 != ''
                              ? 283.0
                              : 0.0,
                          height: widget!.parameter8 != null &&
                                  widget!.parameter8 != ''
                              ? (((widget!.parameter10!) /
                                      (widget!.parameter9!)) *
                                  283)
                              : 0.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                widget!.parameter8!,
                              ).image,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Icon(
                                Icons.favorite_border_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                              Icon(
                                Icons.favorite_outlined,
                                color: Color(0xFFDB35B8),
                                size: 18.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
