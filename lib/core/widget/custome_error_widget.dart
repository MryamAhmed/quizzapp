import 'package:flutter/cupertino.dart';

class CustomeErrorWidget extends StatelessWidget {
  const CustomeErrorWidget({Key? key, required this.errorMessage})
      : super(key: key);

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
    );
  }
}
