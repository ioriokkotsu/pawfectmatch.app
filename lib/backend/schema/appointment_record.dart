import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentRecord extends FirestoreRecord {
  AppointmentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bookedBy" field.
  DocumentReference? _bookedBy;
  DocumentReference? get bookedBy => _bookedBy;
  bool hasBookedBy() => _bookedBy != null;

  // "petRef" field.
  DocumentReference? _petRef;
  DocumentReference? get petRef => _petRef;
  bool hasPetRef() => _petRef != null;

  // "statusAppointment" field.
  String? _statusAppointment;
  String get statusAppointment => _statusAppointment ?? '';
  bool hasStatusAppointment() => _statusAppointment != null;

  // "timeSlot" field.
  DateTime? _timeSlot;
  DateTime? get timeSlot => _timeSlot;
  bool hasTimeSlot() => _timeSlot != null;

  // "timeRefSlot" field.
  List<String>? _timeRefSlot;
  List<String> get timeRefSlot => _timeRefSlot ?? const [];
  bool hasTimeRefSlot() => _timeRefSlot != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookedBy = snapshotData['bookedBy'] as DocumentReference?;
    _petRef = snapshotData['petRef'] as DocumentReference?;
    _statusAppointment = snapshotData['statusAppointment'] as String?;
    _timeSlot = snapshotData['timeSlot'] as DateTime?;
    _timeRefSlot = getDataList(snapshotData['timeRefSlot']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('appointment')
          : FirebaseFirestore.instance.collectionGroup('appointment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('appointment').doc(id);

  static Stream<AppointmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentRecord.fromSnapshot(s));

  static Future<AppointmentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentRecord.fromSnapshot(s));

  static AppointmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentRecordData({
  DocumentReference? bookedBy,
  DocumentReference? petRef,
  String? statusAppointment,
  DateTime? timeSlot,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bookedBy': bookedBy,
      'petRef': petRef,
      'statusAppointment': statusAppointment,
      'timeSlot': timeSlot,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentRecordDocumentEquality implements Equality<AppointmentRecord> {
  const AppointmentRecordDocumentEquality();

  @override
  bool equals(AppointmentRecord? e1, AppointmentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookedBy == e2?.bookedBy &&
        e1?.petRef == e2?.petRef &&
        e1?.statusAppointment == e2?.statusAppointment &&
        e1?.timeSlot == e2?.timeSlot &&
        listEquality.equals(e1?.timeRefSlot, e2?.timeRefSlot);
  }

  @override
  int hash(AppointmentRecord? e) => const ListEquality().hash([
        e?.bookedBy,
        e?.petRef,
        e?.statusAppointment,
        e?.timeSlot,
        e?.timeRefSlot
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentRecord;
}
