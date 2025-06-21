import '/components_yekja/botton_standard/botton_standard_widget.dart';
import '/components_yekja/interests_card/interests_card_widget.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'questionair_page_model.dart';
export 'questionair_page_model.dart';

class QuestionairPageWidget extends StatefulWidget {
  const QuestionairPageWidget({super.key});

  static String routeName = 'QuestionairPage';
  static String routePath = '/questionairPage';

  @override
  State<QuestionairPageWidget> createState() => _QuestionairPageWidgetState();
}

class _QuestionairPageWidgetState extends State<QuestionairPageWidget> {
  late QuestionairPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionairPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: PageView(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                            maxHeight: 850.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nbdummsk' /* Where are you located? */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'y5itzz6t' /* So we can better match you wit... */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey: '',
                                        androidGoogleMapsApiKey: '',
                                        webGoogleMapsApiKey: '',
                                        onSelect: (place) async {
                                          safeSetState(() =>
                                              _model.placePickerValue = place);
                                        },
                                        defaultText:
                                            FFLocalizations.of(context).getText(
                                          '1295uiwr' /* Select Location */,
                                        ),
                                        icon: Icon(
                                          Icons.place,
                                          color: FlutterFlowTheme.of(context)
                                              .green1,
                                          size: 20.0,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20.0))
                                      .addToStart(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.bottonStandardModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: BottonStandardWidget(
                                    buttontext: 'Next',
                                    onPressed: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                            maxHeight: 850.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'tpkopas3' /* How do you want to use Yekja? */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'jetsdu3f' /* Select all the ways you'd like... */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          wrapWithModel(
                                            model: _model.interestsCardModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            updateOnChange: true,
                                            child: InterestsCardWidget(
                                              interestName: 'Offer help',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/7g1opavbh9kw/helping-hand.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Get help',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/vbh4x66bdte9/help.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel3,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Exchange items or skills',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/uk9o5p7yuqbw/exchange.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel4,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Sell',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/amz0kzj9u36g/payment-method_(1).png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel5,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Buy',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/slgwkex7kpzr/shopping-cart.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel6,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Rent',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/y9kxtc9c07s3/rent.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel7,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Organize events',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/y8ttfz1k4i6w/calendar-date.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel8,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Join events',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/nu1jxpedx8y5/add-friend.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel9,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Hire someone in Iran',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/av2im86mhw81/iran.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel10,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Send or receive something from Iran',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/ido926z2zr6x/send.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel11,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Arrange a service from Iran',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/za3hqn1kgv2r/work-from-home.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel12,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Connect with my community',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/cdkbj58u0u7f/team.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel13,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Give something away',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/z3a2cix8n0m7/giving.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel14,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'I’m just curious',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/o3tns2mjkvux/menu.png',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20.0))
                                      .addToStart(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.bottonStandardModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: BottonStandardWidget(
                                    buttontext: 'Next',
                                    onPressed: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                            maxHeight: 850.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'g5kggsww' /* Ready to swap? */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'eng9z0mt' /* Got something others could use... */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Wrap(
                                          spacing: 2.0,
                                          runSpacing: 0.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel15,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Skills & Help',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/0v89c8dpqzjo/pencil.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel16,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Education & Books',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/e69zuv4wt6q7/book.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel17,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Furniture & Home supplies',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/eoqiasrci08p/sofa.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel18,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Repairs & Fixes',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/xm3v6bgta05o/mechanic.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel19,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Room or house swaps',
                                                image:
                                                    'http://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/ydiohnzlj7vl/homes.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel20,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Healthcare',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/se0v2boo46bm/tooth.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel21,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Tools & Equipment',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/5ie4gn04qc2d/drill.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel22,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Family & Kids items',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/obgcc3z7c8h1/onesie.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel23,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Tech support',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/obgcc3z7c8h1/onesie.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel24,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Clothes & Gears',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/690im6xdwo57/fashion.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel25,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Cooking & Meals\n\n',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/9hkvftf9rlxo/sharing.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel26,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Bikes & Scooters',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/c91v1q0by20h/transport.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel27,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Deliveries',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/8iwqzzjfmggj/free-shipping.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel28,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Professional advise',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/c91v1q0by20h/transport.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel29,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName:
                                                    'Carpool or ride offers',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/i8qvjtleydf3/car.png',
                                              ),
                                            ),
                                            wrapWithModel(
                                              model:
                                                  _model.interestsCardModel30,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: InterestsCardWidget(
                                                interestName: 'Open for ideas',
                                                image:
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/o3tns2mjkvux/menu.png',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20.0))
                                      .addToStart(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.bottonStandardModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: BottonStandardWidget(
                                    buttontext: 'Next',
                                    onPressed: () async {
                                      await _model.pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 430.0,
                            maxHeight: 850.0,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nro0no3y' /* What would you host or attend? */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '8p8vwszd' /* Host your own or join others —... */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Wrap(
                                        spacing: 2.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          wrapWithModel(
                                            model: _model.interestsCardModel31,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Game nights',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/i7qqzw1254nb/poker.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel32,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Poetry or book circles',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/gfldg0w6ituu/book-club.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel33,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Walk & chat',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/ezo37ltbchv6/tent_(1).png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel34,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Park gatherings',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/ezo37ltbchv6/tent_(1).png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel35,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Movie nights',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/82ifcrlg1r1u/video-player.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel36,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Potlucks',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/byn1uydn1dtk/potluck.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel37,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Jam sessions',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/03dcsqjno428/jamming.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel38,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Storytelling nights',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/cv89oqs21vhh/storytelling.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel39,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Political debates',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/y9kxtc9c07s3/rent.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel40,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Dancing events',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/y9kxtc9c07s3/rent.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel41,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Language exchange',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/9camdkyxro64/languages.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel42,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Sport events',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/cnjqu30qy2um/sports.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel43,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Meditation or yoga',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/qqbyoj68gejg/meditation.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel44,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'Newcomer or refugee welcome walks',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/uvtmi1s6ubq7/parade.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel45,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName: 'Online events',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/mnaekq0hqnqr/webinar.png',
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model.interestsCardModel46,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: InterestsCardWidget(
                                              interestName:
                                                  'I’ll suggest my own',
                                              image:
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/o3tns2mjkvux/menu.png',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 20.0))
                                      .addToStart(SizedBox(height: 20.0)),
                                ),
                                wrapWithModel(
                                  model: _model.bottonStandardModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: BottonStandardWidget(
                                    buttontext: 'Continue',
                                    onPressed: () async {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: smooth_page_indicator.SmoothPageIndicator(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      count: 4,
                      axisDirection: Axis.horizontal,
                      onDotClicked: (i) async {
                        await _model.pageViewController!.animateToPage(
                          i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                        safeSetState(() {});
                      },
                      effect: smooth_page_indicator.SlideEffect(
                        spacing: 8.0,
                        radius: 8.0,
                        dotWidth: 40.0,
                        dotHeight: 6.0,
                        dotColor: FlutterFlowTheme.of(context).green1,
                        activeDotColor: FlutterFlowTheme.of(context).primary,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
