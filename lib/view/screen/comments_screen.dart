import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../providers/cmnts_plus_upload_provider.dart';
import 'package:intl/intl.dart';
import 'package:relative_scale/relative_scale.dart';

import '../widgets/comments_widget.dart';


class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  String formattedDate = DateFormat('HH:mm:a').format(DateTime.now());
  //var navigationService = locator<NavigationService>();
  final double minValue = 8.0;
  final double iconSize = 28.0;
  FocusNode? _focusNode;
  TextEditingController _txtController = TextEditingController();

  bool isCurrentUserTyping = false;
  ScrollController? _scrollController;

  String message = '';

  var isLoading = false;

  initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0);

    _focusNode = FocusNode();
    _focusNode!.addListener(() {
      print('Something happened');
    });
  }

  @override
  void dispose() {
    _scrollController!.dispose();

    super.dispose();
  }


  void _onMessageChanged(String value) {
    setState(() {
      message = value;
      if (value.trim().isEmpty) {
        isCurrentUserTyping = false;
        return;
      } else {
        isCurrentUserTyping = true;
      }
    });
  }

  // ignore: unused_element
  void _like() {}
  void _sendMessage() {
    setState(() {
      myMessages.insert(
          0, (Message(messageBody: message, senderId: 22)));
      message = '';
      _txtController.text = '';
    });
    _scrollToLast();
  }

  void _scrollToLast() {
    _scrollController!.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              height: sy(95),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          color: Colors.black,
                          icon: Icon(
                            Icons.keyboard_arrow_left,
                            size: sy(18),
                          ),
                          onPressed: () {
                            // navigationService.navigateTo(HomeScreenRoute);
                          }),
                      SizedBox(
                        width: sx(25),
                      ),
                      Text(
                        "Comments",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 440,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              margin: EdgeInsets.only(
                top: sy(70),
              ),
              child: Column(
                children: [
                  Container(
                    child: Text("TODAY AT " + formattedDate),
                  ),
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(
                            vertical: minValue * 1, horizontal: minValue),
                        itemCount: myMessages.length,
                        itemBuilder: (context, index) {
                          final Message message = myMessages[index];
                          return MyMessageChatTile(
                            message: message,
                            isCurrentUser:true,
                          );
                        }),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: sy(0)),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(color: Colors.white),
                    child: _buildBottomSection(),
                  )),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBottomSection() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: sy(35),
              margin: EdgeInsets.fromLTRB(sx(25), sy(5), sx(25), sy(5)),
              padding: EdgeInsets.symmetric(horizontal: minValue),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    sy(10),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  Row(

                    children: [
                      Container(
                        width: 190.w,
                        child: TextField(
                          focusNode: _focusNode,
                          keyboardType: TextInputType.text,
                          controller: _txtController,
                          onChanged: _onMessageChanged,
                          decoration: InputDecoration(


                            border: InputBorder.none,
                            hintText: "Type your message",

                          ),
                          autofocus: false,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: sy(5),
                          bottom: sy(5),
                        ),
                        child: VerticalDivider(),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      if(_txtController.text.isEmpty){
                        return;
                      }

                      _sendMessage();
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.send,
                        size: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}