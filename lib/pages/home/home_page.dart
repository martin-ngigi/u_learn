import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learn/common/entities/entities.dart';
import 'package:u_learn/common/routes/names.dart';
import 'package:u_learn/common/values/colors.dart';
import 'package:u_learn/pages/home/bloc/home_page_blocs.dart';
import 'package:u_learn/pages/home/bloc/home_page_states.dart';
import 'package:u_learn/pages/home/home_controller.dart';
import 'package:u_learn/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late UserItem? userProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// initialize home controller.
    // _homeController = HomeController(context: context);
    // _homeController.init();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;

  }

  @override
  Widget build(BuildContext context) {
    return userProfile != null ? Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile!.avatar.toString()),
      body:
      BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
        // print("LENGH: ${state.courseItem.length}");
       if(state.courseItem.isEmpty){
          HomeController(context: context).init();
       }

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: CustomScrollView(
            slivers: [
              ///SliverToBoxAdapter will convert a normal widget to sliver. Slivers are good in performance

              /// Hello
              SliverToBoxAdapter(
                child: homePageText("Hello",
                    color: AppColors.primaryThirdElementText, top: 10),
              ),

              /// User name
              SliverToBoxAdapter(
                  child: homePageText("${userProfile!.name!}",
                      color: AppColors.primaryText, top: 2)),

              SliverPadding(
                padding: EdgeInsets.only(top: 20.h),
              ),

              /// search bar
              SliverToBoxAdapter(child: searchView()),

              /// slider
              SliverToBoxAdapter(child: sliderView(context, state)),

              /// menu view
              SliverToBoxAdapter(child: menuView()),

              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, /// number of items to show per row
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6 /// this will make the items appear as rectangles
                  ),
                  delegate: SliverChildBuilderDelegate(
                      childCount: state.courseItem.length, /// Total number of items.
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            /// Navigating to course detail page, Pass course ID as an argument
                            Navigator.of(context).pushNamed(
                                AppRoutes.COURSE_DETAIL_PAGE,
                              arguments: {
                                  "id":state.courseItem.elementAt(index).id
                              }
                            );
                          },
                          child: courseGrid(state.courseItem[index]),
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      }),
    ) : Container();
  }
}
