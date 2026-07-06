import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/helper/theme_extention.dart';

class CustomInputField extends StatefulWidget {
  final String? initialValue;
  final String? hintKey;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? textInputColor;
  final Function()? onTap;
  final bool enabled;
  final bool isSelected;
  final bool evaluation;
  final bool isObscureText;
  final bool isDigitOnly;
  final String? Function(String?)? validator;
  final int minLines;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final Function()? onSaved;
  final Color? borderColor;
  final Color? filledColor;
  final Color? labelHintStyle;
  final Color? labelErrorStyle;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isReadOnly;
  final TextInputAction? action;
  final TextAlign? labelHintTextAlign;
  final double? radius;
  final bool? alignMultipleLines;
  final FocusNode? fieldFocusNode;
  final Offset? shadowOffset;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final double? hintFontSize;
  final Color? focusAndErrorColor;
  final Color? enabledColor;
  final InputBorder? border;
  final String? label;
  final Color? labelColor;

  const CustomInputField({
    Key? key,
    this.initialValue,
    this.hintKey,
    this.controller,
    this.keyboardType,
    this.textInputColor,
    this.onTap,
    this.enabled = true,
    this.isSelected = false,
    this.evaluation = false,
    this.isObscureText = false,
    this.isDigitOnly = false,
    this.validator,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSaved,
    this.borderColor,
    this.filledColor,
    this.labelHintStyle,
    this.labelErrorStyle,
    this.inputFormatter,
    this.isReadOnly,
    this.action,
    this.labelHintTextAlign,
    this.radius,
    this.alignMultipleLines,
    this.fieldFocusNode,
    this.shadowOffset,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.focusAndErrorColor,
    this.hintFontSize,
    this.border,
    this.enabledColor,
    this.label,
    this.labelColor,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late TextEditingController _controller;
  bool _isInternalController = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController(text: widget.initialValue ?? '');
      _isInternalController = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.label != null
            ? Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      widget.label!,
                      style: context.textTheme.bodySmallFont.copyWith(
                        color: widget.labelColor!,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              )
            : const SizedBox(height: 0),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          style: context.textTheme.bodyMediumFont.copyWith(
            color: widget.textInputColor ?? context.colors.textPrimary,
          ),
          onTap: widget.onTap,
          enabled: widget.enabled,
          obscureText: widget.isObscureText,
          readOnly: widget.isReadOnly ?? false,
          decoration: InputDecoration(
            hintText: widget.hintKey,
            hintStyle: context.textTheme.bodyMediumFont.apply(
              color: widget.labelHintStyle ?? context.colors.gray400,
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.contentPaddingHorizontal ?? 0.0,
              vertical: widget.contentPaddingVertical ?? 0.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 0),
              borderSide: BorderSide(
                color: widget.focusAndErrorColor ?? context.colors.purple500,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
              borderSide: BorderSide(color: context.colors.error500, width: 2),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 4.00),
              borderSide: BorderSide(
                color: widget.focusAndErrorColor ?? context.colors.error500,
              ),
            ),
            errorStyle: context.textTheme.bodySmallFont.copyWith(
              color: widget.labelErrorStyle,
            ),
            errorMaxLines: 2,
            fillColor: widget.filledColor,
            filled: true,
            isDense: true,
            labelStyle: context.textTheme.bodyMediumFont.copyWith(
              color: widget.labelHintStyle ?? context.colors.gray600,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 4.00),
              borderSide: BorderSide(
                color: widget.enabledColor ?? context.colors.gray400,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 4.00),
              borderSide: BorderSide(
                color: widget.enabledColor ?? context.colors.gray300,
                width: 1,
              ),
            ),
            border: widget.border ?? InputBorder.none,
          ),
          validator: widget.validator,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          inputFormatters: [
            if (widget.isDigitOnly)
              FilteringTextInputFormatter.digitsOnly
            else
              ...widget.inputFormatter ?? [],
          ],
          focusNode: widget.fieldFocusNode,
          textInputAction: widget.action,
        ),
      ],
    );
  }

  @override
  void dispose() {
    if (_isInternalController) {
      _controller.dispose();
    }
    super.dispose();
  }
}
