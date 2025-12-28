import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'shout_out_card_model.dart';
export 'shout_out_card_model.dart';

class ShoutOutCardWidget extends StatefulWidget {
  const ShoutOutCardWidget({
    super.key,
    required this.shoutOutId,
    bool? consentShowAvatar,
  }) : this.consentShowAvatar = consentShowAvatar ?? true;

  final int? shoutOutId;
  final bool consentShowAvatar;

  @override
  State<ShoutOutCardWidget> createState() => _ShoutOutCardWidgetState();
}

class _ShoutOutCardWidgetState extends State<ShoutOutCardWidget>
    with TickerProviderStateMixin {
  late ShoutOutCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoutOutCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!loggedIn) {
        return;
      }
      _model.liked = await PostLikeRelationTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'shoutout_id',
              widget.shoutOutId,
            )
            .eqOrNull(
              'liked_by',
              currentUserUid,
            ),
      );
      if (_model.liked != null && (_model.liked)!.isNotEmpty) {
        _model.isLiked = true;
        safeSetState(() {});
      } else {
        _model.isLiked = false;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 580.0.ms,
            duration: 1110.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
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
      alignment: AlignmentDirectional(-1.0, -1.0),
      child: FutureBuilder<List<ViewShoutoutRow>>(
        future: ViewShoutoutTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.shoutOutId,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).greenInit,
                  size: 50.0,
                ),
              ),
            );
          }
          List<ViewShoutoutRow> containerViewShoutoutRowList = snapshot.data!;

          final containerViewShoutoutRow =
              containerViewShoutoutRowList.isNotEmpty
                  ? containerViewShoutoutRowList.first
                  : null;

          return Container(
            width: 193.5,
            height: 140.5,
            constraints: BoxConstraints(
              minHeight: 190.0,
              maxWidth: 300.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).navBar,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).tertiary,
                width: 0.3,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            (containerViewShoutoutRow?.profileAvatar != null &&
                                        containerViewShoutoutRow
                                                ?.profileAvatar !=
                                            '') &&
                                    widget.consentShowAvatar
                                ? containerViewShoutoutRow!.profileAvatar!
                                : FFAppConstants.profileAvatarCircular,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 2.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'r6m3h1jr' /* +10 Points */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).yellow1,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  containerViewShoutoutRow?.username,
                                  'Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryWhite,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 6.0, 0.0),
                                      child: RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFFA130),
                                        ),
                                        direction: Axis.horizontal,
                                        rating: valueOrDefault<double>(
                                          containerViewShoutoutRow?.reviewScore,
                                          0.0,
                                        ),
                                        unratedColor: Color(0xFF95A1AC),
                                        itemCount: 5,
                                        itemSize: 10.0,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            containerViewShoutoutRow
                                                ?.reviewScore
                                                ?.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryWhite,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        '${FFLocalizations.of(context).getVariableText(
                                          enText: '(',
                                          faText: '(',
                                          nlText: '(',
                                        )}${valueOrDefault<String>(
                                          containerViewShoutoutRow?.ratings
                                              ?.toString(),
                                          '0',
                                        )}${FFLocalizations.of(context).getVariableText(
                                          enText: 'reviews',
                                          faText: 'بازخورد',
                                          nlText: 'Beoordelingen',
                                        )}${FFLocalizations.of(context).getVariableText(
                                          enText: ')',
                                          faText: ')',
                                          nlText: ')',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryWhite,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 2.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getVariableText(
                                    enText: valueOrDefault<String>(
                                      containerViewShoutoutRow?.header,
                                      'Thanks!',
                                    ),
                                    faText: valueOrDefault<String>(
                                      containerViewShoutoutRow?.headerFa,
                                      'سپاس!',
                                    ),
                                    nlText: valueOrDefault<String>(
                                      containerViewShoutoutRow?.headerNl,
                                      'Dankje!',
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displaySmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryWhite,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .displaySmallIsCustom,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context)
                                      .getVariableText(
                                        enText: valueOrDefault<String>(
                                          containerViewShoutoutRow?.description,
                                          'description',
                                        ),
                                        faText: valueOrDefault<String>(
                                          containerViewShoutoutRow
                                              ?.descriptionFa,
                                          'description',
                                        ),
                                        nlText: valueOrDefault<String>(
                                          containerViewShoutoutRow
                                              ?.descriptionNl,
                                          'description',
                                        ),
                                      )
                                      .maybeHandleOverflow(
                                        maxChars: 150,
                                        replacement: '…',
                                      ),
                                  maxLines: 3,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryWhite,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
