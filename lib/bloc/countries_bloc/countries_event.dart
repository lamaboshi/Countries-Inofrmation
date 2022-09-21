import 'package:equatable/equatable.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();
}

class LoadCountriesEvent extends CountriesEvent {
  late String data;
  LoadCountriesEvent(this.data);
  @override
  List<Object> get props => [];
}
