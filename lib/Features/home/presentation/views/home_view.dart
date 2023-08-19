import 'package:book_hunt/Features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
