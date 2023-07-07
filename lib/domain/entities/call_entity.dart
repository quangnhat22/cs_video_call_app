import 'package:videocall/data/models/call_model.dart';
import 'package:videocall/data/models/user_model.dart';

class CallEntity {
  String id;
  UserModel? subjectCall;
  UserModel? callee;
  UserModel? caller;
  DateTime? calledAt;
  String? status;

  CallEntity(
      {required this.id,
      this.callee,
      this.caller,
      this.calledAt,
      this.status,
      this.subjectCall});

  static final callEntityEmpty = CallEntity(id: "-1");

  static CallEntity convertToCallEntity(
      {CallModel? model, required String id}) {
    if (model == null) return callEntityEmpty;
    return CallEntity(
      id: model.id,
      subjectCall: model.caller?.id == id ? model.callee : model.caller,
      callee: model.callee,
      caller: model.caller,
      calledAt: model.calledAt,
      status: model.status,
    );
  }
}
