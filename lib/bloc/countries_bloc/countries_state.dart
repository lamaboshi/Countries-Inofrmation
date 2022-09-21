import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/model/countries.dart';

@immutable
abstract class CountriesState extends Equatable {}

class CountriesLoadingState extends CountriesState {
  @override
  List<Object?> get props => [];
}

class CountriesLoadedState extends CountriesState {
  final Countries country;

  CountriesLoadedState(this.country);

  @override
  List<Object?> get props => [country];
}

class CountriesErrorState extends CountriesState {
  final String error;

  CountriesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
