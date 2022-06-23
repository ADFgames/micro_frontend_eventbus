import 'package:design_system/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final FocusNode? focusNode;
  final String? hint;
  final Widget? icon;
  final bool enabled;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final int? maxLength;
  final int? maxLines;
  final int? errorMaxLines;
  final bool? showMaxLength;
  final bool readOnly;
  final Function()? onTap;
  final String? helperText;
  final bool autofocus;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool filled;
  final InputBorder? border;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function()? onEditingComplete;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.focusNode,
    this.hint,
    this.icon,
    this.enabled = true,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputFormatter,
    this.maxLength,
    this.maxLines = 1,
    this.errorMaxLines = 1,
    this.showMaxLength,
    this.readOnly = false,
    this.onTap,
    this.helperText,
    this.autofocus = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.filled = true,
    this.border,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      inputFormatters: widget.textInputFormatter,
      enabled: widget.enabled,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      textCapitalization: TextCapitalization.none,
      textInputAction: widget.textInputAction,
      cursorColor: SPcolors.primaryColor,
      style: TextStyle(
        color: widget.enabled ? SPcolors.primaryColor.shade700 : SPcolors.greyColor[300],
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontFamily: 'Lembra',
        height: (20 / 16),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12, bottom: 8, right: 20),
        counterText: widget.showMaxLength == true ? null : '',
        suffixIcon: widget.icon,
        filled: widget.filled,
        border: widget.border,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: SPcolors.containerColor),
          borderRadius: BorderRadius.circular(17),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: SPcolors.secondaryColor),
          borderRadius: BorderRadius.circular(17),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: SPcolors.containerColor),
          borderRadius: BorderRadius.circular(17),
          gapPadding: 5.0,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: SPcolors.containerColor),
          borderRadius: BorderRadius.circular(17),
        ),
        fillColor: widget.enabled
            ? _focusNode.hasFocus
                ? SPcolors.containerColor.shade300
                : SPcolors.containerColor.shade200
            : SPcolors.containerColor.shade300,
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: SPcolors.primaryColor,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lembra',
          height: (20 / 16),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: SPcolors.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lembra',
          height: (20 / 16),
        ),
        alignLabelWithHint: true,
        errorStyle: TextStyle(
          color: SPcolors.errorRedColor.shade100,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lembra',
          height: (16 / 12),
        ),
        helperText: widget.helperText,
        helperStyle: const TextStyle(
          color: SPcolors.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontFamily: 'Lembra',
          height: (16 / 12),
        ),
        errorMaxLines: widget.errorMaxLines,
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
    );
  }
}
