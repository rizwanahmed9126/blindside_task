import 'package:flutter/material.dart';

class txtField extends StatelessWidget {
  final String title;
  final TextEditingController cnt;
  const txtField({Key? key,required this.cnt,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "$title",
        //   style: TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w500,
        //       color: Colors.grey),
        // ),
        SizedBox(height: 5,),

        Container(
          width: 500,
          child: TextFormField(
            // keyboardType: TextInputType.emailAddress,
            controller: cnt,
            autocorrect: true,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 0,
              ),
              hintText: '$title',
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color:
                  Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
