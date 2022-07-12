import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:blind_side/providers/home_provider.dart';
import 'package:blind_side/providers/user_provider.dart';
import 'package:blind_side/view/screen/profile_screen.dart';
import 'package:blind_side/view/screen/uploaded_videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../services/navigation_service.dart';
import '../../services/storage_service.dart';
import '../../utils/service_locator.dart';
import '../widgets/will_pop_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();

  var bottomNavIndex = 0;
  final iconList = <IconData>[
  Icons.home,
  Icons.person,

  ];
  loadData() async {
    await storageService.setBoolData('isShowHome', true);
    Provider.of<AuthProvider>(context,listen: false)
        .setUData(userModel(email: await storageService.getData('email'),
        name: await storageService.getData('name',)));
    print('${Provider.of<AuthProvider>(context,listen: false).userData!.name}');
    print('${Provider.of<AuthProvider>(context,listen: false).userData!.email}');
    print('${await storageService.getData('email')}');
    print('${await storageService.getData('name')}');

  }


  @override
  void initState() {
    loadData();
    super.initState();
  }
  _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => ExitAlertDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Container(
            width: 55,
            height: 55,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(63, 39, 27, 1),
                  Color.fromRGBO(112, 75, 57, 1)
                ])),
          ),

          onPressed: () {
            Provider.of<HomeProvider>(context,listen: false).chooseFile();
            //navigationService.navigateTo(UploadScreenRoute);
          },
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.h),
          child: AppBar(
            automaticallyImplyLeading: false,
                elevation: 0,
                bottomOpacity: 0,
            backgroundColor: Colors.white,
            title:  Text(
              "Video Browsing",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  ),
              textAlign: TextAlign.center,
            ),

          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                ),
              ],
            );
          },
          activeIndex: bottomNavIndex,
          borderColor: Colors.grey[300],
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.values[0],
          onTap: (index) {
            setState(() => bottomNavIndex = index);
          },
          itemCount: iconList.length,
        ),
        body: IndexedStack(
          index: bottomNavIndex,
          children: <Widget>[
            UploadedVideos(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }


}

















