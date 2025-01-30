import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'book_page_model.dart';
export 'book_page_model.dart';

class BookPageWidget extends StatefulWidget {
  const BookPageWidget({
    super.key,
    required this.shelterRef,
    required this.petRef,
  });

  final SheltersRecord? shelterRef;
  final PetsRecord? petRef;

  @override
  State<BookPageWidget> createState() => _BookPageWidgetState();
}

class _BookPageWidgetState extends State<BookPageWidget> {
  late BookPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BookPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).secondary,
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
              logFirebaseEvent('BOOK_PAGE_PAGE_arrow_back_ios_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Appointment',
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
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.87,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget!.shelterRef?.shelterPhoto,
                                'https://picsum.photos/seed/938/600',
                              ),
                              width: 332.0,
                              height: 199.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget!.shelterRef?.shelterName,
                                      'Shelter Name',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.shelterRef?.shelterAddress,
                                '[shelterAddress]',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Choose Date and Time',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        lineHeight: 1.5,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'BOOK_PAGE_PAGE_Container_f74iqjeq_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_date_time_picker');
                                            final _datePickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: getCurrentTimestamp,
                                              firstDate: getCurrentTimestamp,
                                              lastDate: DateTime(2050),
                                              builder: (context, child) {
                                                return wrapInMaterialDatePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );

                                            if (_datePickedDate != null) {
                                              safeSetState(() {
                                                _model.datePicked = DateTime(
                                                  _datePickedDate.year,
                                                  _datePickedDate.month,
                                                  _datePickedDate.day,
                                                );
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      dateTimeFormat(
                                                        "yMMMd",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      'Choose Date',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Icon(
                                                    Icons.date_range_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: [
                                          '9:00',
                                          '10:00',
                                          '11:00',
                                          '12:00',
                                          '14:00',
                                          '15:00',
                                          '16:00'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.dropDownValue = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Choose Time',
                                        icon: Icon(
                                          Icons.timer_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondary,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: false,
                                        isMultiSelect: false,
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
                                  0.0, 24.0, 0.0, 0.0),
                              child: StreamBuilder<List<AppointmentRecord>>(
                                stream: queryAppointmentRecord(
                                  parent: widget!.shelterRef?.reference,
                                ),
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
                                  List<AppointmentRecord>
                                      buttonAppointmentRecordList =
                                      snapshot.data!;

                                  return FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'BOOK_PAGE_PAGE_BOOK_NOW_BTN_ON_TAP');
                                      if (((buttonAppointmentRecordList
                                                  .where((e) =>
                                                      e.bookedBy?.id ==
                                                      currentUserReference?.id)
                                                  .toList()
                                                  .isNotEmpty) ==
                                              true) &&
                                          ((buttonAppointmentRecordList
                                                  .where((e) =>
                                                      e.petRef?.id ==
                                                      widget!
                                                          .petRef?.reference.id)
                                                  .toList()
                                                  .isNotEmpty) ==
                                              true)) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text(
                                                  'You already booked appointment with this pet.'),
                                              content: Text(
                                                  'Please refer to your existing appointment.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        if ((buttonAppointmentRecordList
                                                .where((e) => e.timeRefSlot
                                                    .contains(functions
                                                        .convertToTimestamp(
                                                            _model.datePicked!,
                                                            _model
                                                                .dropDownValue!)
                                                        .secondsSinceEpoch
                                                        .toString()))
                                                .toList()
                                                .isNotEmpty) ==
                                            true) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'The appointment slot had been booked.'),
                                                content: Text(
                                                    'Please book different date or time.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Button_backend_call');

                                          await AppointmentRecord.createDoc(
                                                  widget!.shelterRef!.reference)
                                              .set({
                                            ...createAppointmentRecordData(
                                              timeSlot:
                                                  functions.convertToTimestamp(
                                                      _model.datePicked!,
                                                      _model.dropDownValue!),
                                              bookedBy: currentUserReference,
                                              statusAppointment: 'Pending',
                                              petRef: widget!.petRef?.petID,
                                            ),
                                            ...mapToFirestore(
                                              {
                                                'timeRefSlot': [
                                                  functions
                                                      .convertToTimestamp(
                                                          _model.datePicked!,
                                                          _model.dropDownValue!)
                                                      .secondsSinceEpoch
                                                      .toString()
                                                ],
                                              },
                                            ),
                                          });
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Success!'),
                                                content: Text(
                                                    'You has successfully booked the appointment.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('PetList');
                                        }
                                      }
                                    },
                                    text: 'Book Now',
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
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
                                      borderRadius: BorderRadius.circular(25.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
            ),
          ],
        ),
      ),
    );
  }
}
