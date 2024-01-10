import '/flutter_flow/flutter_flow_util.dart';
import 'listing_view_widget.dart' show ListingViewWidget;
import 'package:flutter/material.dart';

class ListingViewModel extends FlutterFlowModel<ListingViewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBarInteractive widget.
  double? ratingBarInteractiveValue;

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
