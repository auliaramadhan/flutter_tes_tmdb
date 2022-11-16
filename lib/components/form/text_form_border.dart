import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_color.dart';
import '../../theme/appfont.dart';

class TextFormBorder extends StatefulWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextEditingController? controller;

  final TextInputType keyboardType;

  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? prefix;
  final bool enabled;
  final GestureTapCallback? onTap;

  final bool obscureText;
  final bool showAlert;

  final List<TextInputFormatter>? inputFormatters;

  final int? minLines;
  final int? maxLines;
  
  final bool readOnly;

  const TextFormBorder({
    Key? key,
    required this.label,
    this.validator,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.minLines,
    this.onTap,
    this.maxLines = 1,
    this.showAlert = true,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<TextFormBorder> createState() => _TextFormBorderState();
}

class _TextFormBorderState extends State<TextFormBorder> {
  String text = '';
  

  bool get _isError {
    if (widget.validator != null) {
      if (widget.validator!(text) != null) {
        return true && text.isNotEmpty;
      }
    }
    return false;
  }

  bool get _isSuccess => !_isError && text.isNotEmpty;

  OutlineInputBorder get _border {
    var color = AppColor.divider;
    if (_isError) {
      color = AppColor.error;
    } else if (_isSuccess) {
      color = AppColor.success;
    }
    // print(color.toString());
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(color: color, width: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(widget.label, style: AppFont.inputLabel),
        ),
        TextFormField(
          keyboardType: widget.keyboardType,
          onSaved: (newValue) => text = newValue!,
          onChanged: (value) {
            setState(() {
              text = value;
            });
            widget.onChanged?.call(value);
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          controller: widget.controller,
          validator: widget.validator,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          onTap: widget.onTap,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 28),
            hintText: widget.hintText,
            hintStyle: AppFont.formHint,
            // isCollapsed: true,
            // focusColor: AppColor.primary,
            // hoverColor: AppColor.primary,
            iconColor: AppColor.primary,
            fillColor: AppColor.bgDisableForm,
            filled: !widget.enabled,
            isDense: true,
            // errorText: "",
            // errorStyle: const TextStyle(fontSize:0.01),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: _border,
            focusedBorder: _border,
            errorBorder: _border,
            enabledBorder: _border,
            focusedErrorBorder: _border,
            suffix: widget.suffix,
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: widget.suffixIconConstraints,
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            // : widget. ,
          ),
        ),
        // if (_isError && widget.showAlert )
        //   Text(
        //     'ⓘ ${widget.validator!.call(text) ?? 'error'}',
        //     style: AppFont.formlabelError,
        //   ),
        // if (_isSuccess && widget.showAlert)
        //   const Text(
        //     '✔ success',
        //     style: AppFont.formlabelSuccess,
        //   ),
      ],
    );
  }
}
