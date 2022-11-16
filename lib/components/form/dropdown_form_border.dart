import 'package:flutter/material.dart';

import '../../helper/size_config.dart';
import '../../theme/appfont.dart';
import '../../theme/apptheme.dart';
import '../spacing.dart';

typedef DropdownText<T> = String Function(T value);

class DropdownFormBorder<T> extends StatelessWidget {
  final List<T> list;

  final T? value;
  final String? label;
  final DropdownText<T> textSetter;

  final ValueChanged<T?>? onChange;
  
  final String hintText;
  DropdownFormBorder({
    Key? key,
    required this.list,
    required this.textSetter,
    this.value,
    this.onChange,
    this.label,
    this.hintText = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Text(label!, style: AppFont.inputLabel),
        if (label != null) const ExtraHeight(8),
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<T>(
            decoration: AppTheme.inputTheme,
            alignment: Alignment.centerLeft,
            isDense: true,
            isExpanded: false,
            hint: Text(hintText, style: AppFont.formHint),
            borderRadius: BorderRadius.circular(8),
            selectedItemBuilder: (_) {
              return list.map((e) => Text(textSetter(e))).toList();
            },
            items: list
                .map(
                  (e) => DropdownMenuItem(
                      value: e,
                      child: Container(
                        width: SizeConfig.screenWidth - 32,
                        padding: const EdgeInsets.all(8),
                        decoration: e != list.last ? AppTheme.boxUnderline : null,
                        child: Text(textSetter(e)),
                      )),
                )
                .toList(),
            onChanged: onChange,
            value: value,
          ),
        ),
      ],
    );
  }
}
