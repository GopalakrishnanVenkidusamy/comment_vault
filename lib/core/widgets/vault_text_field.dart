import 'package:comment_vault/utils/vault_path_export.dart';


class VaultTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;

  const VaultTextField({
    super.key,
    required this.hintText,
    required this.inputType,
    this.validator,
    this.autoValidateMode,
    this.controller,
    this.maxLength,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        maxLines:maxLines??1 ,
        maxLength: maxLength,
        controller: controller,
        autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        style: TextStyles.kLabelSmall.copyWith(color: Colors.black),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: hintText,
          hintStyle: TextStyles.kLabelSmall,
                  filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),

        ),
        ),
      ),
    );
  }
}
