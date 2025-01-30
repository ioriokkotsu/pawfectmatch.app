import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/pawfect_card_loading/pawfect_card_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'pet_list_widget.dart' show PetListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PetListModel extends FlutterFlowModel<PetListWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
