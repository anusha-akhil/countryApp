// import 'package:countryapp/controller/controller.dart';
// import 'package:countryapp/model/country_model.dart';
// import 'package:countryapp/pages/country_view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       Provider.of<Controller>(context, listen: false).getcountries();
//       Provider.of<Controller>(context, listen: false).setSearch(false);
//     });
//   }

//   TextEditingController searchCont = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//         backgroundColor: Colors.black38,
//         body: SafeArea(
//           child: Consumer<Controller>(builder: (context, value, child) {
//             if (value.isLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return ListView.builder(
//                   itemCount: value.widgetList.length,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return ExpansionTile(
//                       title: Text(
//                         value.widgetList[index]['continent'],
//                         style: TextStyle(
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.italic,
//                             color: Colors.white),
//                       ),
//                       children: <Widget>[
//                         Column(
//                           children: [
//                             Container(
//                                 width: size.width * 0.9,
//                                 height: size.height * 0.04,
//                                 child: TextField(
//                                   style: TextStyle(color: Colors.white),
//                                   controller: searchCont,
//                                   onChanged: (val) {
//                                     searchCont.text = val;
//                                     value.search(value.widgetList[index], val);
//                                   },
//                                   decoration: InputDecoration(
//                                       hintText: "Search Country",
//                                       suffixIcon: GestureDetector(
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             value.setSearch(false);
//                                             searchCont.clear();
//                                           },
//                                           child: Icon(
//                                             Icons.close,
//                                             color: Colors.white,
//                                             size: 14,
//                                           ),
//                                         ),
//                                       ),
//                                       hintStyle: TextStyle(
//                                           color: Colors.white, fontSize: 10),
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10))),
//                                 )),
//                             Column(
//                               children: value.isSearch
//                                   ? _buildExpandableContent(
//                                       value.countryMap, size, searchCont.text)
//                                   : _buildExpandableContent(
//                                       value.widgetList[index],
//                                       size,
//                                       searchCont.text),
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   });
//             }
//           }),
//         ));
//   }

//   _buildExpandableContent(
//       Map<String, dynamic> country, Size size, String text) {
//     List<Widget> columnContent = [];
//     TextEditingController searchCont = TextEditingController();
//     List<CountryModel> searchdata = [];
//     // columnContent.add(x;

//     for (CountryModel country in country["countries"]) {
//       columnContent.add(CountryView(country));
//     }
//     return columnContent;
//   }
// }
