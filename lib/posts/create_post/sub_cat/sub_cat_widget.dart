import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'sub_cat_model.dart';
export 'sub_cat_model.dart';

class SubCatWidget extends StatefulWidget {
  const SubCatWidget({
    super.key,
    required this.catID,
  });

  final int? catID;

  @override
  State<SubCatWidget> createState() => _SubCatWidgetState();
}

class _SubCatWidgetState extends State<SubCatWidget> {
  late SubCatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubCatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      constraints: BoxConstraints(
        minHeight: 700.0,
        maxWidth: 480.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        's5qf1eaq' /* Which category
fits your post ... */
                        ,
                      ),
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineLargeIsCustom,
                              ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        's3fm07uu' /* Helps others find your post */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context)
                          .headlineLarge
                          .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .headlineLargeFamily,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .headlineLargeIsCustom,
                          ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<SubCategoriesRow>>(
                future: SubCategoriesTable().queryRows(
                  queryFn: (q) => q.eqOrNull(
                    'cat_id',
                    FFAppState().postState.catId,
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
                  List<SubCategoriesRow> wrapSubCategoriesRowList =
                      snapshot.data!;

                  return Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: List.generate(wrapSubCategoriesRowList.length,
                        (wrapIndex) {
                      final wrapSubCategoriesRow =
                          wrapSubCategoriesRowList[wrapIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().updatePostStateStruct(
                            (e) => e
                              ..subCatId = wrapSubCategoriesRow.subCatId
                              ..subCatName = wrapSubCategoriesRow.subCatName,
                          );
                          _model.updatePage(() {});
                        },
                        child: Container(
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FFAppState().postState.subCatId ==
                                      wrapSubCategoriesRow.subCatId
                                  ? FlutterFlowTheme.of(context).primaryText
                                  : FlutterFlowTheme.of(context).darkgray,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Text(
                                  valueOrDefault<String>(
                                    FFLocalizations.of(context).languageCode ==
                                            'fa'
                                        ? wrapSubCategoriesRow.subCatNameFa
                                        : wrapSubCategoriesRow.subCatName,
                                    'category',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 8.0))
                                .addToStart(SizedBox(width: 8.0))
                                .addToEnd(SizedBox(width: 8.0)),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ]
                .addToStart(SizedBox(height: 16.0))
                .addToEnd(SizedBox(height: 50.0)),
          ),
        ),
      ),
    );
  }
}
