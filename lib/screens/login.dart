import 'package:comment_vault/utils/vault_path_export.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  String loginButtonName = "Login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Comments",
          style: TextStyles.kTitleSmall.copyWith(color: VaultColor.kPrimaryColor),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocListener<FcmAuthenticationBloc, FcmAuthenticationState>(
            listener: (context, state) {
              if (state is FcmLoginSuccessState) {
                Navigator.pushNamed(
                  context,
                  PageRoutes.comments,
                );
              }else if (state is FcmAuthenticationFailedState) {
                loginButtonName = "Login";
                setState(() {});
                AppSnackBar.showSnackBar(context, state.errorMessage);
              } else if (state is FcmAuthenticationExceptionState) {
                loginButtonName = "Login";
                setState(() {});
                AppSnackBar.showSnackBar(
                    context, state.exceptionErrorMessage);
              }else if(state is FcmAuthenticationLoadingState){
                loginButtonName = "Loading... ";
                setState(() {});
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Email
                        VaultTextField(
                          hintText: "Email",
                          controller: emailEditingController,
                          inputType: TextInputType.emailAddress,
                          validator: (email) =>
                              Validator.validateEmail(email: email!),
                        ),
                          
                        ConstWidget.kSizeBox5,
                          
                        //Password
                        VaultTextField(
                          hintText: "Password",
                          controller: passwordEditingController,
                          inputType: TextInputType.visiblePassword,
                          validator: (password) =>
                              Validator.validatePassword(password: password!),
                        ),
                        ConstWidget.kSizeBox15,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      VaultButton(
                        onclick: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<FcmAuthenticationBloc>(context).add(
                                FcmAuthenticationLoginEvent(
                                    email: emailEditingController.text,
                                    password: passwordEditingController.text));
                          }
                        },
                        buttonTitle: loginButtonName,
                      ),
                      ConstWidget.kSizeBox15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("New here? ", style: TextStyles.kLabelMedium),
                          InkWell(
                            onTap: () {
                              //Navigator.pushNamed(context, PageRoutes.archanaiDetail,arguments: state.archanaiDetails.archanaiList![index]);
                              Navigator.pushNamed(
                                context,
                                PageRoutes.signup,
                              );
                            },
                            child: Text(
                              'Signup',
                              style: TextStyles.kLabelMedium.copyWith(
                                  color: VaultColor.kPrimaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
