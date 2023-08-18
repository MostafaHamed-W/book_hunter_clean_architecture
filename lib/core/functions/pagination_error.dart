import 'package:flutter/material.dart';

SnackBar snackBarPaginationError(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
      style: const TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    duration: const Duration(seconds: 3),
  );
}
