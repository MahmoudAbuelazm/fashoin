import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/screen/home_screen.dart';
import 'package:store_app/features/categories/presentation/screen/categories_screen.dart';
import '../../features/all_products/presentation/screen/all_products_screen.dart';
import '../../features/users/presentation/screen/users_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoriesScreen(),
        );
      case Routes.allProductsScreen:
        return MaterialPageRoute(
          builder: (_) => const AllProductsScreen(),
        );
      case Routes.usersScreen:
        return MaterialPageRoute(
          builder: (_) => const UsersScreen(),
        );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (context) => getit<HomeCubit>()
      //               ..getSpecializations()
      //               ..getDoctorRecommendations(),
      //             child: const HomeScreen(),
      //           ));
      // case Routes.notificationScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const NotificationScreen(),
      //   );
      // case Routes.doctorsSpecialtyScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => DoctorSpecialityScreen(
      //       specializationsList: arguments! as List<SpecializationData>,
      //     ),
      //   );
      // case Routes.doctorsRecommendationScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => DoctorRecommendationScreen(
      //       doctorRecomendations: arguments! as List<DoctorRecomendationData>,
      //     ),
      //   );
      // case Routes.forgotPasswordScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgetPasswordScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
