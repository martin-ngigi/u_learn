import 'package:flutter/material.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {

  late var id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// same as on ready method in getx
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    print("-------> CourseDetail ${id.values}");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("${id.values}"),
      ),
    );
  }
}
