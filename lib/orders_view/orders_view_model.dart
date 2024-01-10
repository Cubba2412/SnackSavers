import '/backend/backend.dart';
import '/components/no_data_found_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'orders_view_widget.dart' show OrdersViewWidget;
import 'package:flutter/material.dart';

class OrdersViewModel extends FlutterFlowModel<OrdersViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<OrdersRecord>>? firestoreRequestCompleter;
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

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
