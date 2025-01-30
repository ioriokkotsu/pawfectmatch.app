import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PetsRecord extends FirestoreRecord {
  PetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "petID" field.
  DocumentReference? _petID;
  DocumentReference? get petID => _petID;
  bool hasPetID() => _petID != null;

  // "sheltersID" field.
  DocumentReference? _sheltersID;
  DocumentReference? get sheltersID => _sheltersID;
  bool hasSheltersID() => _sheltersID != null;

  // "petName" field.
  String? _petName;
  String get petName => _petName ?? '';
  bool hasPetName() => _petName != null;

  // "petSpecies" field.
  String? _petSpecies;
  String get petSpecies => _petSpecies ?? '';
  bool hasPetSpecies() => _petSpecies != null;

  // "petBreed" field.
  String? _petBreed;
  String get petBreed => _petBreed ?? '';
  bool hasPetBreed() => _petBreed != null;

  // "petSize" field.
  int? _petSize;
  int get petSize => _petSize ?? 0;
  bool hasPetSize() => _petSize != null;

  // "livingCondition" field.
  String? _livingCondition;
  String get livingCondition => _livingCondition ?? '';
  bool hasLivingCondition() => _livingCondition != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "availableAdopt" field.
  bool? _availableAdopt;
  bool get availableAdopt => _availableAdopt ?? false;
  bool hasAvailableAdopt() => _availableAdopt != null;

  // "adoptedSince" field.
  DateTime? _adoptedSince;
  DateTime? get adoptedSince => _adoptedSince;
  bool hasAdoptedSince() => _adoptedSince != null;

  void _initializeFields() {
    _petID = snapshotData['petID'] as DocumentReference?;
    _sheltersID = snapshotData['sheltersID'] as DocumentReference?;
    _petName = snapshotData['petName'] as String?;
    _petSpecies = snapshotData['petSpecies'] as String?;
    _petBreed = snapshotData['petBreed'] as String?;
    _petSize = castToType<int>(snapshotData['petSize']);
    _livingCondition = snapshotData['livingCondition'] as String?;
    _photoUrl = snapshotData['photoUrl'] as String?;
    _availableAdopt = snapshotData['availableAdopt'] as bool?;
    _adoptedSince = snapshotData['adoptedSince'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pets');

  static Stream<PetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PetsRecord.fromSnapshot(s));

  static Future<PetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PetsRecord.fromSnapshot(s));

  static PetsRecord fromSnapshot(DocumentSnapshot snapshot) => PetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPetsRecordData({
  DocumentReference? petID,
  DocumentReference? sheltersID,
  String? petName,
  String? petSpecies,
  String? petBreed,
  int? petSize,
  String? livingCondition,
  String? photoUrl,
  bool? availableAdopt,
  DateTime? adoptedSince,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'petID': petID,
      'sheltersID': sheltersID,
      'petName': petName,
      'petSpecies': petSpecies,
      'petBreed': petBreed,
      'petSize': petSize,
      'livingCondition': livingCondition,
      'photoUrl': photoUrl,
      'availableAdopt': availableAdopt,
      'adoptedSince': adoptedSince,
    }.withoutNulls,
  );

  return firestoreData;
}

class PetsRecordDocumentEquality implements Equality<PetsRecord> {
  const PetsRecordDocumentEquality();

  @override
  bool equals(PetsRecord? e1, PetsRecord? e2) {
    return e1?.petID == e2?.petID &&
        e1?.sheltersID == e2?.sheltersID &&
        e1?.petName == e2?.petName &&
        e1?.petSpecies == e2?.petSpecies &&
        e1?.petBreed == e2?.petBreed &&
        e1?.petSize == e2?.petSize &&
        e1?.livingCondition == e2?.livingCondition &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.availableAdopt == e2?.availableAdopt &&
        e1?.adoptedSince == e2?.adoptedSince;
  }

  @override
  int hash(PetsRecord? e) => const ListEquality().hash([
        e?.petID,
        e?.sheltersID,
        e?.petName,
        e?.petSpecies,
        e?.petBreed,
        e?.petSize,
        e?.livingCondition,
        e?.photoUrl,
        e?.availableAdopt,
        e?.adoptedSince
      ]);

  @override
  bool isValidKey(Object? o) => o is PetsRecord;
}
