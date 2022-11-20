import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/screens/root_page.dart';
import 'package:shoppingapp/screens/widgets/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoppingapp/models/arguments.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  List<EmailPwd> newemailpwd = [];
  final password = GlobalKey<CustomTextfieldState>();
  final eMail = GlobalKey<CustomTextfieldState>();

  ValueNotifier<bool> testError = ValueNotifier(false);
  ValueNotifier<bool> circularIndicator = ValueNotifier(false);

  Future<dynamic> fatching() async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * 0.5,
                width: size.width * 0.5,
              ),
              const Text(
                'LOG IN',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextfield(
                key: eMail,
                obscureText: false,
                hintText: 'Enter Email',
                icon: Icons.email,
              ),
              CustomTextfield(
                key: password,
                obscureText: true,
                hintText: 'Enter Password',
                icon: Icons.lock,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  final statePwd = password.currentState!;
                  final stateEmail = eMail.currentState!;
                  String password1 = stateEmail.username.text;

                  if (password1 == 'abc@gmail.com' && statePwd.password.text == '1234') {
                    circularIndicator.value = true;
                    newemailpwd
                        .add(EmailPwd(password1, statePwd.password.text));
                    await fatching();
                    Navigator.of(context).push(PageTransition(child: RootPage(myMail: newemailpwd,), type: PageTransitionType.rightToLeft));
                    stateEmail.username.clear();
                    statePwd.password.clear();
                    circularIndicator.value = false;
                  } else if (password1.isEmpty &&
                      statePwd.password.text.isEmpty) {
                    testError.value = false;
                  } else {
                    testError.value = true;
                  }
                },
                child: Container(
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  SizedBox(
                    height: 20,
                    child: ValueListenableBuilder(
                        valueListenable: circularIndicator,
                        builder: (BuildContext ctx, bool indicator, child) {
                          return Center(
                            child: indicator ? const CircularProgressIndicator(

                              color: Colors.white,
                            ) :
                           const Text('LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          );
                        }),


                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                  valueListenable: testError,
                  builder: (BuildContext ctx, bool error, child) {
                    return Center(
                      child: error
                          ? const Text(
                              'Invalid email or password',
                              style: TextStyle(color: Colors.red),
                            )
                          :const  Text(''),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
