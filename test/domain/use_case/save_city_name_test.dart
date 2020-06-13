import 'package:flutter_clean_architecture/domain/use_case/save_city_name_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_stubs.dart';

void main() {
  final repository = MockAppRepository();
  final useCase = SaveCityName(repository);

  const cityName = 'London';

  test('execute should call save method', () async {
    await useCase(cityName);

    verify(repository.saveCityName(cityName));
  });
}
