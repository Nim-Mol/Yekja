import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'text_field_labeled_model.dart';
export 'text_field_labeled_model.dart';

class TextFieldLabeledWidget extends StatefulWidget {
  const TextFieldLabeledWidget({
    super.key,
    String? maintext,
    String? label,
  })  : this.maintext = maintext ?? 'Your variable',
        this.label = label ?? 'your label';

  final String maintext;
  final String label;

  @override
  State<TextFieldLabeledWidget> createState() => _TextFieldLabeledWidgetState();
}

class _TextFieldLabeledWidgetState extends State<TextFieldLabeledWidget> {
  late TextFieldLabeledModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldLabeledModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: false,
        textInputAction: TextInputAction.next,
        obscureText: false,
        decoration: InputDecoration(
          isDense: false,
          labelText: widget.maintext,
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Satoshi',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 13.0,
                letterSpacing: 0.0,
              ),
          hintText: widget.label,
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Satoshi',
                color: FlutterFlowTheme.of(context).textfiled,
                fontSize: 14.0,
                letterSpacing: 0.0,
              ),
          errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Satoshi',
                color: FlutterFlowTheme.of(context).error,
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                lineHeight: 1.2,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).black20,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 0.0, 13.0),
        ),
        style: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
              color: FlutterFlowTheme.of(context).primaryText,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
            ),
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
