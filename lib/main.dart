import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Features/home/data/repos/home_repo_impl.dart';
import 'Features/home/domain/enitities/book_entity.dart';
import 'Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'Features/home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/simple_bloc_observer.dart';

void main() async {
  setupServiceLocator();
  //initial Hive
  await Hive.initFlutter();
  //register hive adapter and open box
  Hive.registerAdapter<BookEntity>(BookEntityAdapter());
  //Open hive box
  await Hive.openBox<BookEntity>(kFeaturebBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  Bloc.observer = SimpleBlocObserver();
  // change status bar and navigation bar color to black
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black // Replace 'Colors.blue' with the color you desire
      ));

  runApp(const BookHunter());
}

class BookHunter extends StatelessWidget {
  const BookHunter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
