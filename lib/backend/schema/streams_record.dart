import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'streams_record.g.dart';

abstract class StreamsRecord
    implements Built<StreamsRecord, StreamsRecordBuilder> {
  static Serializer<StreamsRecord> get serializer => _$streamsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'is_live')
  bool? get isLive;

  String? get url;

  DateTime? get time;

  DocumentReference? get user;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(StreamsRecordBuilder builder) => builder
    ..name = ''
    ..isLive = false
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streams');

  static Stream<StreamsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<StreamsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  StreamsRecord._();
  factory StreamsRecord([void Function(StreamsRecordBuilder) updates]) =
      _$StreamsRecord;

  static StreamsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createStreamsRecordData({
  String? name,
  bool? isLive,
  String? url,
  DateTime? time,
  DocumentReference? user,
}) {
  final firestoreData = serializers.toFirestore(
    StreamsRecord.serializer,
    StreamsRecord(
      (s) => s
        ..name = name
        ..isLive = isLive
        ..url = url
        ..time = time
        ..user = user,
    ),
  );

  return firestoreData;
}
