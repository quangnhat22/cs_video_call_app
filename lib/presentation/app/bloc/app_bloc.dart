import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@Injectable()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppUnAuthorized()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
