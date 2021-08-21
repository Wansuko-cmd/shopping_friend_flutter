import 'package:flutter/material.dart';

class ContentModel{
  late final int id;
  int titleId;
  bool isChecked;
  String item;
  int number;

  ContentModel(
      this.id,
      this.titleId,
      this.isChecked,
      this.item,
      this.number,
      );

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'titleId': titleId,
      'isChecked': isChecked,
      'item': item,
      'number': number,
    };
  }

  @override
  String toString() {
    return 'TitleModel{id: $id, titleId: $titleId, isChecked: $isChecked, item: $item, number: $number}';
  }

  factory ContentModel.fromMap(Map<String, dynamic> json) => ContentModel(
    json['id'],
    json['title_id'],
    json['is_checked'] == 1,
    json['item'],
    json['number']
  );
}