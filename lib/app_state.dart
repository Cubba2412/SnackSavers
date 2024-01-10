import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _futureRelease = prefs.getBool('ff_futureRelease') ?? _futureRelease;
    });
    _safeInit(() {
      _Categories = prefs.getStringList('ff_Categories') ?? _Categories;
    });
    _safeInit(() {
      _Cafe = prefs.getString('ff_Cafe') ?? _Cafe;
    });
    _safeInit(() {
      _Restaurant = prefs.getString('ff_Restaurant') ?? _Restaurant;
    });
    _safeInit(() {
      _Bakery = prefs.getString('ff_Bakery') ?? _Bakery;
    });
    _safeInit(() {
      _detailsSubmitted =
          prefs.getBool('ff_detailsSubmitted') ?? _detailsSubmitted;
    });
    _safeInit(() {
      _newBusinessUser =
          prefs.getBool('ff_newBusinessUser') ?? _newBusinessUser;
    });
    _safeInit(() {
      _ShowBusinessColumn =
          prefs.getBool('ff_ShowBusinessColumn') ?? _ShowBusinessColumn;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _futureRelease = false;
  bool get futureRelease => _futureRelease;
  set futureRelease(bool value) {
    _futureRelease = value;
    prefs.setBool('ff_futureRelease', value);
  }

  String _activePage = 'ListView';
  String get activePage => _activePage;
  set activePage(String value) {
    _activePage = value;
  }

  bool _algoliaSearched = false;
  bool get algoliaSearched => _algoliaSearched;
  set algoliaSearched(bool value) {
    _algoliaSearched = value;
  }

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool value) {
    _showFullList = value;
  }

  List<String> _Categories = ['Cafe', 'Restaurant', 'Bakery'];
  List<String> get Categories => _Categories;
  set Categories(List<String> value) {
    _Categories = value;
    prefs.setStringList('ff_Categories', value);
  }

  void addToCategories(String value) {
    _Categories.add(value);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void removeFromCategories(String value) {
    _Categories.remove(value);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void removeAtIndexFromCategories(int index) {
    _Categories.removeAt(index);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _Categories[index] = updateFn(_Categories[index]);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void insertAtIndexInCategories(int index, String value) {
    _Categories.insert(index, value);
    prefs.setStringList('ff_Categories', _Categories);
  }

  String _Cafe = 'Cafe';
  String get Cafe => _Cafe;
  set Cafe(String value) {
    _Cafe = value;
    prefs.setString('ff_Cafe', value);
  }

  String _Restaurant = 'Restaurant';
  String get Restaurant => _Restaurant;
  set Restaurant(String value) {
    _Restaurant = value;
    prefs.setString('ff_Restaurant', value);
  }

  String _Bakery = 'Bakery';
  String get Bakery => _Bakery;
  set Bakery(String value) {
    _Bakery = value;
    prefs.setString('ff_Bakery', value);
  }

  bool _photoUploadedForListing = false;
  bool get photoUploadedForListing => _photoUploadedForListing;
  set photoUploadedForListing(bool value) {
    _photoUploadedForListing = value;
  }

  bool _categoryFilter = false;
  bool get categoryFilter => _categoryFilter;
  set categoryFilter(bool value) {
    _categoryFilter = value;
  }

  bool _detailsSubmitted = false;
  bool get detailsSubmitted => _detailsSubmitted;
  set detailsSubmitted(bool value) {
    _detailsSubmitted = value;
    prefs.setBool('ff_detailsSubmitted', value);
  }

  List<DocumentReference> _pushNotifications = [];
  List<DocumentReference> get pushNotifications => _pushNotifications;
  set pushNotifications(List<DocumentReference> value) {
    _pushNotifications = value;
  }

  void addToPushNotifications(DocumentReference value) {
    _pushNotifications.add(value);
  }

  void removeFromPushNotifications(DocumentReference value) {
    _pushNotifications.remove(value);
  }

  void removeAtIndexFromPushNotifications(int index) {
    _pushNotifications.removeAt(index);
  }

  void updatePushNotificationsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _pushNotifications[index] = updateFn(_pushNotifications[index]);
  }

  void insertAtIndexInPushNotifications(int index, DocumentReference value) {
    _pushNotifications.insert(index, value);
  }

  bool _newBusinessUser = true;
  bool get newBusinessUser => _newBusinessUser;
  set newBusinessUser(bool value) {
    _newBusinessUser = value;
    prefs.setBool('ff_newBusinessUser', value);
  }

  bool _ShowBusinessColumn = true;
  bool get ShowBusinessColumn => _ShowBusinessColumn;
  set ShowBusinessColumn(bool value) {
    _ShowBusinessColumn = value;
    prefs.setBool('ff_ShowBusinessColumn', value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
