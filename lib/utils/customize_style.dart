import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testlineiq/utils/sizes.dart';

class TestlineCustomizeStyle {
  late final TestlineSizes sizes;

  TestlineCustomizeStyle()
      : sizes = TestlineSizes(constraints: null, orientation: null);

  TestlineCustomizeStyle.init(BoxConstraints constraints, Orientation orientation)
      : sizes =
            TestlineSizes(constraints: constraints, orientation: orientation);

  Widget testlineVerticalGap({double? verticalGapSizeInPercent}) {
    return SizedBox(
      height: sizes.getVerticalGapSize(
          verticalGapSizeInPercent:
              verticalGapSizeInPercent ?? sizes.verticalBlockSize),
    );
  }

  Expanded testlineVerticalGapExpanded() {
    return const Expanded(
      child: SizedBox.shrink(),
    );
  }

  Widget testlineHorizontalGap({double? horizontalGapSizeInPercent}) {
    return SizedBox(
      width: sizes.getHorizontalGapSize(
          horizontalGapSizeInPercent:
              horizontalGapSizeInPercent ?? sizes.horizontalBlockSize),
    );
  }

  Widget testlineGapSize(
      {required double horizontalGapSizeInPercent,
      required double verticalGapSizeInPercent}) {
    return SizedBox(
      width: sizes.getHorizontalGapSize(
          horizontalGapSizeInPercent: horizontalGapSizeInPercent),
      height: sizes.getVerticalGapSize(
          verticalGapSizeInPercent: verticalGapSizeInPercent),
    );
  }

  // Padding of all screen
  EdgeInsets testlineAllScreenPadding({double? ver,double? hor}) {
    return EdgeInsets.symmetric(
        horizontal: sizes.horizontalBlockSize * (hor ?? 4),
        vertical: sizes.horizontalBlockSize * ( ver ?? 2));
  }

  LottieBuilder testlineLottieImage(String imagePath,
      {double widthInPercent = 20, AnimationController? animationController}) {
    return Lottie.asset(
      imagePath,
      width: sizes.horizontalBlockSize * widthInPercent,
      fit: BoxFit.cover,
      controller: animationController,
      onLoaded: (composition) {
        if (animationController != null) {
          animationController.duration = composition.duration;
        }
      },
    );
  }
}


// Widget testlineLoginSignUpTextField({
//   bool needSuffixIcon = false,
//   required TextEditingController controller,
//   VoidCallback Function(String text)? onChangedText,
//   VoidCallback? onSuffixIconPressed,
//   String? hintText,
//   bool obscureText = false,
//   String? helperText,
//   Color? helperColor,
//   int? helperMaxLines,
// }) {
//   return Container(
//     padding: EdgeInsets.only(
//       left: sizes.horizontalBlockSize * 4,
//       right: sizes.horizontalBlockSize * 4,
//       bottom: helperText == null ? 0 : sizes.verticalBlockSize * 1.5,
//     ),
//     decoration: BoxDecoration(
//       borderRadius: testlineTextFieldBorderRadius(),
//       border: Border.all(
//         color: greyColor,
//       ),
//       color: loginSignTextFieldContainerBgLight,
//     ),
//     child: testlineTextField(
//       controller: controller,
//       hintText: hintText,
//       obscureText: obscureText,
//       suffixIcon: needSuffixIcon
//           ? obscureText
//               ? Icons.visibility_off_outlined
//               : Icons.visibility_outlined
//           : null,
//       onSuffixIconPressed: onSuffixIconPressed,
//       multiLine: false,
//       contentPadding: false,
//       outerBorder: false,
//       focusOuterBorder: false,
//       helperText: helperText,
//       helperColor: helperColor,
//       helperMaxLines: helperMaxLines,
//     ),
//   );
// }