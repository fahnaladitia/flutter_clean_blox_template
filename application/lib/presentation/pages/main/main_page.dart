import 'package:feature_home/presentation/pages/home_page.dart';
import 'package:feature_profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:application/router/route.dart';
import 'package:application/di/injection.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/blocs/auth/auth_bloc.dart';
import 'package:shared/utils/context_ext.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final AuthBloc _authBloc;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt.get();
    _authBloc.add(AuthCheckRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final pages = [HomePage(), ProfilePage()];
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is AuthErrorState ||
            state is AuthUnauthenticatedState ||
            state is AuthAuthenticatedState) {
          FlutterNativeSplash.remove();
        }

        if (state is AuthUnauthenticatedState) {
          context.goNamed(AppRoute.signIn);
        }

        if (state is AuthErrorState) {
          context.showError(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: context.l10n.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
