import 'package:testflutter/data/data_source.dart/remote_data_source.dart';
import 'package:testflutter/data/mapper/mapper.dart';
import 'package:testflutter/data/network/error_handle.dart';
import 'package:testflutter/data/network/my_error.dart';
import 'package:testflutter/domain/models/post.dart';
import 'package:either_dart/either.dart';

abstract class PostRepository {
  Future<Either<MyError, List<Post>>> getPosts();
}

class PostRepositoryImpl implements PostRepository {
  RemoteDataSource remoteDataSource;
  PostRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<MyError, List<Post>>> getPosts() async {
    try {
      final response = await remoteDataSource.getPosts();
      return Right(List.from(response.map((e) => e.toDomain()).toList()));
    } catch (e) {
      return Left(ErrorHandler.handle(e).myError);
    }
  }
}
