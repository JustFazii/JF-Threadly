import 'package:flutter/material.dart';
import 'package:threadly/features/auth/presentations/widgets/gender_radio_tile.dart';

class GenderPicker extends StatelessWidget {
  // ignore: use_super_parameters
  const GenderPicker({
    Key? key,
    required this.gender,
    required this.onChanged,
  }) : super(key: key);

  final String? gender;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GenderRadioTile(
            title: 'Male',
            value: 'male',
            selectedValue: gender,
            onChanged: onChanged,
          ),
          GenderRadioTile(
            title: 'Female',
            value: 'female',
            selectedValue: gender,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
