import '/flutter_flow/flutter_flow_util.dart';
import 'app_settings_widget.dart' show AppSettingsWidget;
import 'package:flutter/material.dart';

class AppSettingsModel extends FlutterFlowModel<AppSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for pushNoticfications widget.
  bool? pushNoticficationsValue;
  // State field(s) for emailNotifications widget.
  bool? emailNotificationsValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
