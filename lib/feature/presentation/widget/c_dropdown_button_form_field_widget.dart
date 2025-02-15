import 'package:flutter/material.dart';
import 'package:prayer_times/core/utls/app_style.dart';

class CDropdownButtonFormFieldWidget extends StatelessWidget {
  final String value;

  final List<String> list;

  const CDropdownButtonFormFieldWidget(
      {super.key, required this.value, required this.list});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      iconDisabledColor: Colors.black87,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 30,
        color: Colors.white,
      ),
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: list.map((String country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(
            country,
            style: AppStyle.textStyle18NotoKufia.copyWith(color: Colors.white),
          ),
        );
      }).toList(),
      onChanged: (value) {
        // setState(() => selectedCountry = value!);
      },
      dropdownColor: Color(0xdd733487),
      borderRadius: BorderRadius.circular(8),

    );
  }
}
