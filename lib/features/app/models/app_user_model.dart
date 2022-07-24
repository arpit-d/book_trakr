import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.uid,
    this.email,
    this.name,
    this.photo,
  });

  // The current user's email address.
  final String? email;

  // The current user's firebase id.
  final String uid;

  // The current user's name (display name).
  final String? name;

  // Url for the current user's photo.
  final String? photo;

  // Empty user which represents an unauthenticated user.
  static const empty = UserModel(uid: '');

  UserModel get user => UserModel(uid: uid);

  // Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  // Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [email, uid, name, photo];
}
