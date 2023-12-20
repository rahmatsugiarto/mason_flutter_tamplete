import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/resources/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final String? hintText;
  final String? prefixImage;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final bool hidePassIcon;
  final Widget? suffixIcon;
  final bool isUseBorder;
  final bool readOnly;
  final Function()? onTap;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final int? minLines;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(PointerDownEvent)? onTapOutside;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixImage,
    this.validator,
    this.label,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.hidePassIcon = false,
    this.suffixIcon,
    this.isUseBorder = true,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.contentPadding,
    this.fillColor = Colors.white,
    this.minLines,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.onTapOutside,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Builder(
          builder: (context) {
            if (widget.label != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label ?? "",
                    style: TextStyles.pop12W400(
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 6.0),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          minLines: widget.minLines,
          textAlign: widget.textAlign,
          inputFormatters: widget.inputFormatters,
          onTapOutside: widget.onTapOutside ??
              (_) {
                FocusScope.of(context).unfocus();
              },
          obscureText: widget.hidePassIcon ? obscureText : widget.hidePassIcon,
          style: TextStyles.pop12W400(),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyles.pop12W400(color: Colors.grey),
            isDense: true,
            contentPadding: widget.contentPadding ??
                EdgeInsets.only(
                  top: 12,
                  bottom: 12,
                  right: widget.hidePassIcon == true ? 0 : 12,
                  left: widget.prefixImage != null ? 0 : 12,
                ),
            fillColor: widget.fillColor,
            filled: true,
            prefixIcon: widget.prefixImage != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Image.asset(
                      widget.prefixImage ?? "",
                      width: 16,
                      height: 16,
                    ),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: widget.isUseBorder
                  ? const BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: widget.isUseBorder
                  ? const BorderSide(
                      color: Colors.blue,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: widget.isUseBorder
                  ? const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
            suffixIconColor: Colors.grey,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            suffixIcon: widget.hidePassIcon
                ? GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(
                        obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    })
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
