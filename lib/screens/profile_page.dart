import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/screens/widgets/profile_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoppingapp/models/arguments.dart';
import 'package:shoppingapp/screens/signin_page.dart';

class ProfilePage extends StatelessWidget {
     final List<EmailPwd>? profilelist;

   const ProfilePage({Key? key, this.profilelist}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants.primaryColor.withOpacity(.5),
                  width: 5.0,
                ),
              ),
              child:  const CircleAvatar(
                radius: 60,

              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profilelist![0].email,
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),
            ),
            Text(profilelist![0].email,
              style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  ProfileWidget(
                    icon: Icons.person,
                    title: 'My Profile',

                  ),
                  ProfileWidget(
                    icon: Icons.settings,
                    title: 'Settings',
                  ),
                  ProfileWidget(
                    icon: Icons.notifications,
                    title: 'Notifications',
                  ),
                  ProfileWidget(
                    onTapped:(){
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: SignIn(),
                            type: PageTransitionType.bottomToTop),
                    );
                  },
                    icon: Icons.logout,
                    title: 'Log Out',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),

    );

  }
}
