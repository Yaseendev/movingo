import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final bool isIntro;

  Settings({
    required this.isIntro,
  });

  @override
  List<Object?> get props => [isIntro];
}
