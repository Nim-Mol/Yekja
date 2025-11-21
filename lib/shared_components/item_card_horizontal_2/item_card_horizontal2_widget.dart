import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'item_card_horizontal2_model.dart';
export 'item_card_horizontal2_model.dart';

class ItemCardHorizontal2Widget extends StatefulWidget {
  const ItemCardHorizontal2Widget({
    super.key,
    this.mainCatID,
    this.image,
    this.catName,
    this.subCatName,
    this.title,
    this.description,
    this.city,
    this.likes,
    this.postID,
    this.catColor,
  });

  final int? mainCatID;
  final String? image;
  final String? catName;
  final String? subCatName;
  final String? title;
  final String? description;
  final String? city;
  final int? likes;
  final String? postID;
  final Color? catColor;

  @override
  State<ItemCardHorizontal2Widget> createState() =>
      _ItemCardHorizontal2WidgetState();
}

class _ItemCardHorizontal2WidgetState extends State<ItemCardHorizontal2Widget> {
  late ItemCardHorizontal2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemCardHorizontal2Model());

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
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Container(
        height: 100.0,
        constraints: BoxConstraints(
          maxWidth: 480.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                valueOrDefault<String>(
                  widget.image,
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/eastly-rpftt6/assets/uhwqu36njkuw/default_post_image.jpg',
                ),
                width: 100.0,
                height: 9100.0,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Stack(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        widget.catColor,
                                        FlutterFlowTheme.of(context).accent2,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 1.0, 6.0, 1.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.catName,
                                          'category',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryWhite,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodySmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 1.0, 6.0, 1.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.subCatName,
                                          'sub cat',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodySmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.title,
                                'title',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 2.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.description,
                                      'desc',
                                    ),
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .greenInit,
                                      size: 18.0,
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        widget.city,
                                        'city',
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
                                  ].divide(SizedBox(width: 4.0)),
                                ),
                                if (!functions.isNullSingleInt(widget.likes) &&
                                    ((widget.likes != null) &&
                                        (widget.likes! > 0)))
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.favorite_rounded,
                                        color: Color(0xFFCD0808),
                                        size: 18.0,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.likes?.toString(),
                                          'likes',
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
                                    ].divide(SizedBox(width: 4.0)),
                                  ),
                              ].divide(SizedBox(width: 3.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].divide(SizedBox(width: 10.0)).addToStart(SizedBox(width: 0.0)),
        ),
      ),
    );
  }
}
