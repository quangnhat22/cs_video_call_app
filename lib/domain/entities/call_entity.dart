import 'package:videocall/data/models/call_model.dart';
import 'package:videocall/data/models/user_model.dart';

class CallEntity {
  String id;
  UserModel? callee;
  UserModel? caller;
  DateTime? calledAt;
  String? status;

  CallEntity(
      {required this.id, this.callee, this.caller, this.calledAt, this.status});

  static final callEntityEmpty = CallEntity(id: "-1");

  static CallEntity convertToCallEntity({CallModel? model}) {
    if (model == null) return callEntityEmpty;
    return CallEntity(
      id: model.id,
      callee: model.callee,
      caller: model.caller,
      calledAt: model.calledAt,
      status: model.status,
    );
  }
}
