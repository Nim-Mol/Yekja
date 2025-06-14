import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'drop_down_standard_model.dart';
export 'drop_down_standard_model.dart';

class DropDownStandardWidget extends StatefulWidget {
  const DropDownStandardWidget({
    super.key,
    String? label,
  }) : this.label = label ?? 'your label';

  final String label;

  @override
  State<DropDownStandardWidget> createState() => _DropDownStandardWidgetState();
}

class _DropDownStandardWidgetState extends State<DropDownStandardWidget> {
  late DropDownStandardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownStandardModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= '',
        ),
        options: List<String>.from(
            ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11']),
        optionLabels: [
          'I need help',
          'I want to offer help',
          'I want to organize an event',
          'I\'m giving away something ',
          'I\'m selling something',
          'I want to borrow',
          'I\'m lending something',
          'I\'m looking to buy (from Iran)',
          'I\'m looking to buy (from NL)',
          'I need a professional (in Iran)',
          'I need a professional (in NL)'
        ],
        onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
        width: double.infinity,
        height: 50.0,
        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
              color: FlutterFlowTheme.of(context).textfiled,
              fontSize: 14.0,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
            ),
        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              fontSize: 14.0,
              letterSpacing: 0.0,
              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
            ),
        hintText: widget.label,
        searchHintText: widget.label,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).textfiled,
          size: 28.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).black20,
        borderWidth: 1.0,
        borderRadius: 12.0,
        margin: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: true,
        isMultiSelect: false,
      ),
    );
  }
}
