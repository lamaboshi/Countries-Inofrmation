import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/countries_repositories.dart';
import 'countries_event.dart';
import 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CountriesRepositories _countriesRepository;

  CountriesBloc(this._countriesRepository) : super(CountriesLoadingState()) {
    on<LoadCountriesEvent>((event, emit) async {
      emit(CountriesLoadingState());
      try {
        print(event.data);
        final country = await _countriesRepository.getCountries(event.data);
        emit(CountriesLoadedState(country));
      } catch (e) {
        emit(CountriesErrorState(e.toString()));
      }
    });
  }
}
