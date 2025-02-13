import 'package:flutter/material.dart';
class CDropdownButtonFormFieldWidget extends StatelessWidget {
  final   String value ;
  final   List<String> list ;
  const CDropdownButtonFormFieldWidget({super.key, required this.value, required this.list});

  @override
  Widget build(BuildContext context) {
    return      DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: list.map((String country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList(),
      onChanged: (value) {
        // setState(() => selectedCountry = value!);
      },
    );

  }
}
