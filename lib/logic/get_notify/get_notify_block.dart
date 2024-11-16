import 'package:beauty/data/rest_service.dart';
import 'package:beauty/logic/get_notify/get_notify_event.dart';
import 'package:beauty/logic/get_notify/get_notify_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class GetNotifyBloc extends Bloc<GetNotifyEvent, GetNotifyState> {
  GetNotifyBloc() : super(GetNotifyState.initial()) {
    on<GetWithEvent>(_onGetNotify);
  }

  void _onGetNotify(GetWithEvent event, Emitter<GetNotifyState> emit) async {
    final dio = Dio();
    final service = RestService(dio);
    try {
      final response = await service.getNotify(event.page, event.perPage);
      //print('${List.of(response['data'])[0]}');
      final subject = '${List.of(response['data'])[0]['subject']}';
      final content = '${List.of(response['data'])[0]['content']}';
      emit(GetNotifyState.success(subject,content));
    } catch (e) {
      print('Lỗi nhận thông báo: $e');
      emit(GetNotifyState.failure(e.toString()));
    }
  }
}
