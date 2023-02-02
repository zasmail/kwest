// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streams_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StreamsRecord> _$streamsRecordSerializer =
    new _$StreamsRecordSerializer();

class _$StreamsRecordSerializer implements StructuredSerializer<StreamsRecord> {
  @override
  final Iterable<Type> types = const [StreamsRecord, _$StreamsRecord];
  @override
  final String wireName = 'StreamsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StreamsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isLive;
    if (value != null) {
      result
        ..add('is_live')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  StreamsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StreamsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_live':
          result.isLive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$StreamsRecord extends StreamsRecord {
  @override
  final String? name;
  @override
  final bool? isLive;
  @override
  final String? url;
  @override
  final DateTime? time;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StreamsRecord([void Function(StreamsRecordBuilder)? updates]) =>
      (new StreamsRecordBuilder()..update(updates))._build();

  _$StreamsRecord._(
      {this.name, this.isLive, this.url, this.time, this.user, this.ffRef})
      : super._();

  @override
  StreamsRecord rebuild(void Function(StreamsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StreamsRecordBuilder toBuilder() => new StreamsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StreamsRecord &&
        name == other.name &&
        isLive == other.isLive &&
        url == other.url &&
        time == other.time &&
        user == other.user &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, name.hashCode), isLive.hashCode), url.hashCode),
                time.hashCode),
            user.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StreamsRecord')
          ..add('name', name)
          ..add('isLive', isLive)
          ..add('url', url)
          ..add('time', time)
          ..add('user', user)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StreamsRecordBuilder
    implements Builder<StreamsRecord, StreamsRecordBuilder> {
  _$StreamsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _isLive;
  bool? get isLive => _$this._isLive;
  set isLive(bool? isLive) => _$this._isLive = isLive;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StreamsRecordBuilder() {
    StreamsRecord._initializeBuilder(this);
  }

  StreamsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _isLive = $v.isLive;
      _url = $v.url;
      _time = $v.time;
      _user = $v.user;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StreamsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StreamsRecord;
  }

  @override
  void update(void Function(StreamsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StreamsRecord build() => _build();

  _$StreamsRecord _build() {
    final _$result = _$v ??
        new _$StreamsRecord._(
            name: name,
            isLive: isLive,
            url: url,
            time: time,
            user: user,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
