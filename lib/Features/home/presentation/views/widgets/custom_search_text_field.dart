import 'package:book_hunt/Features/home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        onSubmitted: (value) {
          BlocProvider.of<SearchBooksCubit>(context).searchBooks(searchText: value);
        },
        decoration: InputDecoration(
          hintText: 'Search',
          enabledBorder: borderDecoration(),
          focusedBorder: borderDecoration(),
        ),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
