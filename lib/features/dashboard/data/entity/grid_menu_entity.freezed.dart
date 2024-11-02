// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_menu_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GridMenuEntity {
  String get uuid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  GridMenuType get type => throw _privateConstructorUsedError;
  String? get imageAssetPath => throw _privateConstructorUsedError;
  HeartType get heartType => throw _privateConstructorUsedError;

  /// Create a copy of GridMenuEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridMenuEntityCopyWith<GridMenuEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridMenuEntityCopyWith<$Res> {
  factory $GridMenuEntityCopyWith(
          GridMenuEntity value, $Res Function(GridMenuEntity) then) =
      _$GridMenuEntityCopyWithImpl<$Res, GridMenuEntity>;
  @useResult
  $Res call(
      {String uuid,
      String title,
      GridMenuType type,
      String? imageAssetPath,
      HeartType heartType});
}

/// @nodoc
class _$GridMenuEntityCopyWithImpl<$Res, $Val extends GridMenuEntity>
    implements $GridMenuEntityCopyWith<$Res> {
  _$GridMenuEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridMenuEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? type = null,
    Object? imageAssetPath = freezed,
    Object? heartType = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GridMenuType,
      imageAssetPath: freezed == imageAssetPath
          ? _value.imageAssetPath
          : imageAssetPath // ignore: cast_nullable_to_non_nullable
              as String?,
      heartType: null == heartType
          ? _value.heartType
          : heartType // ignore: cast_nullable_to_non_nullable
              as HeartType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GridMenuEntityImplCopyWith<$Res>
    implements $GridMenuEntityCopyWith<$Res> {
  factory _$$GridMenuEntityImplCopyWith(_$GridMenuEntityImpl value,
          $Res Function(_$GridMenuEntityImpl) then) =
      __$$GridMenuEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String title,
      GridMenuType type,
      String? imageAssetPath,
      HeartType heartType});
}

/// @nodoc
class __$$GridMenuEntityImplCopyWithImpl<$Res>
    extends _$GridMenuEntityCopyWithImpl<$Res, _$GridMenuEntityImpl>
    implements _$$GridMenuEntityImplCopyWith<$Res> {
  __$$GridMenuEntityImplCopyWithImpl(
      _$GridMenuEntityImpl _value, $Res Function(_$GridMenuEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GridMenuEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? type = null,
    Object? imageAssetPath = freezed,
    Object? heartType = null,
  }) {
    return _then(_$GridMenuEntityImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as GridMenuType,
      imageAssetPath: freezed == imageAssetPath
          ? _value.imageAssetPath
          : imageAssetPath // ignore: cast_nullable_to_non_nullable
              as String?,
      heartType: null == heartType
          ? _value.heartType
          : heartType // ignore: cast_nullable_to_non_nullable
              as HeartType,
    ));
  }
}

/// @nodoc

class _$GridMenuEntityImpl implements _GridMenuEntity {
  const _$GridMenuEntityImpl(
      {required this.uuid,
      required this.title,
      required this.type,
      this.imageAssetPath,
      this.heartType = HeartType.empty});

  @override
  final String uuid;
  @override
  final String title;
  @override
  final GridMenuType type;
  @override
  final String? imageAssetPath;
  @override
  @JsonKey()
  final HeartType heartType;

  @override
  String toString() {
    return 'GridMenuEntity(uuid: $uuid, title: $title, type: $type, imageAssetPath: $imageAssetPath, heartType: $heartType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GridMenuEntityImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageAssetPath, imageAssetPath) ||
                other.imageAssetPath == imageAssetPath) &&
            (identical(other.heartType, heartType) ||
                other.heartType == heartType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, title, type, imageAssetPath, heartType);

  /// Create a copy of GridMenuEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GridMenuEntityImplCopyWith<_$GridMenuEntityImpl> get copyWith =>
      __$$GridMenuEntityImplCopyWithImpl<_$GridMenuEntityImpl>(
          this, _$identity);
}

abstract class _GridMenuEntity implements GridMenuEntity {
  const factory _GridMenuEntity(
      {required final String uuid,
      required final String title,
      required final GridMenuType type,
      final String? imageAssetPath,
      final HeartType heartType}) = _$GridMenuEntityImpl;

  @override
  String get uuid;
  @override
  String get title;
  @override
  GridMenuType get type;
  @override
  String? get imageAssetPath;
  @override
  HeartType get heartType;

  /// Create a copy of GridMenuEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GridMenuEntityImplCopyWith<_$GridMenuEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
