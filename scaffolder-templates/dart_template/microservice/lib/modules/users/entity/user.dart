import 'package:fluent_query_builder/fluent_query_builder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements FluentModelBase {
  int? id;

  String name;

  User(this.name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  Map<String, dynamic> toMap() => toJson();

  @override
  OrmDefinitions get ormDefinitions => OrmDefinitions(
    tableName: 'users',
    primaryKey: 'id',
  );
}
