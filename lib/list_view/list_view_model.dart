import '/backend/backend.dart';
import '/components/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'list_view_widget.dart' show ListViewWidget;
import 'package:flutter/material.dart';

class ListViewModel extends FlutterFlowModel<ListViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<ListingsRecord>>? firestoreRequestCompleter1;
  Completer<List<ListingsRecord>>? firestoreRequestCompleter2;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;
  // State field(s) for ChoiceChips widget.
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for SearchFieldUser widget.
  FocusNode? searchFieldUserFocusNode;
  TextEditingController? searchFieldUserController;
  String? Function(BuildContext, String?)? searchFieldUserControllerValidator;
  // Algolia Search Results from action on SearchFieldUser
  List<ListingsRecord>? algoliaSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarFlotingModel.dispose();
    searchFieldUserFocusNode?.dispose();
    searchFieldUserController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
