import 'package:countryapp/model/country_model.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  CountryModel country;
  CountryDetails(this.country, {super.key});

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black45,
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          // margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.06,
                ),
                Text(
                  widget.country.name!.common.toString(),
                  style:const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
               const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width * .5,
                  height: 0.5,
                  color: Colors.white,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                SizedBox(
                  height: size.height * 0.10,
                  width: size.height * 0.23,
                  child: Image.network(
                    widget.country.flags!.png.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin:const EdgeInsets.only(left: 10),
                        // width: size.width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.country.name!.official == null
                                ? Container(
                                    height: 0,
                                  )
                                : Text(
                                    "Official Name",
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                          const  SizedBox(
                              height: 5,
                            ),
                            widget.country.name!.nativeName!.ron == null
                                ? Container(
                                    height: 0,
                                  )
                                : Text(
                                    "Native Name",
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                         const   SizedBox(
                              height: 5,
                            ),
                            widget.country.area == null
                                ? Container(
                                    height: 0,
                                  )
                                : Text(
                                    "Area",
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                           const SizedBox(
                              height: 5,
                            ),
                            widget.country.borders == null
                                ? Container(
                                    height: 0,
                                  )
                                : Text(
                                    "Borders",
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                          const  SizedBox(
                              height: 5,
                            ),
                            widget.country.languages!.ron == null
                              ? Container(
                                  height: 0,
                                )
                              : Text(
                                    "Languages",
                                    style: TextStyle(color: Colors.grey[100]),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.country.name!.official == null
                              ? Container(
                                  height: 0,
                                )
                              : Text(
                                  widget.country.name!.official.toString(),
                                  // "sjsd sn snf dn fns fsz fsd ffshhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhj",
                                  style:const TextStyle(color: Colors.blue),
                                ),
                        const  SizedBox(
                            height: 5,
                          ),
                          widget.country.name!.nativeName!.ron == null
                              ? Container(
                                  height: 0,
                                )
                              : Text(
                                  widget
                                      .country.name!.nativeName!.ron!.official!
                                      .toString(),
                                  style:const TextStyle(color: Colors.blue),
                                ),
                         const SizedBox(
                            height: 5,
                          ),
                          widget.country.area == null
                              ? Container(
                                  height: 0,
                                )
                              : Text(
                                  widget.country.area!.toString(),
                                  style:const TextStyle(color: Colors.blue),
                                ),
                        const  SizedBox(
                            height: 5,
                          ),
                          widget.country.borders == null
                              ? Container(
                                  height: 0,
                                )
                              : Text(
                                  widget.country.borders.toString(),
                                  style:const TextStyle(color: Colors.blue),
                                ),
                        const  SizedBox(
                            height: 5,
                          ),
                          widget.country.languages!.ron == null
                              ? Container(
                                  height: 0,
                                )
                              : Text(
                                  widget.country.languages!.ron!.toString(),
                                  style:const TextStyle(color: Colors.blue),
                                ),
                        const  SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
