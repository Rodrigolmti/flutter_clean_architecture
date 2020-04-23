import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_stubs.dart';

void main() {
  final MockAppRepository repository = MockAppRepository();
  final GetSavesCitiesUseCase useCase = GetSavesCities(repository);

  test('execute should call get method', () async {
    useCase.execute();

    verify(repository.getCityNames());
  });

  test('execute should return city names list', () async {
    final cities = ["Seatle", "Rio", "Sao Paulo"];
    when(repository.getCityNames())
        .thenAnswer((_) => cities);

    final result = useCase.execute();

    verify(repository.getCityNames());
    expect(cities, result);
  });
}