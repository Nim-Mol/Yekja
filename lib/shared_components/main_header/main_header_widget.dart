import '/flutter_flow/flutter_flow_util.dart';
import '/shared_components/main_header_core/main_header_core_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'main_header_model.dart';
export 'main_header_model.dart';

class MainHeaderWidget extends StatefulWidget {
  const MainHeaderWidget({super.key});

  @override
  State<MainHeaderWidget> createState() => _MainHeaderWidgetState();
}

class _MainHeaderWidgetState extends State<MainHeaderWidget> {
  late MainHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainHeaderModel());

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
        Container(
          width: 5000.0,
          height: 70.0,
          child: custom_widgets.LtrWrapper(
            width: 5000.0,
            height: 70.0,
            builder: () => MainHeaderCoreWidget(),
          ),
        ),
      ],
    );
  }
}
