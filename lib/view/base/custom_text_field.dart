import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final bool isPassword;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool showTitle;

  CustomTextField({
    this.hintText = 'Write something...',
    required this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.onSubmit,
    this.suffixIcon,
    this.onChanged,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.showTitle = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintText, style: titleRegularSFPRODISPLAY.copyWith(fontSize: Dimensions.fontSizeSmall)),
        TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          style: titleRegularSFPRODISPLAY.copyWith(fontSize: Dimensions.fontSizeSmall),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: light().primaryColor,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.36)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black.withOpacity(0.36)),
            ),
            contentPadding: const EdgeInsets.all(0),
            isDense: true,
            hintText: widget.hintText,
            fillColor: Theme.of(context).cardColor,
            hintStyle: titleRegularSFPRODISPLAY.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.transparent),
            filled: true,
            suffixIcon: widget.isPassword ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.black.withOpacity(0.15),size: Dimensions.fontSizeMedium),
              onPressed: _toggle,
            ) : IconButton(
              icon: Icon(widget.suffixIcon, color: light().primaryColor),
              onPressed: () {},
            ),
          ),
          onSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
        ),

      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
