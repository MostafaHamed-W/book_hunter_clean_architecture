import 'package:flutter/material.dart';

import '../../Features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';

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
