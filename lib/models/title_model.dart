class TitleModel{

  late final int id;
  String name;

  TitleModel(this.id, this.name);

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'TitleModel{id: $id, name: $name}';
  }

  factory TitleModel.fromMap(Map<String, dynamic> json) => TitleModel(
    json["id"],
    json["name"],
  );
}