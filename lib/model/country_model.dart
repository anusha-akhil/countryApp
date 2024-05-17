
class CountryModel {
  Name? name;
  List<String>? capital;
  String? region;
  String? subregion;
  int? population;
  List<String>? continents;
  Flags? flags;
  Languages? languages;
  List<String>? timezones;
  PostalCode? postalCode;
  double? area;
  List<String>? borders;
  CountryModel(
      this.name,
      this.capital,
      this.region,
      this.subregion,
      this.population,
      this.continents,
      this.flags,
      this.languages,
      this.timezones,
      this.postalCode,
      this.borders,
      this.area);

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    capital = json["capital"] == null
        ? []
        : List<String>.from(json["capital"].map((x) => x));
    // capital = json['capital'].cast<String>();
    region = json['region'];
    subregion = json['subregion'];
    population = json['population'];
    continents = json['continents'].cast<String>();
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    languages = json['languages'] != null
        ? Languages.fromJson(json['languages'])
        : null;

    timezones = json['timezones'].cast<String>();
    postalCode = json['postalCode'] != null
        ? PostalCode.fromJson(json['postalCode'])
        : null;

    // borders = json['borders'].cast<String>();

    borders = json["borders"] == null
        ? []
        : List<String>.from(json["borders"].map((x) => x));
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }

    data['capital'] = capital;
    data['region'] = region;
    data['subregion'] = subregion;

    data['population'] = population;

    data['continents'] = continents;
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (languages != null) {
      data['languages'] = languages!.toJson();
    }
    data['timezones'] = timezones;
    if (postalCode != null) {
      data['postalCode'] =postalCode!.toJson();
    }
    data['borders'] = borders;
    data['area'] = area;
    return data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null
        ? NativeName.fromJson(json['nativeName'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Ron? ron;

  NativeName({this.ron});

  NativeName.fromJson(Map<String, dynamic> json) {
    ron = json['ron'] != null ? Ron.fromJson(json['ron']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ron != null) {
      data['ron'] = ron!.toJson();
    }
    return data;
  }
}

class Ron {
  String? official;
  String? common;

  Ron({this.official, this.common});

  Ron.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['png'] = png;
    data['svg'] = svg;
    data['alt'] = alt;
    return data;
  }
}

class Languages {
  String? ron;

  Languages({this.ron});

  Languages.fromJson(Map<String, dynamic> json) {
    ron = json['ron'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ron'] = ron;
    return data;
  }
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    regex = json['regex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['format'] = format;
    data['regex'] = regex;
    return data;
  }
}
