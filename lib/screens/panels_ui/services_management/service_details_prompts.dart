import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/widgets/mytextformfield_widget.dart';
import 'package:untitled/Services/data_tables_models/dashboard_person_table_model.dart';
import 'package:untitled/Services/data_tables_models/general_model.dart';
import 'package:untitled/utils/utils.dart';
import 'package:untitled/widgets/pop_up_dialoges.dart';
import 'package:untitled/screens/panels_ui/widgets_panels/data_table_generic.dart';
import 'package:untitled/screens/panels_ui/widgets_panels/header.dart';

class ServicesDetailsPageScreen extends StatefulWidget {
  const ServicesDetailsPageScreen({Key? key}) : super(key: key);

  @override
  State<ServicesDetailsPageScreen> createState() => _ServicesDetailsPageScreenState();
}

class _ServicesDetailsPageScreenState extends State<ServicesDetailsPageScreen> {

  // List<String> ? dataList;
  // List<String> dataFromServer = <String>[
  //   "The rain was pouring down in sheets, making it nearly impossible to see anything more than a few feet in front of you",
  //   "The smell of freshly-baked bread wafted through the air, filling the small kitchen with warmth and comfort",
  //   "As she walked through the dark alley, she couldn't shake the feeling that she was being followed by someone or something",
  //   "The sun was setting behind the mountains, casting a warm orange glow across the fields and painting the sky with shades of pink and purple",
  //   "The sound of laughter echoed through the empty hallways, a reminder of happier times that now seemed so far away",
  //   "She stood at the edge of the cliff, staring out at the endless expanse of blue that stretched out before her, feeling both exhilarated and terrified at the same time",
  //   "The smell of smoke filled the air, and she knew that something was on fire somewhere nearby, but she couldn't see where it was coming from",
  //   "The wind was howling outside, rattling the windows and shaking the walls of the old house, making her feel as though she was in the middle of a hurricane",
  // ];
  final client = DashboardApiService(Dio());
  final int itemsSize = 10;
  Data? data;
  List<PersonData>? dataList;
  bool isLoading = true;
  int pageCount = 1;
  bool isShowTextFormField = false;

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

  Row buttonsRow(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () {
              context.pushNamed("AddPromptsScreen");
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
  Row dashboardAndSearchRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              "Mobile App Development",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            child: SizedBox(
              height: 40,
              child: MyTextFormField(
                hintText: "Search Prompts here",
                suffixIcon: Icons.search,
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Services Detail Page"),),
      // backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(row1: dashboardAndSearchRow() , row2: buttonsRow(context),),
            const SizedBox(
              height: 20,
            ),
            Row(children: [
              Text(
                "Total Prompts: ${data == null ? "" : data!.totalPassengers.toString()}",
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  "Total Pages: ${data == null ? "" : data!.totalPages.toString()}",
                ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  // margin: const EdgeInsets.all(8),
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
                  child: dataList!= null ? DataTableWidget(
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
                    ], maxWords: 2,
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
