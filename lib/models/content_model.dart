class ContentModel{

  late final int id;
  final int titleId;
  bool isChecked;
  String item;
  int number;

  ContentModel({
    required this.id,
    required this.titleId,
    required this.isChecked,
    required this.item,
    required this.number,
  });

  factory ContentModel.forInsert({required titleId, required number})
   => ContentModel(
       id: 0,
       titleId: titleId,
       isChecked: false,
       item: "",
       number: number
   );

  ///Map
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'titleId': titleId,
      'isChecked': isChecked,
      'item': item,
      'number': number,
    };
  }

  factory ContentModel.fromMap(Map<String, dynamic> json) => ContentModel(
      id: json['id'],
      titleId: json['title_id'],
      isChecked: json['is_checked'] == 1,
      item: json['item'],
      number: json['number']
  );




  @override
  String toString() {
    return 'TitleModel{id: $id, titleId: $titleId, isChecked: $isChecked, item: $item, number: $number}';
  }


}