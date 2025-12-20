import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'Splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      FFAppState().citiesApp = [];
      safeSetState(() {});
      FFAppState().SubcatApp = [];
      safeSetState(() {});
      _model.citiesOutput = await CitiesTable().queryRows(
        queryFn: (q) => q,
      );
      _model.loading = true;
      safeSetState(() {});
      for (int loop1Index = 0;
          loop1Index < _model.citiesOutput!.length;
          loop1Index++) {
        final currentLoop1Item = _model.citiesOutput![loop1Index];
        FFAppState().addToCitiesApp(CitiesModelStruct(
          id: currentLoop1Item.id,
          name: currentLoop1Item.name,
        ));
        safeSetState(() {});
      }
      _model.topsubcatOutput = await ViewTopSubcategoriesTable().queryRows(
        queryFn: (q) => q,
      );
      for (int loop2Index = 0;
          loop2Index < _model.topsubcatOutput!.length;
          loop2Index++) {
        final currentLoop2Item = _model.topsubcatOutput![loop2Index];
        FFAppState().addToSubcatApp(SubcatModelStruct(
          mainCatId: currentLoop2Item.mainCatId,
          mainCatName: currentLoop2Item.mainCatName,
          catId: currentLoop2Item.catId,
          catName: currentLoop2Item.catName,
          subCatId: currentLoop2Item.subCatId,
          uniqueSubcatId: currentLoop2Item.uniqueSubcatId,
          subCatName: currentLoop2Item.subCatName,
          effectiveColorHex: currentLoop2Item.effectiveColorHex,
          effectiveIconImage: currentLoop2Item.effectiveIconImage,
          totalLikes: currentLoop2Item.totalLikes,
          catPostCount: currentLoop2Item.catPostCount,
          catPostLikes: currentLoop2Item.catPostLikes,
          fillColorHex: currentLoop2Item.fillColorHex,
          detailTable: currentLoop2Item.detailTable,
          catNameFa: currentLoop2Item.catNameFa,
          subCatNameFa: currentLoop2Item.subCatNameFa,
          mainCatNameFa: currentLoop2Item.mainCatNameFa,
          mainCatNameNl: currentLoop2Item.mainCatNameNl,
          catNameNl: currentLoop2Item.catNameNl,
          subCatNameNl: currentLoop2Item.subCatNameNl,
        ));
        safeSetState(() {});
      }

      context.goNamed(OnboardingPageWidget.routeName);
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2050.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Transform.scale(
                  scaleX: 1.4,
                  scaleY: 1.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/yekja_logo_verified_transparent.png',
                      width: 220.0,
                      height: 128.34,
                      fit: BoxFit.contain,
                      alignment: Alignment(0.0, -1.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: 311.2,
                  height: 228.84,
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/old_man_V5-ezgif.com-gif-maker.gif',
                      width: 267.26,
                      height: 285.0,
                      fit: BoxFit.contain,
                      alignment: Alignment(0.0, 1.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
