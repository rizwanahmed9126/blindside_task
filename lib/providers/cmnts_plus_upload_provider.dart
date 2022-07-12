import 'dart:io';
import 'dart:typed_data';

import 'package:blind_side/providers/user_provider.dart';
import 'package:blind_side/services/util_service.dart';
import 'package:blind_side/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_video_info/flutter_video_info.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../services/navigation_service.dart';
import '../services/storage_service.dart';
import '../utils/service_locator.dart';


class UploadProvider extends ChangeNotifier{
  final titleCnt=TextEditingController();
  final descCnt=TextEditingController();
  bool allowCmnts=true;
  var focusNode = FocusNode();
  final utilService=locator<UtilService>();
  var navigationService = locator<NavigationService>();

  bool isLoadingProgress=false;

  showLoader(bool value){

    isLoadingProgress=value;
    notifyListeners();
  }







  final videoInfo = FlutterVideoInfo();
  Uint8List? uint8list;
  final FirebaseFirestore _firebase= FirebaseFirestore.instance;



  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }


 Future<dynamic> uploadVideo(context,FilePickerResult? result)async{
    if(titleCnt.text.isEmpty || descCnt.text.isEmpty || result==null){
      utilService.showToast("Fill all fields");
      return "fail";

    }else{
      uint8list = await VideoThumbnail.thumbnailData(
        video: result.paths.first!,
        imageFormat: ImageFormat.PNG,
        // maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
        // quality: 25,
      );
      final videoUrl= await getMediaUrl(result.files.first.name, result.paths.first!);
      final thumbnailUrl= await getMediaUrlThumbnail(result.files.first.name, uint8list!);

      var info = await videoInfo.getVideoInfo(result.paths.first!);
      print(info?.duration);
      print('${Provider.of<AuthProvider>(context,listen: false).userData!.name}');
      print('${Provider.of<AuthProvider>(context,listen: false).userData!.email}');


      _firebase.collection('videos')
          .add({
        'videoUrl': '${videoUrl}',
        'thumbnailUrl': '${thumbnailUrl}',
        'duration': '${_printDuration(Duration(milliseconds:info!.duration!.toInt()))}',
        'title': '${titleCnt.text}',
        'desc': '${descCnt.text}',
        'AllowCmnts': '$allowCmnts',
        'userName': '${Provider.of<AuthProvider>(context,listen: false).userData!.name}',
        'userEmail': '${Provider.of<AuthProvider>(context,listen: false).userData!.email}',
      });
      navigationService.navigateTo(HomeScreenRoute);



    }

    return "done";



   }


  Future<String> getMediaUrl(String name,String path)async{
    firebase_storage.Reference storageReference;
    storageReference =
        firebase_storage.FirebaseStorage.instance.ref().child("videos/$name");
    final firebase_storage.UploadTask uploadTask = storageReference. putFile(File(path));
    final firebase_storage.TaskSnapshot downloadUrl =
    (await uploadTask.whenComplete(() => null));
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("url $url");

    return url;
  }

  Future<String> getMediaUrlThumbnail(String name,Uint8List path)async{
    firebase_storage.Reference storageReference;
    storageReference =
        firebase_storage.FirebaseStorage.instance.ref().child("thumbnails/$name");
    final firebase_storage.UploadTask uploadTask = storageReference.putData(path);
    final firebase_storage.TaskSnapshot downloadUrl =
    (await uploadTask.whenComplete(() => null));
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("url $url");

    return url;
  }

  setAllowCmnts(bool value){
    allowCmnts= value;
    notifyListeners();
  }


}



class Message {
  String? senderName;
  int? senderId;
  String? messageBody;
  File? file;
  Message({this.messageBody, this.senderName, this.file, this.senderId});
}

final myMessages = <Message>[
  // Message(messageBody: "Hello! How are you doing?", senderId: 2,senderName: "Erick Anderson"),
  // Message(messageBody: "Let me check that I have this right…", senderId: 1,senderName: "Bradley"),
  // Message(messageBody: "If I understand you correctly…", senderId: 1,senderName: "Bradley"),
  // Message(
  //     messageBody:
  //     "Perfect, I am really glad to hear that! How may I help you today?",
  //     senderId: 1,senderName: "Bradley"),
  // Message(messageBody: "That is a good question.", senderId: 2,senderName: "Erick Anderson"),
  // Message(
  //     messageBody: "I’m not sure, but let me find out for you.", senderId: 1,senderName: "Bradley"),
  // Message(
  //     messageBody:
  //     "May I put your call on hold while I am checking your order?",
  //     senderId: 1,senderName: "Bradley"),
  // Message(messageBody: "Yeah, Sure..", senderId: 2,senderName: "Erick Anderson"),
  // Message(messageBody: "Thank you for holding. ", senderId: 1,senderName: "Bradley"),
  // Message(
  //     messageBody:
  //     "I have the details of your latest payment, let me send it over to you.",
  //     senderId: 1,senderName: "Bradley"),
  // Message(messageBody: "Yeah. You may send to my account.", senderId: 2,senderName: "Erick Anderson"),
  // Message(
  //     messageBody:
  //     "I’m sorry, It is not available right now. May I help you with something else?",
  //     senderId: 1,senderName: "Bradley"),
];
