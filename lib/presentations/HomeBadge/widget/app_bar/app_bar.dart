import 'package:flutter/material.dart';
import '../../../profile/profile_badge.dart';
class AppPar extends StatelessWidget {
  const AppPar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:const Center(
        child:  Text("bdlha",style: TextStyle(
          color: Colors.black,
        ),
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white10,
      iconTheme:const IconThemeData(color: Colors.black),
      elevation: 0,
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                   const ProfileBadge(),
              ));

        }, icon:const Icon(
          Icons.person_outline_rounded,
          color: Colors.black,)
        ),
      ],
    );

  }
}
