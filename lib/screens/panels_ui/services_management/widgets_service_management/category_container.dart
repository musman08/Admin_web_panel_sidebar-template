import 'package:flutter/material.dart';
import 'package:untitled/Services/data_tables_models/dashboard_person_table_model.dart';
import 'category_button.dart';


class CategoryContainer extends StatefulWidget {
  const CategoryContainer({Key? key, required this.serviceName, required this.airLineList}) : super(key: key);

  final String serviceName;
  final List<AirlineData> airLineList;

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  late String _serviceName;
  late List<AirlineData> _airlineData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _serviceName = widget.serviceName;
    _airlineData = widget.airLineList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Service: $_serviceName", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10.0,
            runSpacing: 20.0,
            children: [
              for (final airlineData in _airlineData)
                CategoryButton(
                  title: airlineData.name,
                  activeStatus: "Active",
                  subTitle: airlineData.country,
                ),
            ],
          )
        ],
      ),
    );
  }
}

