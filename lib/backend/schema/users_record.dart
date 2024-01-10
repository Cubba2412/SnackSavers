import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "liked_listing_uids" field.
  List<String>? _likedListingUids;
  List<String> get likedListingUids => _likedListingUids ?? const [];
  bool hasLikedListingUids() => _likedListingUids != null;

  // "ABN_number" field.
  int? _aBNNumber;
  int get aBNNumber => _aBNNumber ?? 0;
  bool hasABNNumber() => _aBNNumber != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email_notifications" field.
  bool? _emailNotifications;
  bool get emailNotifications => _emailNotifications ?? false;
  bool hasEmailNotifications() => _emailNotifications != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "street_address" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  bool hasStreetAddress() => _streetAddress != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "number_of_ratings" field.
  int? _numberOfRatings;
  int get numberOfRatings => _numberOfRatings ?? 0;
  bool hasNumberOfRatings() => _numberOfRatings != null;

  // "ratings" field.
  List<int>? _ratings;
  List<int> get ratings => _ratings ?? const [];
  bool hasRatings() => _ratings != null;

  // "stripeAccountId" field.
  String? _stripeAccountId;
  String get stripeAccountId => _stripeAccountId ?? '';
  bool hasStripeAccountId() => _stripeAccountId != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likedListingUids = getDataList(snapshotData['liked_listing_uids']);
    _aBNNumber = castToType<int>(snapshotData['ABN_number']);
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _emailNotifications = snapshotData['email_notifications'] as bool?;
    _location = snapshotData['location'] as LatLng?;
    _streetAddress = snapshotData['street_address'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _numberOfRatings = castToType<int>(snapshotData['number_of_ratings']);
    _ratings = getDataList(snapshotData['ratings']);
    _stripeAccountId = snapshotData['stripeAccountId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  int? aBNNumber,
  String? displayName,
  String? phoneNumber,
  bool? emailNotifications,
  LatLng? location,
  String? streetAddress,
  double? rating,
  int? numberOfRatings,
  String? stripeAccountId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'ABN_number': aBNNumber,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'email_notifications': emailNotifications,
      'location': location,
      'street_address': streetAddress,
      'rating': rating,
      'number_of_ratings': numberOfRatings,
      'stripeAccountId': stripeAccountId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likedListingUids, e2?.likedListingUids) &&
        e1?.aBNNumber == e2?.aBNNumber &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.emailNotifications == e2?.emailNotifications &&
        e1?.location == e2?.location &&
        e1?.streetAddress == e2?.streetAddress &&
        e1?.rating == e2?.rating &&
        e1?.numberOfRatings == e2?.numberOfRatings &&
        listEquality.equals(e1?.ratings, e2?.ratings) &&
        e1?.stripeAccountId == e2?.stripeAccountId;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.likedListingUids,
        e?.aBNNumber,
        e?.displayName,
        e?.phoneNumber,
        e?.emailNotifications,
        e?.location,
        e?.streetAddress,
        e?.rating,
        e?.numberOfRatings,
        e?.ratings,
        e?.stripeAccountId
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
