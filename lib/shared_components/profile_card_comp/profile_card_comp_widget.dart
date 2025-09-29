import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/badge_card2/badge_card2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_card_comp_model.dart';
export 'profile_card_comp_model.dart';

class ProfileCardCompWidget extends StatefulWidget {
  const ProfileCardCompWidget({
    super.key,
    this.image,
    this.name,
    this.rating,
    this.badges,
  });

  final String? image;
  final String? name;
  final double? rating;
  final List<String>? badges;

  @override
  State<ProfileCardCompWidget> createState() => _ProfileCardCompWidgetState();
}

class _ProfileCardCompWidgetState extends State<ProfileCardCompWidget> {
  late ProfileCardCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCardCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).customColor1,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Container(
                              width: 55.0,
                              height: 55.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  widget.image,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/vCkCd1ZRBsxBCRghPNUE/assets/fynuh4uv6z1p/Screenshot_2025-06-27_023329.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.name,
                                  'Hooman Seyyedi',
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
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RatingBarIndicator(
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: Color(0xFFFFA130),
                                        ),
                                        direction: Axis.horizontal,
                                        rating: 4.6,
                                        unratedColor: Color(0xFF95A1AC),
                                        itemCount: 5,
                                        itemSize: 18.0,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.rating?.toString(),
                                          '4.9',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '600ony37' /* Trusted by 88 users */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  wrapWithModel(
                    model: _model.badgeCard2Model1,
                    updateCallback: () => safeSetState(() {}),
                    child: BadgeCard2Widget(
                      text: 'Verified Member',
                      image:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/vCkCd1ZRBsxBCRghPNUE/assets/1mh4i21q5296/shield.png',
                    ),
                  ),
                  wrapWithModel(
                    model: _model.badgeCard2Model2,
                    updateCallback: () => safeSetState(() {}),
                    child: BadgeCard2Widget(
                      text: '30+ completed shipments',
                      image:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/vCkCd1ZRBsxBCRghPNUE/assets/zh5xt2as2zbk/like-ezgif.com-optimize.gif',
                    ),
                  ),
                  wrapWithModel(
                    model: _model.badgeCard2Model3,
                    updateCallback: () => safeSetState(() {}),
                    child: BadgeCard2Widget(
                      text: 'Iran-based',
                      image:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/hQoUiD9TgUz6yl6pKBrR/assets/av2im86mhw81/iran.png',
                    ),
                  ),
                  wrapWithModel(
                    model: _model.badgeCard2Model4,
                    updateCallback: () => safeSetState(() {}),
                    child: BadgeCard2Widget(
                      text: 'Loyal Member - since 2024',
                      image:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/vCkCd1ZRBsxBCRghPNUE/assets/q6xu7g5xainu/loyalty.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
