import '/components/nav_bar_floting_widget.dart';
import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'favourite_view_widget.dart' show FavouriteViewWidget;
import 'package:flutter/material.dart';

class FavouriteViewModel extends FlutterFlowModel<FavouriteViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NoDataFound component.
  late NoDataFoundModel noDataFoundModel;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noDataFoundModel = createModel(context, () => NoDataFoundModel());
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    noDataFoundModel.dispose();
    navBarFlotingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
