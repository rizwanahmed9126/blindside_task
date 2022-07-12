import 'package:flutter/material.dart';
class ExpandableText extends StatefulWidget {
  //final Widget child;
  final String? desc;

  ExpandableText({Key? key, this.desc}) : super(key: key);

  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  //String descText = "Description Line 1\nDescription Line 2\nDescription Line 3\nDescription Line 4\nDescription Line 5\nDescription Line 6\nDescription Line 7\nDescription Line 8";
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    //final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(

      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          descTextShowFlag
              ? Container(
            width: width,
            child: Text(
              widget.desc!,
              overflow: TextOverflow.clip,

            ),
          )
              : Container(
            width: width,
            child: Text(
              widget.desc!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          //SizedBox(height: 10),
          InkWell(
            onTap: () {
              setState(() {
                descTextShowFlag = !descTextShowFlag;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                descTextShowFlag
                    ? Text(
                  "Show Less",
                  style: TextStyle(color: Colors.blue),
                )
                    : Text("...more", style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
        ],
      ),
    );
  }
}