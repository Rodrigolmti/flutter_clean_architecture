import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

abstract class GetSavesCitiesUseCase {
  List<String> execute();
}

@injectable
@RegisterAs(GetSavesCitiesUseCase)
class GetSavesCities implements GetSavesCitiesUseCase {
  final Repository repository;

  GetSavesCities(this.repository);

  @override
  List<String> execute() => repository.getCityNames();
}
