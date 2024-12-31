import 'package:assignment/src/core/constants/app_text_styles.dart';
import 'package:assignment/src/core/helpers/spacing.dart';
import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/features/home/logic/products_cubit.dart';
import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  final String errorMessage;

  const ErrorBody({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _errorIcon(),
            verticalSpace(height: 10),
            _errorMessage(context: context),
            verticalSpace(height: 10),
            _tryAgainButton()
          ],
        ),
      ),
    );
  }

  Widget _errorIcon() {
    return const Icon(
      Icons.error,
      size: 200,
      color: Colors.red,
    );
  }

  Widget _errorMessage({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: AppTextStyles.defaultFontDSizeBlack100Bold1,
      ),
    );
  }

  Widget _tryAgainButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: () {
          getIt<ProductsCubit>().fetchProducts();
        },
        child: const Text("try again"),
      ),
    );
  }
}
