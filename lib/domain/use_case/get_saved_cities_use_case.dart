import 'package:flutter_clean_architecture/domain/repository/repository.dart';

abstract class GetSavesCitiesUseCase {
  List<String> execute();
}

class GetSavesCities implements GetSavesCitiesUseCase {
  final Repository repository;

  GetSavesCities(this.repository);

  @override
  List<String> execute() => repository.getCityNames();
}
