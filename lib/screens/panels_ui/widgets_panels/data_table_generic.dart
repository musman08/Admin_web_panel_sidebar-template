import 'package:flutter/material.dart';
import '../../../Services/data_tables_models/dashboard_person_table_model.dart';
import '../../../Services/data_tables_models/general_model.dart';

class DataTableWidget<T extends GeneralModel> extends StatefulWidget {
  const DataTableWidget({
    Key? key,
    required this.items,
    required this.columnNames,
    required this.maxWords,
    // this.passItemCallBack,
  }) : super(key: key);

  final List<T> items;
  final List<String> columnNames;
  final int maxWords;
  // final void Function(T,DataTableEnum item )? passItemCallBack ;


  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState<T extends GeneralModel>
    extends State<DataTableWidget> {
  late int maxWords;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxWords = widget.maxWords;
  }

  // List<PersonData> dataList = widget.items as List<PersonData>;

  String maxWordsFunction(String text){
    List<String> words = text.split(' ').take(maxWords).toList();
    return words.join(' ');
  }
  T ? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: false,
            columns: [
              for (final c in widget.columnNames) ...[
                DataColumn(
                    label: Text(c, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
              ],
            ],
            rows: [
          for(final item in widget.items) ...[
           DataRow(
          onSelectChanged: (isSelected) {
            if(isSelected!){
              print(item.getAllValues());
            }else{
              _selectedItem = null;
            }
          },
                cells: [
              // for(final row in item.getAllValues()) ...[
              //   DataCell(Text(maxWordsFunction(row))),
              // ],
                 const  DataCell(Text("Flutter Developer")),
              const DataCell(Text("4")),
              const DataCell(Text("Score is normal")),
              const DataCell(Text("25\$/hr")),
              const DataCell(Text("900\$")),
              const DataCell(Text("5 Minutes ago")),
              const DataCell(Text("Pakistan")),
              DataCell(Text(maxWordsFunction("I need a person who is willing to start work asap and done my work very quickly and efficiently")
               , style: const TextStyle(overflow: TextOverflow.ellipsis,),
                maxLines: 1,
                softWrap: false,)),
            ],
            ),
          ]
        ]
        ),
      ),
    );
  }
}



