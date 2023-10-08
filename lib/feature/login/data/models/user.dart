import 'package:flutter_clean_acrtect/feature/login/domain/entites/login/login_enity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User extends UserEntity with _$User {
  const factory User({
    @Default(null) String? message,
    @Default(null) String? username,
    @Default(null) int? id,
    @Default(null) String? email,
    @Default(null) String? firstName,
    @Default(null) String? lastName,
    @Default(null) String? gender,
    @Default(null) String? image,
    @Default(null) String? token,
  }) = _UserModel;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
