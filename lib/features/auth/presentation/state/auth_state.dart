class AuthState {
  final bool isLoading;
  final String? error;
  final String? imageName;
  final bool? showMessage;
  final String? message;

  AuthState({ 
    required this.isLoading,
    this.error,
    this.imageName,
    this.showMessage,
    this.message
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    bool? showMessage,
    String? message
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
      showMessage: showMessage ?? this.showMessage,
      message: message?? this.message
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
