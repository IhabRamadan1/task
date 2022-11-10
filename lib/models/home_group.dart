class HomeGroupModel {
  bool? status;
  GroupsModel? groups;

  HomeGroupModel({this.status, this.groups});

  HomeGroupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    groups =
    json['groups'] != null ? new GroupsModel.fromJson(json['groups']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.groups != null) {
      data['groups'] = this.groups!.toJson();
    }
    return data;
  }
}

class GroupsModel {
  List<DataHomeModel>? data;
  LinksHomeModel? links;
  MetaHomeModel? meta;

  GroupsModel({this.data, this.links, this.meta});

  GroupsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataHomeModel>[];
      json['data'].forEach((v) {
        data!.add(new DataHomeModel.fromJson(v));
      });
    }
    links = json['links'] != null ? new LinksHomeModel.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new MetaHomeModel.fromJson(json['meta']) : null;
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

class DataHomeModel {
  int? id;
  String? title;
  String? description;
  String? image;
  int? employees;
  int? employers;
  int? jobs;

  DataHomeModel(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.employees,
        this.employers,
        this.jobs});

  DataHomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    employees = json['employees'];
    employers = json['employers'];
    jobs = json['jobs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['employees'] = this.employees;
    data['employers'] = this.employers;
    data['jobs'] = this.jobs;
    return data;
  }
}

class LinksHomeModel {
  String? first;
  String? last;
  Null? prev;
  Null? next;

  LinksHomeModel({this.first, this.last, this.prev, this.next});

  LinksHomeModel.fromJson(Map<String, dynamic> json) {
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

class MetaHomeModel {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  MetaHomeModel(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total});

  MetaHomeModel.fromJson(Map<String, dynamic> json) {
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