import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:countryapp/model/country_model.dart';
import 'package:countryapp/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';

class Controller extends ChangeNotifier {
  List<Widget> columnContent = [];
  Map<String, dynamic> countryMap = {};
  String continent = "";
  bool isLoading = false;
  bool isSearch = false;

  // ignore: non_constant_identifier_names
  List<CountryModel> country_list = [];
  List<Map<String, dynamic>> widgetList = [];
  getcountries() async {
    try {
      isLoading = true;
      notifyListeners();
      http.Response response =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
      ////////////////////////////////////////////////////////////////////
      if (response.statusCode == 200) {
        var map = jsonDecode(response.body);
        isLoading = false;
        notifyListeners();
        country_list.clear();
        for (var item in map) {
          country_list.add(CountryModel.fromJson(item));
        }

        //////////////////////////////////////////////////////////////////
        widgetList.clear();

        var groupByDate = groupBy(country_list, (obj) => obj.continents![0]);
        groupByDate.forEach((continent, countries) {
          Map<String, dynamic> map = {
            "continent": continent,
            "countries": countries
          };
          widgetList.add(map);
        });
      } else {
        toastWidget("Invalid Api response!!!");
      }
    } on SocketException catch (e) {
      isLoading = false;
      notifyListeners();
      toastWidget("No Internet Connection !!!");

      print('Socket Error: $e');
    } on TimeoutException {
      isLoading = false;
      notifyListeners();
      toastWidget("Time Out!!!");
    } catch (e) {
      // toastWidget(e)
      throw Exception(e);
    }
  }

  ///////////////////////////////////////////////////////////

  searchCountries(Map<String, dynamic> country, String text) {
    setSearch(true);
    List<CountryModel> list = [];
    if (text == "") {
      countryMap = {
        "continent": country["continent"],
        "countries": country["countries"]
      };
    } else {
      for (CountryModel country in country["countries"]) {
        if (country.name!.common!
            .toLowerCase()
            .startsWith(text.toLowerCase())) {
          list.add(country);
        }
      }
    }

    countryMap = {"continent": country["continent"], "countries": list};

    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////////
  setSearch(bool val) {
    isSearch = val;
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  sortCountries(Map<String, dynamic> country, int val) {
    if (val == 1) {
      countryMap = {
        "continent": country["continent"],
        "countries": country["countries"].sort(
            (CountryModel a, CountryModel b) => a.name!.common!
                .toLowerCase()
                .compareTo(b.name!.common!.toLowerCase()))
      };
    } else {
      countryMap = {
        "continent": country["continent"],
        "countries": country["countries"].sort(
            (CountryModel a, CountryModel b) =>
                a.population!.compareTo(b.population!))
      };
    }
    notifyListeners();
  }
}
