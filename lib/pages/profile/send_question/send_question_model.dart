import '/components/text_box/text_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'send_question_widget.dart' show SendQuestionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SendQuestionModel extends FlutterFlowModel<SendQuestionWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for textBox component.
  late TextBoxModel textBoxModel;

  @override
  void initState(BuildContext context) {
    textBoxModel = createModel(context, () => TextBoxModel());
  }

  @override
  void dispose() {
    textBoxModel.dispose();
  }
}
