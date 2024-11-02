// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grid_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GridMenuState {
  List<GridMenuEntity> get gridMenuList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GridMenuEntity> gridMenuList) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GridMenuEntity> gridMenuList)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GridMenuEntity> gridMenuList)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GridMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GridMenuStateCopyWith<GridMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GridMenuStateCopyWith<$Res> {
  factory $GridMenuStateCopyWith(
          GridMenuState value, $Res Function(GridMenuState) then) =
      _$GridMenuStateCopyWithImpl<$Res, GridMenuState>;
  @useResult
  $Res call({List<GridMenuEntity> gridMenuList});
}

/// @nodoc
class _$GridMenuStateCopyWithImpl<$Res, $Val extends GridMenuState>
    implements $GridMenuStateCopyWith<$Res> {
  _$GridMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GridMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridMenuList = null,
  }) {
    return _then(_value.copyWith(
      gridMenuList: null == gridMenuList
          ? _value.gridMenuList
          : gridMenuList // ignore: cast_nullable_to_non_nullable
              as List<GridMenuEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res>
    implements $GridMenuStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GridMenuEntity> gridMenuList});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$GridMenuStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GridMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gridMenuList = null,
  }) {
    return _then(_$LoadedImpl(
      null == gridMenuList
          ? _value._gridMenuList
          : gridMenuList // ignore: cast_nullable_to_non_nullable
              as List<GridMenuEntity>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<GridMenuEntity> gridMenuList)
      : _gridMenuList = gridMenuList;

  final List<GridMenuEntity> _gridMenuList;
  @override
  List<GridMenuEntity> get gridMenuList {
    if (_gridMenuList is EqualUnmodifiableListView) return _gridMenuList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gridMenuList);
  }

  @override
  String toString() {
    return 'GridMenuState.loaded(gridMenuList: $gridMenuList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._gridMenuList, _gridMenuList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_gridMenuList));

  /// Create a copy of GridMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GridMenuEntity> gridMenuList) loaded,
  }) {
    return loaded(gridMenuList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<GridMenuEntity> gridMenuList)? loaded,
  }) {
    return loaded?.call(gridMenuList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GridMenuEntity> gridMenuList)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(gridMenuList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements GridMenuState {
  const factory _Loaded(final List<GridMenuEntity> gridMenuList) = _$LoadedImpl;

  @override
  List<GridMenuEntity> get gridMenuList;

  /// Create a copy of GridMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
