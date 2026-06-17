class CategoryModel {
  final String uuid;
  final String name;

  CategoryModel({required this.uuid, required this.name});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(uuid: map['uuid'], name: map['name']);
  }

  Map<String, dynamic> toJson() {
    return {'uuid': uuid, 'name': name};
  }
}

const List<Map<String, String>> kDummyCategories = [
  {'uuid': 'cat-001', 'name': 'Hotel'},
  {'uuid': 'cat-002', 'name': 'Transport'},
  {'uuid': 'cat-003', 'name': 'Food'},
  {'uuid': 'cat-004', 'name': 'Entertainment'},
  {'uuid': 'cat-005', 'name': 'Other'},
];
