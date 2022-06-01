import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String idDrink;
  final String strDrink;
  final String strInstructions;

  const Post(
      {required this.idDrink,
      required this.strDrink,
      required this.strInstructions});

  @override
  List<Object?> get props => [idDrink, strDrink, strInstructions];
}
