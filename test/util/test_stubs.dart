import 'package:flutter_clean_architecture/data/http_manager/http_manager.dart';
import 'package:flutter_clean_architecture/data/local/local_data_source.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:mockito/mockito.dart';

class MockAppRepository extends Mock implements Repository {}

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

class MockLocalDataSource extends Mock implements LocalDataSource {}

class MockApiService extends Mock implements RemoteService {}

class MockHttpManager extends Mock implements HttpManager {}