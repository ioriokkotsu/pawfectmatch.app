import '/components/text_box/text_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'send_question_model.dart';
export 'send_question_model.dart';

class SendQuestionWidget extends StatefulWidget {
  const SendQuestionWidget({super.key});

  @override
  State<SendQuestionWidget> createState() => _SendQuestionWidgetState();
}

class _SendQuestionWidgetState extends State<SendQuestionWidget> {
  late SendQuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SendQuestionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SendQuestion'});
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: wrapWithModel(
                  model: _model.textBoxModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TextBoxWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
