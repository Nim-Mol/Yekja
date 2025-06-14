import '/all_comoponet/favourite_empty/favourite_empty_widget.dart';
import '/all_comoponet/product_component/product_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'fav_componet_model.dart';
export 'fav_componet_model.dart';

class FavComponetWidget extends StatefulWidget {
  const FavComponetWidget({super.key});

  @override
  State<FavComponetWidget> createState() => _FavComponetWidgetState();
}

class _FavComponetWidgetState extends State<FavComponetWidget> {
  late FavComponetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavComponetModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 63.0, 0.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'jbhbbeak' /* Favorite */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Satoshi',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional(2.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (FFAppState().favouriteList.isNotEmpty) {
                    return ListView(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        16.0,
                        0,
                        24.0,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final favouriteData =
                                  FFAppState().favouriteList.toList();

                              return Wrap(
                                spacing: 16.0,
                                runSpacing: 16.0,
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.start,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: List.generate(favouriteData.length,
                                    (favouriteDataIndex) {
                                  final favouriteDataItem =
                                      favouriteData[favouriteDataIndex];
                                  return Container(
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          810.0) {
                                        return ((MediaQuery.sizeOf(context)
                                                    .width -
                                                56) *
                                            1 /
                                            2);
                                      } else if ((MediaQuery.sizeOf(context)
                                                  .width <=
                                              810.0) &&
                                          (MediaQuery.sizeOf(context).width >=
                                              1280.0)) {
                                        return ((MediaQuery.sizeOf(context)
                                                    .width -
                                                88) *
                                            1 /
                                            4);
                                      } else {
                                        return ((MediaQuery.sizeOf(context)
                                                    .width -
                                                152) *
                                            1 /
                                            8);
                                      }
                                    }(),
                                    height: 227.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: wrapWithModel(
                                      model: _model.productComponentModels
                                          .getModel(
                                        favouriteDataIndex.toString(),
                                        favouriteDataIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: ProductComponentWidget(
                                        key: Key(
                                          'Keypjj_${favouriteDataIndex.toString()}',
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.favouriteEmptyModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FavouriteEmptyWidget(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
