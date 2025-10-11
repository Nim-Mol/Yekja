import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/nav_bar_core/nav_bar_core_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    super.key,
    this.userAvatar,
  });

  final String? userAvatar;

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: 5000.0,
            height: 60.0,
            child: custom_widgets.LtrWrapper(
              width: 5000.0,
              height: 60.0,
              builder: () => NavBarCoreWidget(
                userAvatar: widget.userAvatar,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
