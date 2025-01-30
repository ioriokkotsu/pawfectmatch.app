import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postedBy" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "commentContent" field.
  String? _commentContent;
  String get commentContent => _commentContent ?? '';
  bool hasCommentContent() => _commentContent != null;

  // "datePosted" field.
  DateTime? _datePosted;
  DateTime? get datePosted => _datePosted;
  bool hasDatePosted() => _datePosted != null;

  // "uploadedImage" field.
  String? _uploadedImage;
  String get uploadedImage => _uploadedImage ?? '';
  bool hasUploadedImage() => _uploadedImage != null;

  // "imageWidth" field.
  int? _imageWidth;
  int get imageWidth => _imageWidth ?? 0;
  bool hasImageWidth() => _imageWidth != null;

  // "imageHeight" field.
  int? _imageHeight;
  int get imageHeight => _imageHeight ?? 0;
  bool hasImageHeight() => _imageHeight != null;

  void _initializeFields() {
    _postedBy = snapshotData['postedBy'] as DocumentReference?;
    _commentContent = snapshotData['commentContent'] as String?;
    _datePosted = snapshotData['datePosted'] as DateTime?;
    _uploadedImage = snapshotData['uploadedImage'] as String?;
    _imageWidth = castToType<int>(snapshotData['imageWidth']);
    _imageHeight = castToType<int>(snapshotData['imageHeight']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? postedBy,
  String? commentContent,
  DateTime? datePosted,
  String? uploadedImage,
  int? imageWidth,
  int? imageHeight,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postedBy': postedBy,
      'commentContent': commentContent,
      'datePosted': datePosted,
      'uploadedImage': uploadedImage,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    return e1?.postedBy == e2?.postedBy &&
        e1?.commentContent == e2?.commentContent &&
        e1?.datePosted == e2?.datePosted &&
        e1?.uploadedImage == e2?.uploadedImage &&
        e1?.imageWidth == e2?.imageWidth &&
        e1?.imageHeight == e2?.imageHeight;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.postedBy,
        e?.commentContent,
        e?.datePosted,
        e?.uploadedImage,
        e?.imageWidth,
        e?.imageHeight
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
