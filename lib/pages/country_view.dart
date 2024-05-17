import 'package:countryapp/model/country_model.dart';
import 'package:countryapp/pages/country_details.dart';
import 'package:flutter/material.dart';

class CountryView extends StatefulWidget {
  CountryModel country;
  CountryView(this.country, {super.key});
  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetails(widget.country),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
        margin:const EdgeInsets.only(left: 20, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.country.name!.common.toString(),
                  // "dbjsbjbsdsbdbsd sdbjsbd sdns jhfbsjhf snmf sfbh",
                  style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                widget.country.capital!.isEmpty
                    ? Container()
                    : Row(
                        children: [
                          const Text("Capital : ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                          Text(widget.country.capital![0].toString(),
                              style:const TextStyle(
                                color: Colors.blue,
                              )),
                        ],
                      ),
                Row(
                  children: [
                    const Text(
                      "Population:",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(widget.country.population.toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                        )),
                  ],
                )
              ],
            ),
            Flexible(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                    width: size.height * 0.07,
                    child: Image.network(
                      widget.country.flags!.png.toString(),
                      fit: BoxFit.cover,
                    ),
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
