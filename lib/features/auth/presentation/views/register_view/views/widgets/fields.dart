import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';


import 'package:intl/intl.dart';

import '../../../../../../../core/utils/theming/colors.dart';

class Fields extends StatefulWidget {
   Fields({super.key, required this.platform, required this.height,this.selectedDate,this.onChanged});
 final double height;
  final DateTimeFieldPickerPlatform platform;
  DateTime? selectedDate;

    void Function(DateTime?)? onChanged;
  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  DateTime? selectedTime;
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(

      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: widget.height??0), // Increase vertical padding
          filled: true,
          fillColor: ColorManager.gray50,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16))),
      value: widget.selectedDate,
      dateFormat: DateFormat('yyyy-MM-dd'),
      mode: DateTimeFieldPickerMode.date,
        
      lastDate: DateTime.now(),
      initialPickerDateTime: DateTime(1999),
      pickerPlatform: widget.platform,
      onChanged:widget.onChanged
    );
  }
}