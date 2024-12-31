import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:assignment/src/features/authentication/ui/widgets.dart/form_content.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth:
                      constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
                ),
                child: Form(
                  key: getIt<AuthCubit>().formKey,
                  child: const FormContent(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
