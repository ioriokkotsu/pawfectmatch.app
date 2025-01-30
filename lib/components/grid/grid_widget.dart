import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grid_model.dart';
export 'grid_model.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  late GridModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.48,
          height: 150.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Text(
            'Hello World',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).accent1,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'diet',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
