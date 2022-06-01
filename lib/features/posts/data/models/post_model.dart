import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel(
      {required String idDrink,
      required String strDrink,
      required String strInstructions})
      : super(
            idDrink: idDrink,
            strDrink: strDrink,
            strInstructions: strInstructions);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        idDrink: json['idDrink'],
        strDrink: json['strDrink'],
        strInstructions: json['strInstructions']);
  }

  Map<String, dynamic> toJson() {
    return {
      'idDrink': idDrink,
      'strDrink': strDrink,
      'strInstructions': strInstructions
    };
  }
}
