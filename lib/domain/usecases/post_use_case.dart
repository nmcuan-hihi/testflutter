import 'package:testflutter/data/network/my_error.dart';
import 'package:testflutter/data/repositories/post_repository.dart';
import 'package:testflutter/domain/models/post.dart';
import 'package:either_dart/either.dart';

class PostUseCase {
  PostRepositoryImpl postRepositoryImpl;
  PostUseCase(this.postRepositoryImpl);

  Future<Either<MyError, List<Post>>> execute() async {
    return postRepositoryImpl.getPosts();
  }
}
