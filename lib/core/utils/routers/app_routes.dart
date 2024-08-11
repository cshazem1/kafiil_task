import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kafiil_task/core/utils/routers/routes.dart';
import 'package:kafiil_task/features/nav_bottom_bar/presentation/views/nv_bottom_bar_view.dart';

import '../../../features/auth/data/models/auth_model/auth_model.dart';
import '../../../features/auth/presentation/views/login_view/login_view.dart';
import '../../../features/auth/presentation/views/register_view/register_complete_data_view.dart';
import '../../../features/auth/presentation/views/register_view/register_view.dart';

class AppRoutes{

static  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {

          return  LoginView();

          },
      ),
      GoRoute(
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage(child: RegisterView());
        },
        path: Routes.registerView,
      ),
      GoRoute(
        pageBuilder: (BuildContext context, GoRouterState state) {
          final registerModel = state.extra as AuthModel?;

          return   NoTransitionPage(child: RegisterCompleteDataView(registerModel:registerModel!,
          ));
        },
        path: Routes.registerCompleteDataView,
      ),
      GoRoute(
        pageBuilder: (BuildContext context, GoRouterState state) {
          final authModel = state.extra as AuthModel?;

          return   NoTransitionPage(child: NavBottomBarView(authModel:authModel!));
        },
        path: Routes.navBottomBarView,
      ),
    ],
  );
}