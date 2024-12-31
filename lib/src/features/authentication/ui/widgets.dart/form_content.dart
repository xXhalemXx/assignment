import 'package:assignment/src/core/helpers/spacing.dart';
import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_state.dart';
import 'package:assignment/src/features/authentication/ui/widgets.dart/country_state_city.dart';
import 'package:assignment/src/features/authentication/ui/widgets.dart/custom_text_filed.dart';
import 'package:assignment/src/features/authentication/ui/widgets.dart/gender_drop_down_menu.dart';
import 'package:assignment/src/features/authentication/ui/widgets.dart/phone_custom_filed.dart';
import 'package:assignment/src/features/authentication/ui/widgets.dart/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormContent extends StatelessWidget {
  const FormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _nameField(errorText: state.errors['name']),
            verticalSpace(height: 16),
            _emailField(errorText: state.errors['email']),
            verticalSpace(height: 16),
            const PhoneCustomFiled(),
            verticalSpace(height: 16),
            GenderDropDownMenu(
              gender: state.gender,
            ),
            verticalSpace(height: 16),
            const SelectCountryCityAndState(),
            verticalSpace(height: 24),
            SubmitButton(isSubmitting: state.isSubmitting),
            verticalSpace(height: 16),
          ],
        );
      },
    );
  }

  Widget _nameField({String? errorText}) {
    return CustomTextField(
      label: 'Name',
      onChanged: getIt<AuthCubit>().updateName,
      errorText: errorText,
    );
  }

  Widget _emailField({String? errorText}) {
    return CustomTextField(
      label: 'Email',
      onChanged: getIt<AuthCubit>().updateEmail,
      errorText: errorText,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
