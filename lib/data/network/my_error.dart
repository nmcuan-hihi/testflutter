// enum AppError {
//   notFound,
//   // some errors codes
// }

class MyError {
  final int code;
  final String? message;

  const MyError({
    required this.code,
    this.message,
  });
}
