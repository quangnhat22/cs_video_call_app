import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:videocall/data/models/user_model.dart';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  SearchModel._();

  factory SearchModel({List<UserModel>? friends}) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
