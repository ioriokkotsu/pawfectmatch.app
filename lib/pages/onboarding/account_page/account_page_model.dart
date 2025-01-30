import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_appbar/custom_appbar_widget.dart';
import '/components/title_with_subtitle/title_with_subtitle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'account_page_widget.dart' show AccountPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountPageModel extends FlutterFlowModel<AccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for customAppbar component.
  late CustomAppbarModel customAppbarModel;
  // Model for TitleWithSubtitle component.
  late TitleWithSubtitleModel titleWithSubtitleModel1;
  // Model for TitleWithSubtitle component.
  late TitleWithSubtitleModel titleWithSubtitleModel2;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
    titleWithSubtitleModel1 =
        createModel(context, () => TitleWithSubtitleModel());
    titleWithSubtitleModel2 =
        createModel(context, () => TitleWithSubtitleModel());
  }

  @override
  void dispose() {
    customAppbarModel.dispose();
    titleWithSubtitleModel1.dispose();
    titleWithSubtitleModel2.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
