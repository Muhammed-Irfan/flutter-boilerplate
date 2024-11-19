// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostDetailsEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetchDetails,
    required TResult Function(String id) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetchDetails,
    TResult? Function(String id)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetchDetails,
    TResult Function(String id)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDetails value) fetchDetails,
    required TResult Function(_Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDetails value)? fetchDetails,
    TResult? Function(_Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDetails value)? fetchDetails,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDetailsEventCopyWith<PostDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailsEventCopyWith<$Res> {
  factory $PostDetailsEventCopyWith(
          PostDetailsEvent value, $Res Function(PostDetailsEvent) then) =
      _$PostDetailsEventCopyWithImpl<$Res, PostDetailsEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$PostDetailsEventCopyWithImpl<$Res, $Val extends PostDetailsEvent>
    implements $PostDetailsEventCopyWith<$Res> {
  _$PostDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchDetailsImplCopyWith<$Res>
    implements $PostDetailsEventCopyWith<$Res> {
  factory _$$FetchDetailsImplCopyWith(
          _$FetchDetailsImpl value, $Res Function(_$FetchDetailsImpl) then) =
      __$$FetchDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$FetchDetailsImplCopyWithImpl<$Res>
    extends _$PostDetailsEventCopyWithImpl<$Res, _$FetchDetailsImpl>
    implements _$$FetchDetailsImplCopyWith<$Res> {
  __$$FetchDetailsImplCopyWithImpl(
      _$FetchDetailsImpl _value, $Res Function(_$FetchDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchDetailsImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchDetailsImpl implements _FetchDetails {
  const _$FetchDetailsImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PostDetailsEvent.fetchDetails(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchDetailsImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchDetailsImplCopyWith<_$FetchDetailsImpl> get copyWith =>
      __$$FetchDetailsImplCopyWithImpl<_$FetchDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetchDetails,
    required TResult Function(String id) refresh,
  }) {
    return fetchDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetchDetails,
    TResult? Function(String id)? refresh,
  }) {
    return fetchDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetchDetails,
    TResult Function(String id)? refresh,
    required TResult orElse(),
  }) {
    if (fetchDetails != null) {
      return fetchDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDetails value) fetchDetails,
    required TResult Function(_Refresh value) refresh,
  }) {
    return fetchDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDetails value)? fetchDetails,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return fetchDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDetails value)? fetchDetails,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (fetchDetails != null) {
      return fetchDetails(this);
    }
    return orElse();
  }
}

abstract class _FetchDetails implements PostDetailsEvent {
  const factory _FetchDetails(final String id) = _$FetchDetailsImpl;

  @override
  String get id;

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchDetailsImplCopyWith<_$FetchDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res>
    implements $PostDetailsEventCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$PostDetailsEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RefreshImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'PostDetailsEvent.refresh(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      __$$RefreshImplCopyWithImpl<_$RefreshImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetchDetails,
    required TResult Function(String id) refresh,
  }) {
    return refresh(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetchDetails,
    TResult? Function(String id)? refresh,
  }) {
    return refresh?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetchDetails,
    TResult Function(String id)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchDetails value) fetchDetails,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchDetails value)? fetchDetails,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchDetails value)? fetchDetails,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements PostDetailsEvent {
  const factory _Refresh(final String id) = _$RefreshImpl;

  @override
  String get id;

  /// Create a copy of PostDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshImplCopyWith<_$RefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PostDetailsState {
  PostEntity get post => throw _privateConstructorUsedError;

  /// Create a copy of PostDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDetailsStateCopyWith<PostDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailsStateCopyWith<$Res> {
  factory $PostDetailsStateCopyWith(
          PostDetailsState value, $Res Function(PostDetailsState) then) =
      _$PostDetailsStateCopyWithImpl<$Res, PostDetailsState>;
  @useResult
  $Res call({PostEntity post});

  $PostEntityCopyWith<$Res> get post;
}

/// @nodoc
class _$PostDetailsStateCopyWithImpl<$Res, $Val extends PostDetailsState>
    implements $PostDetailsStateCopyWith<$Res> {
  _$PostDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostEntity,
    ) as $Val);
  }

  /// Create a copy of PostDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostEntityCopyWith<$Res> get post {
    return $PostEntityCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostDetailsStateImplCopyWith<$Res>
    implements $PostDetailsStateCopyWith<$Res> {
  factory _$$PostDetailsStateImplCopyWith(_$PostDetailsStateImpl value,
          $Res Function(_$PostDetailsStateImpl) then) =
      __$$PostDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostEntity post});

  @override
  $PostEntityCopyWith<$Res> get post;
}

/// @nodoc
class __$$PostDetailsStateImplCopyWithImpl<$Res>
    extends _$PostDetailsStateCopyWithImpl<$Res, _$PostDetailsStateImpl>
    implements _$$PostDetailsStateImplCopyWith<$Res> {
  __$$PostDetailsStateImplCopyWithImpl(_$PostDetailsStateImpl _value,
      $Res Function(_$PostDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$PostDetailsStateImpl(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostEntity,
    ));
  }
}

/// @nodoc

class _$PostDetailsStateImpl implements _PostDetailsState {
  const _$PostDetailsStateImpl({required this.post});

  @override
  final PostEntity post;

  @override
  String toString() {
    return 'PostDetailsState(post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDetailsStateImpl &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  /// Create a copy of PostDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDetailsStateImplCopyWith<_$PostDetailsStateImpl> get copyWith =>
      __$$PostDetailsStateImplCopyWithImpl<_$PostDetailsStateImpl>(
          this, _$identity);
}

abstract class _PostDetailsState implements PostDetailsState {
  const factory _PostDetailsState({required final PostEntity post}) =
      _$PostDetailsStateImpl;

  @override
  PostEntity get post;

  /// Create a copy of PostDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDetailsStateImplCopyWith<_$PostDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
