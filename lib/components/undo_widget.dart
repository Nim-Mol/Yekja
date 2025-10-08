import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'undo_model.dart';
export 'undo_model.dart';

class UndoWidget extends StatefulWidget {
  const UndoWidget({
    super.key,
    this.chatId,
    this.recepient,
    this.sender,
  });

  final int? chatId;
  final String? recepient;
  final String? sender;

  @override
  State<UndoWidget> createState() => _UndoWidgetState();
}

class _UndoWidgetState extends State<UndoWidget> with TickerProviderStateMixin {
  late UndoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UndoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 3500,
        ),
      );
      Navigator.pop(context);
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(-3.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 300.0.ms,
            duration: 1000.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 120.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (currentUserUid == widget.sender) {
                    await ChatsTable().update(
                      data: {
                        'sender_deleted_at': supaSerialize<DateTime>(null),
                      },
                      matchingRows: (rows) => rows
                          .eqOrNull(
                            'id',
                            widget.chatId,
                          )
                          .eqOrNull(
                            'sender',
                            widget.sender,
                          ),
                    );
                    Navigator.pop(context);
                  } else {
                    await ChatsTable().update(
                      data: {
                        'recipient_deleted_at': supaSerialize<DateTime>(null),
                      },
                      matchingRows: (rows) => rows
                          .eqOrNull(
                            'id',
                            widget.chatId,
                          )
                          .eqOrNull(
                            'recipient',
                            widget.recepient,
                          ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).greenInit,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zj7g28ts' /* Undo */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ),
        ],
      ),
    );
  }
}
