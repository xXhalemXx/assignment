import 'dart:convert';

import 'package:assignment/src/core/models/status_model.dart';
import 'package:assignment/src/features/authentication/logic/country_logic/country_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountryCubit extends Cubit<CountryStates> {
  List<String> cities = ["Choose City"];
  List<String> countries = ["Choose Country"];
  String selectedCity = "Choose City";
  String selectedState = "Choose State";
  List<String> states = ["Choose State"];
  String selectedCountry = "Choose Country";

  CountryCubit() : super(const CountryStates());

  GlobalKey<FormFieldState> countryKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> stateKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> cityKey = GlobalKey<FormFieldState>();

  Future getResponse() async {
    var res = await rootBundle.loadString('assets/country.json');
    return jsonDecode(res);
  }

  Future getCountries() async {
    if (countries.length == 1) {
      var localCountries = await getResponse() as List;
      for (var data in localCountries) {
        countries.add(data['emoji'] + "    " + data['name']);
        emit(state.copyWith(countries: countries));
      }
    }
  }

  Future<void> getStates({required String selectedCountry}) async {
    if (states.length == 1) {
      var response = await getResponse();
      var stateInResponse = response
          .map((map) => StatusModel.fromJson(map))
          .where((item) => item.emoji + "    " + item.name == selectedCountry)
          .map((item) => item.state)
          .toList();
      var localStates = stateInResponse as List;
      for (var f in localStates) {
        var name = f.map((item) => item.name).toList();
        for (var stateName in name) {
          states.add(stateName.toString());
        }
      }
      emit(state.copyWith(states: states));
    }
  }

  Future getCites({required String selectedCountry}) async {
    if (cities.length == 1) {
      var response = await getResponse();
      var takeState = response
          .map((map) => StatusModel.fromJson(map))
          .where((item) => item.emoji + "    " + item.name == selectedCountry)
          .map((item) => item.state)
          .toList();
      var states = takeState as List;
      for (var f in states) {
        var name = f.where((item) => item.name == selectedState);
        var cityName = name.map((item) => item.city).toList();
        cityName.forEach((ci) {
          var citiesNames = ci.map((item) => item.name).toList();
          for (var cityNames in citiesNames) {
            //  print(cityNames.toString());

            cities.add(cityNames.toString());
            emit(state.copyWith(cities: cities));
          }
        });
      }
    }
  }

  void onSelectedCountry(String value) {
    selectedCity = "Choose City";
    selectedState = "Choose State";
    states = ["Choose State"];
    cities = ["Choose City"];
    emit(state.copyWith(selectedCountry: value));
    countryKey.currentState!.validate();
    getStates(selectedCountry: value);
  }

  void onSelectedState(String value) {
    selectedCity = "Choose City";
    cities = ["Choose City"];
    state.copyWith(selectedCity: "Choose City", cities: ["Choose City"]);
    selectedState = value;
    stateKey.currentState!.validate();
    emit(state.copyWith(selectedState: value));
    getCites(selectedCountry: selectedCountry);
  }

  void onSelectedCity(String value) {
    selectedCity = value;
    cityKey.currentState!.validate();
    emit(state.copyWith(selectedCity: value));
  }
}
