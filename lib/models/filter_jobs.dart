class FilterJobsModel {
  bool? status;
  String? message;
  JobsModel? jobs;

  FilterJobsModel({this.status, this.message, this.jobs});

  FilterJobsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    jobs = json['jobs'] != null ? new JobsModel.fromJson(json['jobs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.toJson();
    }
    return data;
  }
}

class JobsModel {
  List<DataModel>? data;
  LinksModel? links;
  MetaModel? meta;

  JobsModel({this.data, this.links, this.meta});

  JobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(new DataModel.fromJson(v));
      });
    }
    links = json['links'] != null ? new LinksModel.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new MetaModel.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class DataModel {
  int? id;
  String? jobTitle;
  String? jobFiled;
  String? jobSpecialist;
  String? details;
  String? salary;
  String? gender;
  String? experience;
  String? company;
  String? type;
  String? country;
  String? city;
  String? companyLogo;
  String? educationBachelor;
  String? educationExcellent;
  String? educationMa;
  Null? educationFellowship;
  Null? educationPhd;
  String? createdAt;
  int? establishmentDate;
  String? countryCode;
  String? reactsCount;

  DataModel(
      {this.id,
        this.jobTitle,
        this.jobFiled,
        this.jobSpecialist,
        this.details,
        this.salary,
        this.gender,
        this.experience,
        this.company,
        this.type,
        this.country,
        this.city,
        this.companyLogo,
        this.educationBachelor,
        this.educationExcellent,
        this.educationMa,
        this.educationFellowship,
        this.educationPhd,
        this.createdAt,
        this.establishmentDate,
        this.countryCode,
        this.reactsCount});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobTitle = json['job_title'];
    jobFiled = json['job_filed'];
    jobSpecialist = json['job_specialist'];
    details = json['details'];
    salary = json['salary'];
    gender = json['gender'];
    experience = json['experience'];
    company = json['company'];
    type = json['type'];
    country = json['country'];
    city = json['city'];
    companyLogo = json['company_logo'];
    educationBachelor = json['education_bachelor'];
    educationExcellent = json['education_excellent'];
    educationMa = json['education_ma'];
    educationFellowship = json['education_fellowship'];
    educationPhd = json['education_phd'];
    createdAt = json['created_at'];
    establishmentDate = json['establishment_date'];
    countryCode = json['country_code'];
    reactsCount = json['reacts_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_title'] = this.jobTitle;
    data['job_filed'] = this.jobFiled;
    data['job_specialist'] = this.jobSpecialist;
    data['details'] = this.details;
    data['salary'] = this.salary;
    data['gender'] = this.gender;
    data['experience'] = this.experience;
    data['company'] = this.company;
    data['type'] = this.type;
    data['country'] = this.country;
    data['city'] = this.city;
    data['company_logo'] = this.companyLogo;
    data['education_bachelor'] = this.educationBachelor;
    data['education_excellent'] = this.educationExcellent;
    data['education_ma'] = this.educationMa;
    data['education_fellowship'] = this.educationFellowship;
    data['education_phd'] = this.educationPhd;
    data['created_at'] = this.createdAt;
    data['establishment_date'] = this.establishmentDate;
    data['country_code'] = this.countryCode;
    data['reacts_count'] = this.reactsCount;
    return data;
  }
}

class LinksModel {
  String? first;
  String? last;
  Null? prev;
  String? next;

  LinksModel({this.first, this.last, this.prev, this.next});

  LinksModel.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class MetaModel {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  MetaModel(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  MetaModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}