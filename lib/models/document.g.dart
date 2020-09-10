// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    slug: json['slug'] as String,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    link: json['link'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'slug': instance.slug,
      'created': instance.created?.toIso8601String(),
      'link': instance.link,
      'type': instance.type,
    };
