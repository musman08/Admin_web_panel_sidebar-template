import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../Services/data_tables_models/dashboard_person_table_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/pop_up_dialoges.dart';
import 'widgets_service_management/category_container.dart';


class ServicesPanelScreen extends StatefulWidget {
  const ServicesPanelScreen({Key? key}) : super(key: key);
  @override
  State<ServicesPanelScreen> createState() => _ServicesPanelScreenState();
}
class _ServicesPanelScreenState extends State<ServicesPanelScreen> {


  // final clientDio = DashboardApiService(client);
  final client = DashboardApiService(Dio());
  final int itemsSize = 10;
  Data? data;
  List<PersonData>? dataList;
  bool isLoading = true;
  int pageCount = 1;

  Future firstFetch(BuildContext context) async {
    if (pageCount < 1) {
      Utils().toastMessage("You are on First Page");
    } else {
      const LoadingDialog('Data Loading').show(context);
      try {
        data = await client.getData(pageCount, itemsSize);
        if (!mounted) return;
        Navigator.of(context).pop();
        dataList = data!.data;
        setState(() {});
      } catch (e) {
        Navigator.of(context).pop();
        errorDialog(context, e.toString());
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      firstFetch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("Find a Category that suits you best!", style: TextStyle(fontSize: 20, color: Colors.blue[400]!),),
              const SizedBox(height: 25,),
              dataList == null ? const SizedBox() :
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: CategoryContainer(serviceName: dataList![index].name, airLineList: dataList![index].airline,),
                  );
                },
              )
            ],
          ),
        ),
      )
      // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children:  [
        //         Text("Find a Category that suits you best!", style: TextStyle(fontSize: 20, color: Colors.blue[400]!),),
        //         const SizedBox(height: 25,),
        //         dataList == null ? const SizedBox() :
        //         ListView.builder(
        //           physics: const NeverScrollableScrollPhysics(),
        //           itemCount: dataList!.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: const EdgeInsets.only(bottom: 20),
        //               child: CategoryContainer(serviceName: dataList![index].name, airLineList: dataList![index].airline,),
        //             );
        //
        //           },)
        //       ],
        //     ),
        //   ),
        // ),

    //   CustomScrollView(
    //     slivers: [
    //       SliverPadding(
    //         padding: const EdgeInsets.symmetric( horizontal: 20 ,vertical: 40),
    //       sliver: Text("Find a Category that suits you best!", style: TextStyle(fontSize: 20, color: Colors.blue[400]!),),
    //
    // ),
    //       SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 20),
    //         sliver: SliverList(
    //           delegate: SliverChildBuilderDelegate(
    //             childCount: dataList!.length ,
    //                 (BuildContext context, int index) {
    //               return CategoryContainer(serviceName: dataList![index].name, airLineList: dataList![index].airline,);
    //             },
    //           ),
    //         ),
    //       )
    //     ],
    //   )
    );
  }
}
