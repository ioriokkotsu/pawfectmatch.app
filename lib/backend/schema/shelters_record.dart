import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SheltersRecord extends FirestoreRecord {
  SheltersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "shelterID" field.
  DocumentReference? _shelterID;
  DocumentReference? get shelterID => _shelterID;
  bool hasShelterID() => _shelterID != null;

  // "shelterName" field.
  String? _shelterName;
  String get shelterName => _shelterName ?? '';
  bool hasShelterName() => _shelterName != null;

  // "shelterLocation" field.
  LatLng? _shelterLocation;
  LatLng? get shelterLocation => _shelterLocation;
  bool hasShelterLocation() => _shelterLocation != null;

  // "shelterContactEmail" field.
  String? _shelterContactEmail;
  String get shelterContactEmail => _shelterContactEmail ?? '';
  bool hasShelterContactEmail() => _shelterContactEmail != null;

  // "shelterContactPhone" field.
  String? _shelterContactPhone;
  String get shelterContactPhone => _shelterContactPhone ?? '';
  bool hasShelterContactPhone() => _shelterContactPhone != null;

  // "petsAdopting" field.
  List<DocumentReference>? _petsAdopting;
  List<DocumentReference> get petsAdopting => _petsAdopting ?? const [];
  bool hasPetsAdopting() => _petsAdopting != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "shelterGLocation" field.
  String? _shelterGLocation;
  String get shelterGLocation => _shelterGLocation ?? '';
  bool hasShelterGLocation() => _shelterGLocation != null;

  // "shelterAddress" field.
  String? _shelterAddress;
  String get shelterAddress => _shelterAddress ?? '';
  bool hasShelterAddress() => _shelterAddress != null;

  // "shelterPhoto" field.
  String? _shelterPhoto;
  String get shelterPhoto => _shelterPhoto ?? '';
  bool hasShelterPhoto() => _shelterPhoto != null;

  void _initializeFields() {
    _shelterID = snapshotData['shelterID'] as DocumentReference?;
    _shelterName = snapshotData['shelterName'] as String?;
    _shelterLocation = snapshotData['shelterLocation'] as LatLng?;
    _shelterContactEmail = snapshotData['shelterContactEmail'] as String?;
    _shelterContactPhone = snapshotData['shelterContactPhone'] as String?;
    _petsAdopting = getDataList(snapshotData['petsAdopting']);
    _photoUrl = snapshotData['photoUrl'] as String?;
    _description = snapshotData['description'] as String?;
    _shelterGLocation = snapshotData['shelterGLocation'] as String?;
    _shelterAddress = snapshotData['shelterAddress'] as String?;
    _shelterPhoto = snapshotData['shelterPhoto'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shelters');

  static Stream<SheltersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SheltersRecord.fromSnapshot(s));

  static Future<SheltersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SheltersRecord.fromSnapshot(s));

  static SheltersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SheltersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SheltersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SheltersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SheltersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SheltersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSheltersRecordData({
  DocumentReference? shelterID,
  String? shelterName,
  LatLng? shelterLocation,
  String? shelterContactEmail,
  String? shelterContactPhone,
  String? photoUrl,
  String? description,
  String? shelterGLocation,
  String? shelterAddress,
  String? shelterPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'shelterID': shelterID,
      'shelterName': shelterName,
      'shelterLocation': shelterLocation,
      'shelterContactEmail': shelterContactEmail,
      'shelterContactPhone': shelterContactPhone,
      'photoUrl': photoUrl,
      'description': description,
      'shelterGLocation': shelterGLocation,
      'shelterAddress': shelterAddress,
      'shelterPhoto': shelterPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class SheltersRecordDocumentEquality implements Equality<SheltersRecord> {
  const SheltersRecordDocumentEquality();

  @override
  bool equals(SheltersRecord? e1, SheltersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.shelterID == e2?.shelterID &&
        e1?.shelterName == e2?.shelterName &&
        e1?.shelterLocation == e2?.shelterLocation &&
        e1?.shelterContactEmail == e2?.shelterContactEmail &&
        e1?.shelterContactPhone == e2?.shelterContactPhone &&
        listEquality.equals(e1?.petsAdopting, e2?.petsAdopting) &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.description == e2?.description &&
        e1?.shelterGLocation == e2?.shelterGLocation &&
        e1?.shelterAddress == e2?.shelterAddress &&
        e1?.shelterPhoto == e2?.shelterPhoto;
  }

  @override
  int hash(SheltersRecord? e) => const ListEquality().hash([
        e?.shelterID,
        e?.shelterName,
        e?.shelterLocation,
        e?.shelterContactEmail,
        e?.shelterContactPhone,
        e?.petsAdopting,
        e?.photoUrl,
        e?.description,
        e?.shelterGLocation,
        e?.shelterAddress,
        e?.shelterPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is SheltersRecord;
}
