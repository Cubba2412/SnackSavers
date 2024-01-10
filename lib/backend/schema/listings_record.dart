import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListingsRecord extends FirestoreRecord {
  ListingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "collection_time_start" field.
  DateTime? _collectionTimeStart;
  DateTime? get collectionTimeStart => _collectionTimeStart;
  bool hasCollectionTimeStart() => _collectionTimeStart != null;

  // "collection_time_end" field.
  DateTime? _collectionTimeEnd;
  DateTime? get collectionTimeEnd => _collectionTimeEnd;
  bool hasCollectionTimeEnd() => _collectionTimeEnd != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "street_address" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  bool hasStreetAddress() => _streetAddress != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "listing_uid" field.
  String? _listingUid;
  String get listingUid => _listingUid ?? '';
  bool hasListingUid() => _listingUid != null;

  // "business_uid" field.
  String? _businessUid;
  String get businessUid => _businessUid ?? '';
  bool hasBusinessUid() => _businessUid != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "original_value" field.
  double? _originalValue;
  double get originalValue => _originalValue ?? 0.0;
  bool hasOriginalValue() => _originalValue != null;

  // "creation_time" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  bool hasCreationTime() => _creationTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _collectionTimeStart = snapshotData['collection_time_start'] as DateTime?;
    _collectionTimeEnd = snapshotData['collection_time_end'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _streetAddress = snapshotData['street_address'] as String?;
    _category = snapshotData['category'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _listingUid = snapshotData['listing_uid'] as String?;
    _businessUid = snapshotData['business_uid'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _originalValue = castToType<double>(snapshotData['original_value']);
    _creationTime = snapshotData['creation_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listings');

  static Stream<ListingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListingsRecord.fromSnapshot(s));

  static Future<ListingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListingsRecord.fromSnapshot(s));

  static ListingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListingsRecord._(reference, mapFromFirestore(data));

  static ListingsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ListingsRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'description': snapshot.data['description'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'quantity': convertAlgoliaParam(
            snapshot.data['quantity'],
            ParamType.int,
            false,
          ),
          'collection_time_start': convertAlgoliaParam(
            snapshot.data['collection_time_start'],
            ParamType.DateTime,
            false,
          ),
          'collection_time_end': convertAlgoliaParam(
            snapshot.data['collection_time_end'],
            ParamType.DateTime,
            false,
          ),
          'location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'street_address': snapshot.data['street_address'],
          'category': snapshot.data['category'],
          'photo_url': snapshot.data['photo_url'],
          'listing_uid': snapshot.data['listing_uid'],
          'business_uid': snapshot.data['business_uid'],
          'business_name': snapshot.data['business_name'],
          'original_value': convertAlgoliaParam(
            snapshot.data['original_value'],
            ParamType.double,
            false,
          ),
          'creation_time': convertAlgoliaParam(
            snapshot.data['creation_time'],
            ParamType.DateTime,
            false,
          ),
          'updated_time': convertAlgoliaParam(
            snapshot.data['updated_time'],
            ParamType.DateTime,
            false,
          ),
        },
        ListingsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ListingsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'listings',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ListingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListingsRecordData({
  String? title,
  String? description,
  double? price,
  int? quantity,
  DateTime? collectionTimeStart,
  DateTime? collectionTimeEnd,
  LatLng? location,
  String? streetAddress,
  String? category,
  String? photoUrl,
  String? listingUid,
  String? businessUid,
  String? businessName,
  double? originalValue,
  DateTime? creationTime,
  DateTime? updatedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'quantity': quantity,
      'collection_time_start': collectionTimeStart,
      'collection_time_end': collectionTimeEnd,
      'location': location,
      'street_address': streetAddress,
      'category': category,
      'photo_url': photoUrl,
      'listing_uid': listingUid,
      'business_uid': businessUid,
      'business_name': businessName,
      'original_value': originalValue,
      'creation_time': creationTime,
      'updated_time': updatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListingsRecordDocumentEquality implements Equality<ListingsRecord> {
  const ListingsRecordDocumentEquality();

  @override
  bool equals(ListingsRecord? e1, ListingsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.quantity == e2?.quantity &&
        e1?.collectionTimeStart == e2?.collectionTimeStart &&
        e1?.collectionTimeEnd == e2?.collectionTimeEnd &&
        e1?.location == e2?.location &&
        e1?.streetAddress == e2?.streetAddress &&
        e1?.category == e2?.category &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.listingUid == e2?.listingUid &&
        e1?.businessUid == e2?.businessUid &&
        e1?.businessName == e2?.businessName &&
        e1?.originalValue == e2?.originalValue &&
        e1?.creationTime == e2?.creationTime &&
        e1?.updatedTime == e2?.updatedTime;
  }

  @override
  int hash(ListingsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.price,
        e?.quantity,
        e?.collectionTimeStart,
        e?.collectionTimeEnd,
        e?.location,
        e?.streetAddress,
        e?.category,
        e?.photoUrl,
        e?.listingUid,
        e?.businessUid,
        e?.businessName,
        e?.originalValue,
        e?.creationTime,
        e?.updatedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ListingsRecord;
}
