class signUpWithEmailAndPasswordFailure {
  final String message;

  const signUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown Error Occured"]);

  factory signUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const signUpWithEmailAndPasswordFailure(
            'Please enter a stronger Password');
      case '':
        return const signUpWithEmailAndPasswordFailure('Email is not valid');
      case '':
        return const signUpWithEmailAndPasswordFailure(
            'An account already exists for that email');
      case '':
        return const signUpWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support');
      case '':
        return const signUpWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support.');
      default:
        return const signUpWithEmailAndPasswordFailure();
    }
  }
}
