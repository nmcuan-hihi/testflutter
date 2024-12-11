import 'package:testflutter/data/network/rest_service.dart';
import 'package:testflutter/data/reponses/post_response.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<List<PostResponse>> getPosts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RestClient restClient = RestClient(Dio());
  @override
  Future<List<PostResponse>> getPosts() async {
    return restClient.getTasks();
  }
}
