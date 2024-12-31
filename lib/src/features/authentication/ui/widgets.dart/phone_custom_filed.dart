import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneCustomFiled extends StatelessWidget {
  const PhoneCustomFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      fieldKey: getIt<AuthCubit>().phoneKey,
      onInputChanged: (PhoneNumber number) {},
      onInputValidated: (value) {
        getIt<AuthCubit>().validatePhone(value);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is required';
        }
        if (!getIt<AuthCubit>().isValidPhone) {
          return 'phone number is invalid';
        }
        return null;
      },
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
        useBottomSheetSafeArea: true,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      // selectorTextStyle: TextStyle(color: Colors.black),
      formatInput: true,
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      inputBorder: const OutlineInputBorder(),
    );
  }
}
