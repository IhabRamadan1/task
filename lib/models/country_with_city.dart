class CountryWithCityModel {
  bool? status;
  String? message;
  List<CountriesModel>? countries;

  CountryWithCityModel({this.status, this.message, this.countries});

  CountryWithCityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['countries'] != null) {
      countries = <CountriesModel>[];

      json['countries'].forEach((v) {
        countries!.add(new CountriesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountriesModel {
  int? id;
  String? logo;
  String? code;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<CitiesModel>? cities;
  List<TranslationsModel>? translations;

  CountriesModel(
      {this.id,
        this.logo,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.cities,
        this.translations});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    if (json['cities'] != null) {
      cities = <CitiesModel>[];
      json['cities'].forEach((v) {
        cities!.add(new CitiesModel.fromJson(v));
      });
    }
    if (json['translations'] != null) {
      translations = <TranslationsModel>[];
      json['translations'].forEach((v) {
        translations!.add(new TranslationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CitiesModel {
  int? id;
  String? countryId;
  String? createdAt;
  String? updatedAt;
  String? name;
  List<TranslationsModel>? translations;

  CitiesModel(
      {this.id,
        this.countryId,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.translations});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    if (json['translations'] != null) {
      translations = <TranslationsModel>[];
      json['translations'].forEach((v) {
        translations!.add(new TranslationsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.translations != null) {
      data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TranslationsModel {
  int? id;
  String? cityId;
  String? locale;
  String? name;
  String? createdAt;
  String? updatedAt;

  TranslationsModel(
      {this.id,
        this.cityId,
        this.locale,
        this.name,
        this.createdAt,
        this.updatedAt});

  TranslationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    locale = json['locale'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['locale'] = this.locale;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}