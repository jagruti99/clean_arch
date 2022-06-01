import '../entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllDrinks();
}
