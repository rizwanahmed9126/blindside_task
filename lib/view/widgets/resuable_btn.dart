import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const Btn({Key? key,required this.onPressed,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        // ignore: deprecated_member_use
        child: RaisedButton(
          highlightElevation: 3.0,
          elevation: 3.0,
          onPressed: onPressed,
          //     () {
          //   if(fullNameController.text.isEmpty || emailController.text.isEmpty || passController.text.isEmpty){
          //     provider.utilService.showToast("Please Enter all Fields");
          //     return;
          //   }
          //
          //   provider.handleSignUp(emailController.text, passController.text);
          // },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              80.0,
            ),
          ),
          padding: EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(19, 67, 195, 1),
                    Color.fromRGBO(8, 48, 159, 1),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            // constraints: BoxConstraints(
            //   maxWidth: 290,
            //   minHeight: 35,
            //
            // ),
            alignment: Alignment.center,
            child: Text(
              "$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
