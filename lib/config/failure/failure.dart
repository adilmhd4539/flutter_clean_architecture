import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  static String convertFailureToMessage(Failure failure) {
    return failure.when(
      netWorkFailure: () => 'No network connection please ty again',
      unAutherised: (message) =>
          message ?? 'Couldn\'t Autherize you try again later',
      timeOut: () =>
          'Connection time out please check your network connection or try again later',
      unknownFailure: () => 'Somthing went wrong please try again later',
    );
  }

  const factory Failure.netWorkFailure() = NetWorkFailure;
  const factory Failure.unAutherised({String? mesaage}) = UnAutherised;
  const factory Failure.timeOut() = TimeOut;
  const factory Failure.unknownFailure() = UnknownFailure;
}
