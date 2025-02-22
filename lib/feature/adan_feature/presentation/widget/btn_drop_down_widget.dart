import 'package:flutter/material.dart';
import 'package:prayer_times/core/utls/app_style.dart';
class BtnDropDownWidget extends StatelessWidget {
  final  String initialSelection;
  final List<DropdownMenuEntry<String>> listDropDown;
  final void Function(String?)? onSelected;
  const BtnDropDownWidget({super.key, required this.initialSelection, required this.listDropDown, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return    DropdownMenu(
      width: double.infinity,
      textStyle: AppStyle.textStyle18NotoKufia,
      trailingIcon: const Icon(
        Icons.keyboard_arrow_down,
        size: 30,
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            )),
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),

      ),
      initialSelection: initialSelection,
      dropdownMenuEntries:listDropDown,
      onSelected: onSelected,
    );

  }
}
