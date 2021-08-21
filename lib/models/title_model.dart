class TitleModel{

  late final int id;
  final String name;

  TitleModel({required this.id, required this.name});

  factory TitleModel.forInsert({required name})
    => TitleModel(id: 0, name: name);



  ///Map
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
    };
  }

  factory TitleModel.fromMap(Map<String, dynamic> json) => TitleModel(
    id: json["id"],
    name: json["name"],
  );




  @override
  String toString() {
    return 'TitleModel{id: $id, name: $name}';
  }
}