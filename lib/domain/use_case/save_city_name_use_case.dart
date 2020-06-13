import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:injectable/injectable.dart';

mixin SaveCityNameUseCase {
  Future<void> call(String cityName);
}

@injectable
@RegisterAs(SaveCityNameUseCase)
class SaveCityName implements SaveCityNameUseCase {
  final Repository repository;

  SaveCityName(this.repository);

  @override
  Future<void> call(String cityName) async =>
      repository.saveCityName(cityName);
}
