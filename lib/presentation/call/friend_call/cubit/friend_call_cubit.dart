import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livekit_client/livekit_client.dart';

part 'friend_call_state.dart';
part 'friend_call_cubit.freezed.dart';

class FriendCallCubit extends Cubit<FriendCallState> {
  FriendCallCubit() : super(const FriendCallState.initial());
}
