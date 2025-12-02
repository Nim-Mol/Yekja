import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'reporting_popup_model.dart';
export 'reporting_popup_model.dart';

class ReportingPopupWidget extends StatefulWidget {
  const ReportingPopupWidget({
    super.key,
    required this.reportingData,
  });

  final ReportingDataStruct? reportingData;

  @override
  State<ReportingPopupWidget> createState() => _ReportingPopupWidgetState();
}

class _ReportingPopupWidgetState extends State<ReportingPopupWidget> {
  late ReportingPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportingPopupModel());

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
    return Container(
      height: 280.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 15.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text(widget.reportingData!.postId),
                              content: Text(widget.reportingData!.profileId),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'kg3w5j6w' /* You are about to report  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                widget.reportingData!.isProfile
                                    ? widget.reportingData?.profileOwnerName
                                    : widget.reportingData?.postTitle,
                                'a user or post',
                              ),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2pjit2x3' /* . Please provide your reason b... */,
                              ),
                              style: TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: FFLocalizations.of(context).getText(
                          '8r0yy5sr' /* Reason */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        alignLabelWithHint: true,
                        hintText: FFLocalizations.of(context).getText(
                          '2iknl0nt' /* I would like to report this po... */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      maxLines: 5,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'fq4r8mbk' /* Cancel */,
                    ),
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF4D4D4D),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: (_model.textController.text == '')
                        ? null
                        : () async {
                            if (_model.textController.text != '') {
                              if (widget.reportingData?.postId != null &&
                                  widget.reportingData?.postId != '') {
                                _model.reportedPOst =
                                    await ReportedTable().insert({
                                  'reporter': currentUserUid,
                                  'post_id': widget.reportingData?.postId,
                                  'reason': _model.textController.text,
                                  'isprofile': false,
                                });
                                FFAppState().updateUserInfoStruct(
                                  (e) => e
                                    ..updateReportedList(
                                      (e) =>
                                          e.add(widget.reportingData!.postId),
                                    ),
                                );
                                _model.updatePage(() {});
                                _model.chatForpost = await ChatsTable().insert({
                                  'sender': FFAppConstants.YekjaAdminID,
                                  'recipient': widget.reportingData?.profileId,
                                  'sender_name': 'Yekja',
                                  'post_id': widget.reportingData?.postId,
                                });
                                await MessagesTable().insert({
                                  'chat_id': _model.chatForpost?.id,
                                  'message_text':
                                      'Dear \"${widget.reportingData?.profileOwnerName}\"⚠️Your post \"${widget.reportingData?.postTitle}\" has been reported.The Yekja Compliance Team is reviewing the details now. We will contact you with an update as soon as the investigation is complete.',
                                  'recipient': widget.reportingData?.profileId,
                                });
                              } else {
                                _model.reportedProfile =
                                    await ReportedTable().insert({
                                  'reporter': currentUserUid,
                                  'userprofile_id':
                                      widget.reportingData?.profileId,
                                  'reason': _model.textController.text,
                                  'isprofile': true,
                                });
                                FFAppState().updateUserInfoStruct(
                                  (e) => e
                                    ..updateReportedList(
                                      (e) => e.add(
                                          widget.reportingData!.profileId),
                                    ),
                                );
                                _model.updatePage(() {});
                                _model.chatForProfile =
                                    await ChatsTable().insert({
                                  'sender': FFAppConstants.YekjaAdminID,
                                  'recipient': widget.reportingData?.profileId,
                                  'sender_name': 'Yekja',
                                  'post_id': widget.reportingData?.profileId,
                                });
                                await MessagesTable().insert({
                                  'chat_id': _model.chatForProfile?.id,
                                  'message_text':
                                      'Dear \"${widget.reportingData?.profileOwnerName}\"⚠️Your profile has been reported.The Yekja Compliance Team is reviewing the details now. We will contact you with an update as soon as the investigation is complete.',
                                  'recipient': widget.reportingData?.profileId,
                                });
                              }

                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please write a reason.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4900),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).errorSnack,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                    text: FFLocalizations.of(context).getText(
                      '4f0rzqyy' /* Report */,
                    ),
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0x42F25A57),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                      disabledColor:
                          FlutterFlowTheme.of(context).lighterSecBackground,
                      disabledTextColor:
                          FlutterFlowTheme.of(context).bordergray,
                    ),
                  ),
                ],
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
