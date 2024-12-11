import 'package:testflutter/domain/models/post.dart';

class PostState {
  List<Post> listPost;
  PostState copyWith(List<Post> data) {
    return PostState(data);
  }

  PostState(this.listPost);
}
