import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/routes.dart';
import '../utils/service_locator.dart';


class HomeProvider extends ChangeNotifier{
   var navigationService = locator<NavigationService>();

  FilePickerResult? result ;


  chooseFile()async{
    result=await FilePicker.platform.pickFiles(allowMultiple: true,
      type: FileType.video,
    );
    navigationService.navigateTo(UploadScreenRoute);
    notifyListeners();

  }




}