import 'package:melonab/data/models/sections/section_type.dart';

class HomeSectionModel {
  final String id;
  final SectionType type;
  final String? title;
  final bool? showLink;
  final List<dynamic> items;

  HomeSectionModel({
    required this.id,
    required this.type,
    this.title,
    this.showLink,
    required this.items,
  });

  factory HomeSectionModel.fromJson(Map<String, dynamic> json) {
    return HomeSectionModel(
      id: json['id'] ?? '',
      type: parseSectionType(json['type']),
      title: json['title'],
      showLink: json['show_link'],
      items: json['items'] ?? [],
    );
  }
}