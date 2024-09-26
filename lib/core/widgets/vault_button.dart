import 'package:comment_vault/utils/vault_path_export.dart';


class VaultButton extends StatelessWidget {
  const VaultButton({super.key,required this.onclick,required this.buttonTitle});
  final Function onclick;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2,
      height: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(6),
        ),
        color: VaultColor.kPrimaryColor,
        onPressed:(){onclick();},child: Text(buttonTitle,
      style:TextStyles.kLabelMedium.copyWith(color: Colors.white),),),
    );
  }
}
