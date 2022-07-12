import 'package:flutter/material.dart';

class PassTxtField extends StatefulWidget {
  final String title;
  final TextEditingController cnt;
  const PassTxtField({Key? key,required this.title,required this.cnt}) : super(key: key);

  @override
  State<PassTxtField> createState() => _PassTxtFieldState();
}

class _PassTxtFieldState extends State<PassTxtField> {

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          width: 500,
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: widget.cnt,
            obscureText: !_showPassword,
            autocorrect: true,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 0,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: !_showPassword
                  ? IconButton(
                icon: Icon(
                  Icons.visibility_off,
                  size: 15,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = true;
                  });
                },
              )
                  : IconButton(
                icon: Icon(
                  Icons.visibility,
                  size: 15,
                  color: Theme.of(context)
                      .indicatorColor,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = false;
                  });
                },
              ),
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
      ],
    );
  }
}
