class ContactState {
  final bool isLoading;
  final String? error;
  final bool? showMessage;
  final String? message;

  ContactState(
      {required this.isLoading, this.error, this.showMessage, this.message});

  factory ContactState.initial() {
    return ContactState(
        isLoading: false, error: null, showMessage: false, message: null);
  }

  ContactState copyWith(
      {bool? isLoading, String? error, bool? showMessage, String? message}) {
    return ContactState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        showMessage: showMessage ?? this.showMessage,
        message: message ?? this.message);
  }

  @override
  String toString() => 'ContactState(isLoading: $isLoading, error: $error)';
}
