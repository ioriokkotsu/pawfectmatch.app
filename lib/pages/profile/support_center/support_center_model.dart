import '/auth/firebase_auth/auth_util.dart';
import '/components/accordion_section/accordion_section_widget.dart';
import '/components/text_box/text_box_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'support_center_widget.dart' show SupportCenterWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SupportCenterModel extends FlutterFlowModel<SupportCenterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AccordionSection component.
  late AccordionSectionModel accordionSectionModel;

  @override
  void initState(BuildContext context) {
    accordionSectionModel = createModel(context, () => AccordionSectionModel());
  }

  @override
  void dispose() {
    accordionSectionModel.dispose();
  }
}
