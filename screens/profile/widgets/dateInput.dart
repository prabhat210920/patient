import 'package:doctor/core/style/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateInputField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final IconData icon;

  const DateInputField({
    super.key,
    required this.hint,
    required this.controller,
    required this.icon,
  });

  @override
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text =
            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      onTap: () => _selectDate(context), // Show date picker on tap
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: GoogleFonts.lato(
            color: AppColors.blackText,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 14 / 18),
        filled: true,
        fillColor: const Color(0xffF1F4F3),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        // Outline border styling
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: const Color(0xffF1F4F3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: const Color(0xffF1F4F3)),
        ),
        focusedBorder: InputBorder.none,

        suffixIcon: Icon(widget.icon, color: AppColors.blackText),
      ),
    );
  }
}
