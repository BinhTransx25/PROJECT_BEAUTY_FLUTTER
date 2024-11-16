class GetNotifyState {
  final String status;
  final String errorMessage;
  final String subject;
  final String content;

  GetNotifyState._({
    this.status = '',
    this.errorMessage = '',
    this.subject = '',
    this.content = '',
  });


  factory GetNotifyState.initial() {
    return GetNotifyState._(status: 'initial');
  }

  factory GetNotifyState.success(String subject, String content) {
    return GetNotifyState._(status: 'success', subject: subject,content:content);
  }

  factory GetNotifyState.failure(String errorMessage) {
    return GetNotifyState._(status: 'failure', errorMessage: errorMessage);
  }

}