import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'verify_code_model.dart';
export 'verify_code_model.dart';

class VerifyCodeWidget extends StatefulWidget {
  const VerifyCodeWidget({
    super.key,
    required this.userEmail,
    required this.userName,
    required this.password,
    required this.confirmPassword,
  });

  /// use for email verfication with Token
  final String? userEmail;

  final String? userName;
  final String? password;
  final String? confirmPassword;

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget>
    with TickerProviderStateMixin {
  late VerifyCodeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyCodeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 60.0.ms,
            duration: 1500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeIn,
            delay: 60.0.ms,
            duration: 1510.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 480.0,
          maxHeight: 500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 50.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  0,
                  16.0,
                  0,
                  24.0,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'hy8t8fp9' /* A confimation code was sent vi... */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                        if ((_model.verificationMessage == false) &&
                            (_model.verificationMessage != null))
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'unuifogx' /* Wrong or expired code! */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      color: FlutterFlowTheme.of(context).error,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .labelLargeIsCustom,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 32.0, 20.0, 32.0),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyLargeIsCustom,
                            ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: false,
                        focusNode: _model.pinCodeFocusNode,
                        enablePinAutofill: false,
                        errorTextSpace: 16.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 51.0,
                          fieldWidth: 51.0,
                          borderWidth: 1.0,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          inactiveColor: Color(0xFFDCDCDC),
                          selectedColor: FlutterFlowTheme.of(context).primary,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Container(
                        width: 60.0,
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowTimer(
                                initialTime: _model.timerInitialTimeMs,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  milliSecond: false,
                                ),
                                controller: _model.timerController,
                                updateStateInterval:
                                    Duration(milliseconds: 1000),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.timerMilliseconds = value;
                                  _model.timerValue = displayTime;
                                  if (shouldUpdate) safeSetState(() {});
                                },
                                onEnded: () async {
                                  safeSetState(() {});
                                },
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleMediumIsCustom,
                                    ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 105.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x5A12B886),
                                      width: 5.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                              ),
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 105.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Color(0x5A12B886),
                                      width: 5.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_model.timerMilliseconds == 00)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await actions.customSignUpWithEmail(
                            widget.userEmail!,
                            widget.password!,
                            widget.confirmPassword!,
                          );
                          _model.timerController.onResetTimer();

                          safeSetState(() {});
                          _model.timerController.onStartTimer();
                        },
                        text: FFLocalizations.of(context).getText(
                          'vra2s4j2' /* Resend */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Satoshi',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var _shouldSetState = false;
                        _model.verificationMessage =
                            await actions.verifyEmailWithToken(
                          widget.userEmail!,
                          _model.pinCodeController!.text,
                        );
                        _shouldSetState = true;
                        if (_model.verificationMessage == true) {
                          await Future.delayed(
                            Duration(
                              milliseconds: 3000,
                            ),
                          );
                          _model.userExt = await UserExtTable().insert({
                            'id': currentUserUid,
                            'email': currentUserEmail,
                            'user_name': widget.userName,
                          });
                          _shouldSetState = true;
                          await ConsentsTable().insert({
                            'user_id': currentUserUid,
                          });
                          // Creat Chat ROOM
                          _model.yekjaChat2Customer =
                              await ChatsTable().insert({
                            'recipient': currentUserUid,
                            'sender_name': 'Yekja',
                            'sender': FFAppConstants.YekjaAdminID,
                            'post_id': FFAppConstants.YekjaAdminID,
                          });
                          _shouldSetState = true;
                          // Send message
                          await MessagesTable().insert({
                            'message_text':
                                'Hi Welcome to Yekja! You can reach out to our community members and start trading, requesting or offering support. In case of any issues please make sure to contact us. Wishing you a nice experience!',
                            'recipient': currentUserUid,
                            'chat_id': _model.yekjaChat2Customer?.id,
                            'sent_by': FFAppConstants.YekjaAdminID,
                          });
                        } else {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        context.goNamed(SignInPageWidget.routeName);

                        if (_shouldSetState) safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '62qr2zha' /* Verify Now */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).greenInit,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Satoshi',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
