import 'package:equatable/equatable.dart';

class CountryStates extends Equatable {
  final List<String> cities;
  final List<String> countries;
  final List<String> states;
  final String selectedCity;
  final String selectedCountry;
  final String selectedState;

  const CountryStates({
    this.cities = const ["Choose City"],
    this.countries = const ["Choose Country"],
    this.states = const ["Choose State"],
    this.selectedCity = "Choose City",
    this.selectedCountry = "Choose Country",
    this.selectedState = "Choose State",
  });

  CountryStates copyWith({
    List<String>? cities,
    List<String>? countries,
    List<String>? states,
    String? selectedCity,
    String? selectedCountry,
    String? selectedState,
  }) {
    return CountryStates(
      cities: cities ?? this.cities,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
    );
  }

  @override
  List<Object?> get props =>
      [cities, countries, states, selectedCity, selectedCountry, selectedState];
}
