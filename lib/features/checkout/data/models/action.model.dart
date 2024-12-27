import 'package:equatable/equatable.dart';

class ProfileActionModel extends Equatable {
  final String title;
  final String? icon;
  final String? subTitle;
  final Function? onClick;

  const ProfileActionModel({
    required this.title,
    this.icon,
    this.subTitle,
    this.onClick,
  });
  
  @override
  List<Object?> get props => [title];
}