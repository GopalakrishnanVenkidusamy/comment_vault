import 'package:comment_vault/utils/vault_path_export.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String signupButtonName = "Signup";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: BlocListener<FcmAuthenticationBloc, FcmAuthenticationState>(
            listener: (context, state) {
              if (state is FcmRegistrationSuccessState) {
                BlocProvider.of<FcmAuthenticationBloc>(context)
                    .add(FcmSetUserDataEvent(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  userDetails: state.user,
                ));
              } else if (state is FcmSetUserDataSuccessState) {
                Navigator.pushNamed(
                  context,
                  PageRoutes.login,
                );
              } else if (state is FcmAuthenticationFailedState) {
                signupButtonName = "Signup";
                setState(() {});
                AppSnackBar.showSnackBar(context, state.errorMessage);
              } else if (state is FcmAuthenticationExceptionState) {
                signupButtonName = "Signup";
                setState(() {});
                AppSnackBar.showSnackBar(context, state.exceptionErrorMessage);
              }else if(state is FcmAuthenticationLoadingState){
                signupButtonName = "Loading...";
                setState(() {});
              }
            },
            child: CustomScrollView(reverse: true, slivers: [
              SliverFillRemaining(
                  hasScrollBody: false,
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
                              //Name
                              VaultTextField(
                                hintText: "Name",
                                controller: nameController,
                                inputType: TextInputType.name,
                                validator: (name) =>
                                    Validator.validateName(name: name!),
                              ),
                              //Email
                              VaultTextField(
                                hintText: "Email",
                                controller: emailController,
                                inputType: TextInputType.emailAddress,
                                autoValidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (email) =>
                                    Validator.validateEmail(email: email!),
                              ),

                              //Password
                              VaultTextField(
                                hintText: "Password",
                                controller: passwordController,
                                inputType: TextInputType.visiblePassword,
                                validator: (password) =>
                                    Validator.validatePassword(
                                        password: password!),
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
                                  BlocProvider.of<FcmAuthenticationBloc>(
                                          context)
                                      .add(FcmAuthenticationRegistrationEvent(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text));
                                }
                              },
                              buttonTitle: signupButtonName,
                            ),
                            ConstWidget.kSizeBox15,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already hava an account ? ",
                                    style: TextStyles.kLabelMedium),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      PageRoutes.login,
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyles.kLabelMedium.copyWith(
                                        color: VaultColor.kPrimaryColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
