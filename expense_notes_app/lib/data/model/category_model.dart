class CategoryModel {
  final String uuid;
  final String name;

  CategoryModel({
    required this.uuid,
    required this.name,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      uuid: map['uuid'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
    };
  }
}
