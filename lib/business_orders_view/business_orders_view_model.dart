import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'business_orders_view_widget.dart' show BusinessOrdersViewWidget;
import 'package:flutter/material.dart';

class BusinessOrdersViewModel
    extends FlutterFlowModel<BusinessOrdersViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NoDataFound component.
  late NoDataFoundModel noDataFoundModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    noDataFoundModel = createModel(context, () => NoDataFoundModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    noDataFoundModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
