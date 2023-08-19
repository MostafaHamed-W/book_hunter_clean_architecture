import 'package:book_hunt/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:book_hunt/Features/home/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_hunt/Features/home/presentation/views/book_details_view.dart';
import 'package:book_hunt/Features/home/presentation/views/home_view.dart';
import 'package:book_hunt/Features/home/presentation/views/book_preview_view.dart';
import 'package:book_hunt/Features/home/presentation/views/search_view.dart';
import 'package:book_hunt/Features/splash/presentation/views/splash_view.dart';
import 'package:book_hunt/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kBookPreviewView = '/bookPreviewView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
          child: BookDetailsView(
            book: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: kBookPreviewView,
        builder: (context, state) => const BookPreviewView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
          child: const SearchView(),
        ),
      )
    ],
  );
}
