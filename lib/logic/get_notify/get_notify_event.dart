abstract class GetNotifyEvent {}

class GetWithEvent extends GetNotifyEvent {
  GetWithEvent({
    required this.page,
    required this.perPage,
  });
  final int page;
  final int perPage;
}

