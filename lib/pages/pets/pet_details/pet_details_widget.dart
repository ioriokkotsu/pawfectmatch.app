import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pet_details_model.dart';
export 'pet_details_model.dart';

class PetDetailsWidget extends StatefulWidget {
  const PetDetailsWidget({
    super.key,
    this.petRef,
  });

  final PetsRecord? petRef;

  @override
  State<PetDetailsWidget> createState() => _PetDetailsWidgetState();
}

class _PetDetailsWidgetState extends State<PetDetailsWidget>
    with TickerProviderStateMixin {
  late PetDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetDetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PetDetails'});
    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

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
      backgroundColor: FlutterFlowTheme.of(context).primary,
      appBar: AppBar(
        backgroundColor: Color(0xFFA78287),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            logFirebaseEvent('PET_DETAILS_arrow_back_ios_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Pets',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: 22.0,
                letterSpacing: 0.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: double.infinity,
                    height: 280.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          widget!.petRef!.photoUrl,
                        ).image,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.petRef?.petName,
                                      'Pet Name',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 2.0, 0.0, 0.0),
                                    child: StreamBuilder<PetsRecord>(
                                      stream: PetsRecord.getDocument(
                                          widget!.petRef!.reference),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 25.0,
                                              height: 25.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final stackPetsRecord = snapshot.data!;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'PET_DETAILS_PAGE_Stack_9idss4zc_ON_TAP');
                                            if ((currentUserDocument
                                                            ?.petsFavorite
                                                            ?.toList() ??
                                                        [])
                                                    .contains(widget!
                                                        .petRef?.reference) ==
                                                true) {
                                              logFirebaseEvent(
                                                  'Stack_haptic_feedback');
                                              HapticFeedback.lightImpact();
                                              logFirebaseEvent(
                                                  'Stack_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'petsFavorite':
                                                        FieldValue.arrayRemove([
                                                      widget!.petRef?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'Stack_update_app_state');
                                              FFAppState().favoriteOrNot =
                                                  (currentUserDocument
                                                                  ?.petsFavorite
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(widget!
                                                              .petRef
                                                              ?.reference) ==
                                                      true;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Stack_haptic_feedback');
                                              HapticFeedback.lightImpact();
                                              logFirebaseEvent(
                                                  'Stack_wait__delay');
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 200));
                                              logFirebaseEvent(
                                                  'Stack_haptic_feedback');
                                              HapticFeedback.lightImpact();
                                              logFirebaseEvent(
                                                  'Stack_backend_call');

                                              await currentUserReference!
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'petsFavorite':
                                                        FieldValue.arrayUnion([
                                                      widget!.petRef?.reference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'Stack_update_app_state');
                                              FFAppState().favoriteOrNot =
                                                  (currentUserDocument
                                                                  ?.petsFavorite
                                                                  ?.toList() ??
                                                              [])
                                                          .contains(widget!
                                                              .petRef
                                                              ?.reference) ==
                                                      true;
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 32.0,
                                                ),
                                              ),
                                              if ((currentUserDocument
                                                              ?.petsFavorite
                                                              ?.toList() ??
                                                          [])
                                                      .contains(widget!
                                                          .petRef?.reference) ==
                                                  true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: AuthUserStreamWidget(
                                                    builder: (context) => Icon(
                                                      Icons.favorite_rounded,
                                                      color: Color(0xFFFF4E59),
                                                      size: 32.0,
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'iconOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                'Species: ${widget!.petRef?.petSpecies}',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                'Breed: ${widget!.petRef?.petBreed}',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                'Size ( Age ) : ${widget!.petRef?.petSize?.toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: Text(
                                'Living Condition: ${widget!.petRef?.livingCondition}',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Availability',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 0.0, 0.0),
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 8.0),
                                          child: Container(
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                widget!.petRef!.availableAdopt
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .success
                                                    : Color(0xFFC52B2B),
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 12.0, 24.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    widget!.petRef!
                                                            .availableAdopt
                                                        ? 'Available'
                                                        : 'Adopted',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFFF8F6F2),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: StreamBuilder<SheltersRecord>(
                                  stream: SheltersRecord.getDocument(
                                      widget!.petRef!.sheltersID!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 25.0,
                                          height: 25.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }

                                    final buttonSheltersRecord = snapshot.data!;

                                    return FFButtonWidget(
                                      onPressed: !widget!.petRef!.availableAdopt
                                          ? null
                                          : () async {
                                              logFirebaseEvent(
                                                  'PET_DETAILS_SET_APPOINTMENT_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                'BookPage',
                                                queryParameters: {
                                                  'shelterRef': serializeParam(
                                                    buttonSheltersRecord,
                                                    ParamType.Document,
                                                  ),
                                                  'petRef': serializeParam(
                                                    widget!.petRef,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'shelterRef':
                                                      buttonSheltersRecord,
                                                  'petRef': widget!.petRef,
                                                },
                                              );
                                            },
                                      text: 'Set Appointment',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
