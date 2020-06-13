import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

mixin GetSavesCitiesUseCase {
  Future<List<String>> call();
}

@injectable
@RegisterAs(GetSavesCitiesUseCase)
class GetSavesCities implements GetSavesCitiesUseCase {
  final Repository repository;

  GetSavesCities(this.repository);

  @override
  Future<List<String>> call() async => repository.getCityNames();
}
