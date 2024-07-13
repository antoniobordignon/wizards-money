import 'package:flutter/material.dart';
import 'package:wizards_money/common/constants/app_collors.dart';
import 'package:wizards_money/common/constants/app_text_styles.dart';
import 'package:wizards_money/common/widgets/primary_button.dart';

void customModalBottomSheet({
    required BuildContext context,
    required String content,
    String? buttonText,
  }) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Ops. Algo deu errado.',
                style: AppTextStyles.mediumText20
                  .copyWith(color: AppColors.greenOne),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0, 
                  horizontal: 32.0,
                ),
                child: PrimaryButton(
                  text: 'Tentar Novamente',
                  onPressed: () => Navigator.pop(context),
                ),
               ),
            ]
          )
        )
      );
    }
  );
}