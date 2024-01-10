import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "collection_start_time" field.
  DateTime? _collectionStartTime;
  DateTime? get collectionStartTime => _collectionStartTime;
  bool hasCollectionStartTime() => _collectionStartTime != null;

  // "collection_end_time" field.
  DateTime? _collectionEndTime;
  DateTime? get collectionEndTime => _collectionEndTime;
  bool hasCollectionEndTime() => _collectionEndTime != null;

  // "purchase_time" field.
  DateTime? _purchaseTime;
  DateTime? get purchaseTime => _purchaseTime;
  bool hasPurchaseTime() => _purchaseTime != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "listing_uid" field.
  String? _listingUid;
  String get listingUid => _listingUid ?? '';
  bool hasListingUid() => _listingUid != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "business_id" field.
  String? _businessId;
  String get businessId => _businessId ?? '';
  bool hasBusinessId() => _businessId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "total_original_value" field.
  double? _totalOriginalValue;
  double get totalOriginalValue => _totalOriginalValue ?? 0.0;
  bool hasTotalOriginalValue() => _totalOriginalValue != null;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _quantity = castToType<int>(snapshotData['quantity']);
    _collectionStartTime = snapshotData['collection_start_time'] as DateTime?;
    _collectionEndTime = snapshotData['collection_end_time'] as DateTime?;
    _purchaseTime = snapshotData['purchase_time'] as DateTime?;
    _userId = snapshotData['user_id'] as String?;
    _listingUid = snapshotData['listing_uid'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _orderId = snapshotData['order_id'] as String?;
    _businessId = snapshotData['business_id'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _totalOriginalValue =
        castToType<double>(snapshotData['total_original_value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  double? price,
  int? quantity,
  DateTime? collectionStartTime,
  DateTime? collectionEndTime,
  DateTime? purchaseTime,
  String? userId,
  String? listingUid,
  String? businessName,
  String? orderId,
  String? businessId,
  String? userName,
  double? totalOriginalValue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'quantity': quantity,
      'collection_start_time': collectionStartTime,
      'collection_end_time': collectionEndTime,
      'purchase_time': purchaseTime,
      'user_id': userId,
      'listing_uid': listingUid,
      'business_name': businessName,
      'order_id': orderId,
      'business_id': businessId,
      'user_name': userName,
      'total_original_value': totalOriginalValue,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.price == e2?.price &&
        e1?.quantity == e2?.quantity &&
        e1?.collectionStartTime == e2?.collectionStartTime &&
        e1?.collectionEndTime == e2?.collectionEndTime &&
        e1?.purchaseTime == e2?.purchaseTime &&
        e1?.userId == e2?.userId &&
        e1?.listingUid == e2?.listingUid &&
        e1?.businessName == e2?.businessName &&
        e1?.orderId == e2?.orderId &&
        e1?.businessId == e2?.businessId &&
        e1?.userName == e2?.userName &&
        e1?.totalOriginalValue == e2?.totalOriginalValue;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.price,
        e?.quantity,
        e?.collectionStartTime,
        e?.collectionEndTime,
        e?.purchaseTime,
        e?.userId,
        e?.listingUid,
        e?.businessName,
        e?.orderId,
        e?.businessId,
        e?.userName,
        e?.totalOriginalValue
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
