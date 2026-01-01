import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared_components/custom_snackbar/custom_snackbar_widget.dart';
import '/shared_components/report_bug/report_bug_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_and_rating_model.dart';
export 'review_and_rating_model.dart';

class ReviewAndRatingWidget extends StatefulWidget {
  const ReviewAndRatingWidget({
    super.key,
    this.writerId,
    required this.postItemId,
    required this.writerName,
    required this.chatId,
    this.postOwnerId,
    required this.postCustomerID,
  });

  final String? writerId;
  final String? postItemId;
  final String? writerName;
  final int? chatId;
  final String? postOwnerId;
  final String? postCustomerID;

  @override
  State<ReviewAndRatingWidget> createState() => _ReviewAndRatingWidgetState();
}

class _ReviewAndRatingWidgetState extends State<ReviewAndRatingWidget> {
  late ReviewAndRatingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewAndRatingModel());

    _model.noteTextController ??= TextEditingController();
    _model.noteFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_model.submited,
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 480.0,
            maxHeight: 560.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.0),
              bottomRight: Radius.circular(24.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 8.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bgtfx9oz' /* Would you like to share your e... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyLargeIsCustom,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 42.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9CF58),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.message,
                                          color: FlutterFlowTheme.of(context)
                                              .navBar,
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() => _model
                                                      .communicationScoreValue =
                                                  newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating: _model
                                              .communicationScoreValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .textgray,
                                          itemCount: 5,
                                          itemSize: 16.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '3yq1a0y3' /* Communication */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelSmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 42.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9CF58),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.timer_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .navBar,
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() =>
                                                  _model.reliabilityScoreValue =
                                                      newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating: _model
                                              .reliabilityScoreValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .textgray,
                                          itemCount: 5,
                                          itemSize: 16.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'evzwilu7' /* Reliability */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelSmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 42.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9CF58),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.diamond_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .navBar,
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() =>
                                                  _model.qualityScoreValue =
                                                      newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating:
                                              _model.qualityScoreValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .textgray,
                                          itemCount: 5,
                                          itemSize: 16.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'how5jg7z' /* Quality */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelSmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 42.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9CF58),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.sentiment_satisfied_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .navBar,
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 0.0),
                                        child: RatingBar.builder(
                                          onRatingUpdate: (newValue) =>
                                              safeSetState(() =>
                                                  _model.fairnessScoreValue =
                                                      newValue),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                          direction: Axis.horizontal,
                                          initialRating:
                                              _model.fairnessScoreValue ??= 0.0,
                                          unratedColor:
                                              FlutterFlowTheme.of(context)
                                                  .textgray,
                                          itemCount: 5,
                                          itemSize: 16.0,
                                          glowColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '47gtarkl' /* Fairness */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelSmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.noteTextController,
                                focusNode: _model.noteFocusNode,
                                autofocus: false,
                                readOnly: _model.submited,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'ixl4pva7' /* Review note */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'z01totm5' /* Tell  everyone about your expe... */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .textgray,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
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
                                      color: FlutterFlowTheme.of(context)
                                          .bordergray,
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 12,
                                maxLength: 650,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                enableInteractiveSelection: true,
                                validator: _model.noteTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: _model.submited
                                ? null
                                : () async {
                                    if (widget.postOwnerId == currentUserUid) {
                                      await ReviewsTable().insert({
                                        'post_id': widget.postItemId,
                                        'note': _model.noteTextController.text,
                                        'writer_id': currentUserUid,
                                        'comunication_score': _model
                                            .communicationScoreValue
                                            ?.round(),
                                        'reliability_score': _model
                                            .reliabilityScoreValue
                                            ?.round(),
                                        'fairness_score':
                                            _model.fairnessScoreValue?.round(),
                                        'quality_scsore':
                                            _model.qualityScoreValue?.round(),
                                        'postowner_id': widget.postOwnerId,
                                        'reviewed_user_id':
                                            widget.postCustomerID,
                                        'submitted_post_owner': true,
                                      });
                                      await MessagesTable().insert({
                                        'chat_id': widget.chatId,
                                        'message_text': FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'nl'
                                            ? 'Bedankt voor het achterlaten van een beoordeling! Deze wordt zichtbaar zodra het andere lid zijn of haar beoordeling heeft ingediend. Op naar nog veel mooie uitwisselingen op Yekja! 🎉'
                                            : (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'fa'
                                                ? 'از اینکه نظر خود را ثبت کردید متشکریم! پس از ثبت نظر توسط عضو دیگر، نظر شما نمایش داده خواهد شد. به امید تعامل‌های خوبِ بیشتر در Yekja! 🎉'
                                                : 'Thanks for leaving a review! It’ll show up once the other member submits theirs. Here’s to many more great exchanges on Yekja! 🎉'),
                                        'sent_by': FFAppConstants.YekjaAdminID,
                                        'recipient': widget.postOwnerId,
                                      });
                                    } else {
                                      await ReviewsTable().insert({
                                        'post_id': widget.postItemId,
                                        'note': _model.noteTextController.text,
                                        'writer_id': currentUserUid,
                                        'comunication_score': _model
                                            .communicationScoreValue
                                            ?.round(),
                                        'reliability_score': _model
                                            .reliabilityScoreValue
                                            ?.round(),
                                        'fairness_score':
                                            _model.fairnessScoreValue?.round(),
                                        'quality_scsore':
                                            _model.qualityScoreValue?.round(),
                                        'postowner_id': widget.postOwnerId,
                                        'reviewed_user_id': widget.postOwnerId,
                                        'submitted_post_customer': true,
                                      });
                                      await MessagesTable().insert({
                                        'chat_id': widget.chatId,
                                        'message_text': FFLocalizations.of(
                                                        context)
                                                    .languageCode ==
                                                'nl'
                                            ? 'Bedankt voor het achterlaten van een beoordeling! Deze wordt zichtbaar zodra het andere lid zijn of haar beoordeling heeft ingediend. Op naar nog veel mooie uitwisselingen op Yekja! 🎉'
                                            : (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'fa'
                                                ? 'از اینکه نظر خود را ثبت کردید متشکریم! پس از ثبت نظر توسط عضو دیگر، نظر شما نمایش داده خواهد شد. به امید تعامل‌های خوبِ بیشتر در Yekja! 🎉'
                                                : 'Thanks for leaving a review! It’ll show up once the other member submits theirs. Here’s to many more great exchanges on Yekja! 🎉'),
                                        'sent_by': FFAppConstants.YekjaAdminID,
                                        'recipient': widget.postCustomerID,
                                      });
                                    }

                                    _model.submited = true;
                                    safeSetState(() {});
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: CustomSnackbarWidget(
                                            myText: FFLocalizations.of(context)
                                                .getText(
                                              'jqulx1nc' /* You review is successfully sub... */,
                                            ),
                                            textColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryWhite,
                                            waitMS: 3000,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .successSnack,
                                          ),
                                        );
                                      },
                                    );
                                  },
                            text: FFLocalizations.of(context).getText(
                              'q9biojw1' /* Submit */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).greenInit,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.reportBugModel,
                updateCallback: () => safeSetState(() {}),
                child: ReportBugWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
