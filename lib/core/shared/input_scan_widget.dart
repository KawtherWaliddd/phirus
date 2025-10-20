import 'package:flutter/material.dart';
import 'package:phirus/core/theme/colors_manager.dart';

class InputScanWidget extends StatelessWidget {
  const InputScanWidget(
      {super.key, required this.input, required this.textEditingController});
  final String input;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.whiteColor,
          hintText: input,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),
    );
  }
}
