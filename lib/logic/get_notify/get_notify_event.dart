abstract class GetNotifyEvent {}

class GetWithEvent extends GetNotifyEvent {
  GetWithEvent({
    required this.page,
    required this.perPage,
    required this.token,
  });
  final int page;
  final int perPage;
  final String token;
}

