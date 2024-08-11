
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/theming/colors.dart';
import '../../../../../../../core/utils/theming/styles.dart';


@immutable
class CustomChip extends StatefulWidget {
  final Function(String) onSaved;
  void Function()? onDelete;
  CustomChip({
required this.idSkills,
    this.text="",
    required this.onSaved,this.onDelete,
    super.key,
  });
  String text;
  bool onClick=false;
num idSkills;
  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  // Add a listener to detect focus changes

  @override
  Widget build(BuildContext context) {
    var keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 137.w,
            height: 34.h,
            child: widget.onClick||widget.text.isEmpty ?

                     TextField(
                        onSubmitted: (value) {
                          {
                            setState(() {
                              widget.text = value;
                              widget.onSaved(value);

                              widget.onClick = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: ColorManager.primary900)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: ColorManager.primary900)),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                        ))
                    : Container(
                        decoration: BoxDecoration(
                            color: ColorManager.primary100,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.text ,
                                style:
                                    TextStyles.font12Color900Primary500Weight,
                              ),
                              GestureDetector(
                                onTap:widget.onDelete,
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                  color: ColorManager.primary900,
                                ),
                              )
                            ],
                          ),
                        )))
               ));
  }
}
