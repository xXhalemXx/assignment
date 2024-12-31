import 'dart:convert';

import 'package:assignment/src/core/models/country_model.dart';
import 'package:assignment/src/features/authentication/logic/country_logic/country_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryCubit extends Cubit<CountryStates> {
  CountryCubit() : super(const CountryStates());

  GlobalKey<FormFieldState> countryKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> stateKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> cityKey = GlobalKey<FormFieldState>();

// to read the countries from the json file
  Future<List<Country>> readCountriesFromFile() async {
    var res = await rootBundle.loadString('assets/country.json');
    List<dynamic> jsonData = json.decode(res);
    List<Country> countries =
        jsonData.map((countryJson) => Country.fromJson(countryJson)).toList();
    return countries;
  }

// to store the countries names in the list
  Future getCountries() async {
    List<Country> countries = await readCountriesFromFile();

    List<String> countryNames = ["Choose Country"];
    countryNames += countries
        .map((country) => '${country.emoji}    ${country.name}')
        .toSet()
        .toList();

    emit(state.copyWith(countries: countryNames));
  }

  Future<void> getStatesByCountry({required String countryName}) async {
    List<String> parts = countryName.split('    ');
    List<Country> countries = await readCountriesFromFile();
    Country? country = countries.firstWhere(
      (c) => c.name.toLowerCase() == parts[1].toLowerCase(),
      orElse: () => throw Exception('Country not found'),
    );
// to set removes the duplicate values
    List<String> stateNames = ["Choose State"];
    stateNames += country.states.map((state) => state.name).toSet().toList();
    emit(state.copyWith(states: stateNames));
  }

  Future getCitiesByState({required String stateName}) async {
    List<Country> countries = await readCountriesFromFile();

    Iterable<StateModel> allStates =
        countries.expand((country) => country.states);

    StateModel? matchingState = allStates.firstWhere(
      (state) => state.name.toLowerCase() == stateName.toLowerCase(),
      orElse: () => throw Exception('State not found'),
    );

    List<String> cityNames = ["Choose City"];
    cityNames += matchingState.cities.map((city) => city.name).toSet().toList();

    emit(state.copyWith(cities: cityNames));
  }

  void onSelectedCountry(String value) {
    emit(
      state.copyWith(
        selectedCountry: value,
        selectedState: 'Choose State',
        selectedCity: 'Choose City',
      ),
    );
    countryKey.currentState!.validate();
    getStatesByCountry(countryName: value);
  }

  void onSelectedState(String value) {
    stateKey.currentState!.validate();
    emit(state.copyWith(
      selectedState: value,
      selectedCity: 'Choose City',
    ));
    getCitiesByState(stateName: value);
  }

  void onSelectedCity(String value) {
    cityKey.currentState!.validate();
    emit(state.copyWith(selectedCity: value));
  }
}
