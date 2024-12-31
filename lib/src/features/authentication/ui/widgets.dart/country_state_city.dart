import 'package:assignment/src/core/helpers/spacing.dart';
import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:assignment/src/features/authentication/logic/country_logic/country_state.dart';
import 'package:assignment/src/features/authentication/logic/country_logic/country_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCountryCityAndState extends StatelessWidget {
  const SelectCountryCityAndState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryStates>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _commonDropDownForCountry(
              key: getIt<CountryCubit>().countryKey,
              values: state.countries,
              selectedValue: state.selectedCountry,
              onChanged: (value) {
                getIt<CountryCubit>().onSelectedCountry(value ?? '');
              },
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value == 'Choose Country') {
                  return 'Select Country';
                }
                return null;
              },
            ),
            verticalSpace(height: 16),
            _commonDropDownForCountry(
              key: getIt<CountryCubit>().stateKey,
              values: state.states,
              selectedValue: state.selectedState,
              onChanged: (value) {
                getIt<CountryCubit>().onSelectedState(value ?? '');
              },
              validator: (value) {
                if (value == null || value.isEmpty || value == 'Choose State') {
                  return 'Select State';
                }
              },
            ),
            verticalSpace(height: 16),
            _commonDropDownForCountry(
              key: getIt<CountryCubit>().cityKey,
              values: state.cities,
              selectedValue: state.selectedCity,
              onChanged: (value) {
                getIt<CountryCubit>().onSelectedCity(value ?? '');
              },
              validator: (value) {
                if (value == null || value.isEmpty || value == 'Choose City') {
                  return 'Select City';
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _commonDropDownForCountry(
      {required List<String> values,
      required GlobalKey key,
      required String selectedValue,
      required Function(String?) onChanged,
      required Function(String?) validator}) {
    return DropdownButtonFormField<String>(
      // dropdownColor: widget.dropdownColor,
      key: key,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      isExpanded: true,
      items: values.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Row(
            children: [
              Text(
                dropDownStringItem,
                //style: widget.style,
              )
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        onChanged(value);
      },

      validator: (value) {
        return validator(value);
      },

      value: selectedValue,
    );
  }
}
