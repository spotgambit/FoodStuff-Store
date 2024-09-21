import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../Repo/ColorRepo.dart';

class CustomDropdownWidget extends StatefulWidget {
  final bool isValid;
  final List<String> options;
  final Function(String?) onChanged;

  const CustomDropdownWidget({
    Key? key,
    required this.isValid,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownWidgetState createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedOption,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isValid ? ColorRepo.muted : ColorRepo.secondary,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.isValid ? ColorRepo.muted : ColorRepo.secondary,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(color: ColorRepo.muted, fontFamily: 'Urbanist', fontWeight: FontWeight.normal),
        hintText: 'Select a State',
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        suffixIcon: const Icon(
          PhosphorIcons.caret_down,
          color: ColorRepo.dark,
        ),
      ),
      iconEnabledColor: widget.isValid ? ColorRepo.dark : ColorRepo.primary2,
      iconDisabledColor: Colors.grey,
      isExpanded: true,
      icon: const SizedBox.shrink(),
      dropdownColor: ColorRepo.background,
      onChanged: (value) {
        setState(() {
          _selectedOption = value;
          widget.onChanged(value);
        });
      },
      items: widget.options
          .map((option) => DropdownMenuItem<String>(
        value: option,
        child: Text(
          option,
          style: const TextStyle(color: ColorRepo.dark, fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ))
          .toList(),
    );
  }
}
