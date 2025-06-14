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
          FFLocalizations.of(context).getText(
            'ovads50a' /* I need help */,
          ),
          FFLocalizations.of(context).getText(
            'eij263gg' /* I want to offer help */,
          ),
          FFLocalizations.of(context).getText(
            'pm50e711' /* I want to organize an event */,
          ),
          FFLocalizations.of(context).getText(
            'a1bonwie' /* I'm giving away something  */,
          ),
          FFLocalizations.of(context).getText(
            '08ke4dvj' /* I'm selling something */,
          ),
          FFLocalizations.of(context).getText(
            'jzwl48uh' /* I want to borrow */,
          ),
          FFLocalizations.of(context).getText(
            'dnz0n838' /* I'm lending something */,
          ),
          FFLocalizations.of(context).getText(
            '2q1acdpn' /* I'm looking to buy (from Iran) */,
          ),
          FFLocalizations.of(context).getText(
            'lfeu1v7l' /* I'm looking to buy (from NL) */,
          ),
          FFLocalizations.of(context).getText(
            'j17b5y90' /* I need a professional (in Iran... */,
          ),
          FFLocalizations.of(context).getText(
            'ipyqmw60' /* I need a professional (in NL) */,
          )
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
