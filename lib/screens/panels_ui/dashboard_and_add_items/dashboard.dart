import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/Services/data_tables_models/general_model.dart';
import 'package:untitled/utils/utils.dart';
import '../../../Services/data_tables_models/dashboard_person_table_model.dart';
import '../../../widgets/mytextformfield_widget.dart';
import '../../../widgets/pop_up_dialoges.dart';
import '../widgets_panels/data_table_generic.dart';
import '../widgets_panels/header.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

  void detailsPage(GeneralModel item) {
    PersonData myItem = item as PersonData;
    Utils().toastMessage(myItem.name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      firstFetch(context);
    });
  }

  Row dashboardAndSearchRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
          "Dashboard",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: SizedBox(
              height: 40,
              child: MyTextFormField(
                hintText: "Search Name here_____",
                suffixIcon: Icons.search,
              ),
            ))
      ],
    );
  }
  Row buttonsRow(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () {
              context.pushNamed("dashboardAddItem");
            },
            child: const Text("Add New")),

        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              context.push("/name");
            },
            child: const Text("Remove Item")),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(row1: dashboardAndSearchRow() , row2: buttonsRow(context) ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
              Text(
                "Total Passengers: ${data == null ? "" : data!.totalPassengers.toString()}",
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "Total Pages: ${data == null ? "" : data!.totalPages.toString()} ",
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5.0,
                          blurRadius: 7.0,
                          offset: Offset(3, 3))
                    ],
                  ),
                  child: dataList != null ? DataTableWidget(
                    items: dataList!,
                    columnNames: const [
                      "Job Title",
                      "Score",
                      "Score Analysis",
                      "Hourly Rate",
                      "Budget",
                      "Time ago",
                      "Country",
                      "Description"
                    ], maxWords: 10,
                  ) : const SizedBox()
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pageCount -= 1;
                      firstFetch(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("Page. $pageCount "),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pageCount += 1;
                      if (pageCount != data!.totalPages) {
                        firstFetch(context);
                      } else {
                        Utils().toastMessage(
                            "You are on the last page already!!!");
                      }
                    },
                    child: const Icon(Icons.arrow_forward),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}