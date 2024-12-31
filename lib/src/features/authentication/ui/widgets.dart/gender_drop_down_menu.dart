import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:flutter/material.dart';

class GenderDropDownMenu extends StatelessWidget {
  const GenderDropDownMenu({super.key, required this.gender});
  final String gender;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      key: getIt<AuthCubit>().genderKey,
      decoration: const InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
      value: gender.isEmpty ? null : gender,
      items: ['Male', 'Female']
          .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ))
          .toList(),
      onChanged: (value) => getIt<AuthCubit>().updateGender(value ?? ''),
      validator: (value) => value == null ? 'Please select a gender' : null,
    );
  }
}
