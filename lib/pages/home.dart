import 'package:countryapp/controller/controller.dart';
import 'package:countryapp/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<Controller>(context, listen: false).getcountries();
      Provider.of<Controller>(context, listen: false).setSearch(false);
    });
  }

  TextEditingController searchCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.black38,
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
            Provider.of<Controller>(context, listen: false).getcountries();
          },
          child: SafeArea(
            child: Consumer<Controller>(builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: value.widgetList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          value.widgetList[index]['continent'],
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                     const   EdgeInsets.only(bottom: 10, left: 10),
                                    width: size.width * 0.76,
                                    height: size.height * 0.045,
                                    child: TextField(
                                      style:const TextStyle(color: Colors.white),
                                      controller: searchCont,
                                      onChanged: (val) {
                                        searchCont.text = val;
                                        value.searchCountries(
                                            value.widgetList[index], val);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Search Country",
                                          suffixIcon: GestureDetector(
                                            child: GestureDetector(
                                              onTap: () {
                                                value.setSearch(false);
                                                searchCont.clear();
                                              },
                                              child:const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                          hintStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                    ),
                                  ),

                                  //////////////////////////////////////////////////////
                                  Container(
                                      alignment: Alignment.center,
                                      child: popupmenuButton(
                                          context, value.widgetList[index]))
                                ],
                              ),
                              Column(
                                children: value.isSearch
                                    ? buildExpandableContent(
                                        value.countryMap, size, searchCont.text)
                                    : buildExpandableContent(
                                        value.widgetList[index],
                                        size,
                                        searchCont.text),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              }
            }),
          ),
        ));
  }
}
