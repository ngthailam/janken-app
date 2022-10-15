import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith(skipFields: true)
class Destination {
  final String routePath;

  final dynamic data;

  Destination({required this.routePath, this.data});
}
