import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interests_card_model.dart';
export 'interests_card_model.dart';

class InterestsCardWidget extends StatefulWidget {
  const InterestsCardWidget({
    super.key,
    this.interestName,
    this.image,
  });

  final String? interestName;
  final String? image;

  @override
  State<InterestsCardWidget> createState() => _InterestsCardWidgetState();
}

class _InterestsCardWidgetState extends State<InterestsCardWidget> {
  late InterestsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestsCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (FFAppState().Interests.contains(widget.interestName)) {
            FFAppState().removeFromInterests(widget.interestName!);
            safeSetState(() {});
          } else {
            FFAppState().addToInterests(widget.interestName!);
            safeSetState(() {});
          }
        },
        child: Container(
          height: 40.0,
          decoration: BoxDecoration(
            color: FFAppState().Interests.contains(widget.interestName)
                ? FlutterFlowTheme.of(context).secondaryBackground
                : Color(0x7B12B886),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Image.network(
                    widget.image!,
                    height: 50.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.interestName,
                    'Category',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 5.0)),
            ),
          ),
        ),
      ),
    );
  }
}
