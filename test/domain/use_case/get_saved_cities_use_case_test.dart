import 'package:flutter_clean_architecture/domain/use_case/get_saved_cities_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_stubs.dart';

void main() {
  final repository = MockAppRepository();
  final useCase = GetSavesCities(repository);

  test('execute should call get method', () async {
    await useCase();

    verify(repository.getCityNames());
  });

  test('execute should return city names list', () async {
    final cities = ['Seatle', 'Rio', 'Sao Paulo'];
    when(repository.getCityNames()).thenAnswer((_) async => cities);

    final result = await useCase();

    verify(repository.getCityNames());
    expect(cities, result);
  });
}
