import 'package:testflutter/data/data_source.dart/remote_data_source.dart';
import 'package:testflutter/data/repositories/post_repository.dart';
import 'package:testflutter/domain/usecases/post_use_case.dart';
import 'package:testflutter/presentation/post/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostState([]));
  final PostUseCase postUseCase =
      PostUseCase(PostRepositoryImpl(RemoteDataSourceImpl()));
  void getListPosts() async {
    try {
      (await postUseCase.execute()).fold((left) => null, (right) {
        emit(state.copyWith(right));
      });
    } catch (e) {
      //  print(e);
    }
  }
}
