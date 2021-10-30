part of 'login_cubit.dart';

class LoginState extends Equatable {
  final UserDetails userDetails;
  final LoadStatus loadStatus;
  final Failure failure;
  LoginState({
    required this.userDetails,
    required this.loadStatus,
    required this.failure,
  });

  factory LoginState.initial() {
    return LoginState(
      userDetails: UserDetails.initial(),
      failure: Failure(),
      loadStatus: LoadStatus.initial,
    );
  }

  @override
  List<Object> get props => [
        userDetails,
        loadStatus,
        failure,
      ];

  LoginState copyWith({
    UserDetails? userDetails,
    LoadStatus? loadStatus,
    Failure? failure,
  }) {
    return LoginState(
      userDetails: userDetails ?? this.userDetails,
      loadStatus: loadStatus ?? this.loadStatus,
      failure: failure ?? this.failure,
    );
  }
}

// class LoginInitial extends LoginState {}

// class LoginSuccess extends LoginState {
//   const LoginSuccess({
//     // required this.userCredential,
//     required this.userDetails,
//   });
//   //final UserCredential userCredential;
//   final UserDetails userDetails;

//   @override
//   List<Object> get props => [
//         //    userCredential,
//         userDetails,
//       ];
// }

// class LoginLoading extends LoginState {}

// class LoginFailure extends LoginState {
//   final Failure failure;

//   const LoginFailure(this.failure);
// }
