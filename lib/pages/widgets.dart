import 'package:countryapp/controller/controller.dart';
import 'package:countryapp/model/country_model.dart';
import 'package:countryapp/pages/country_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

Widget popupmenuButton(BuildContext context, Map<String, dynamic> country) {
  return PopupMenuButton<int>(
    offset:const Offset(0, 50),

    icon: const Icon(
      Icons.sort,
      color: Colors.white,
    ),
    itemBuilder: (context) => [
      // PopupMenuItem 1
     const PopupMenuItem(
        value: 1,
        // row with 2 children
        child: Text("Sort By Name"),
      ),
      // PopupMenuItem 2
    const  PopupMenuItem(
        value: 2,
        // row with two children
        child: Text("Sort By Population"),
      ),
    ],
    // offset: Offset(0, 100),
    color: Colors.grey,
    elevation: 1,
    // on selected we show the dialog box
    onSelected: (val) {
      // if value 1 show dialog
      if (val == 1) {
        Provider.of<Controller>(context, listen: false)
            .sortCountries(country, 1);
      } else if (val == 2) {
        Provider.of<Controller>(context, listen: false)
            .sortCountries(country, 2);
      }
    },
  );
}
///////////////////////////////////////////////////////////

toastWidget(String content){
  return Fluttertoast.showToast(
          msg: content,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
}
/////////////////////////////////////////////////////////////
buildExpandableContent(
      Map<String, dynamic> country, Size size, String text) {
    List<Widget> columnContent = [];

    for (CountryModel country in country["countries"]) {
      columnContent.add(CountryView(country));
    }
    return columnContent;
  }