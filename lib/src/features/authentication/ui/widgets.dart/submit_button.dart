import 'package:assignment/src/core/constants/app_colors.dart';
import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.isSubmitting});
  final bool isSubmitting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: isSubmitting
            ? null
            : () => getIt<AuthCubit>().submitForm(context: context),
        child: isSubmitting
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              )
            : const Text('Submit'),
      ),
    );
  }
}
