import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:janken_app/core/app_router.dart';
import 'package:janken_app/core/helper/loading_state.dart';
import 'package:janken_app/core/widgets/awesome_snackbar.dart';
import 'package:janken_app/features/auth/bloc/login_register_bloc.dart';
import 'package:janken_app/features/auth/bloc/login_register_state.dart';
import 'package:janken_app/main.dart';

part 'widgets/_login_tab.dart';
part 'widgets/_register_tab.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage>
    with SingleTickerProviderStateMixin {
  final LoginRegisterBloc _bloc = getIt();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _blocListener(BuildContext context, LoginRegisterState state) {
    if (state.loginLoadState.isSuccess()) {
      Navigator.of(context).pushNamed(AppRouter.main);
      return;
    }

    if (state.loginLoadState.isFailure() ||
        state.registerLoadState.isFailure()) {
      context.showErrorSb();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc..initiate(),
        child: BlocListener<LoginRegisterBloc, LoginRegisterState>(
          listener: _blocListener,
          child: SafeArea(
            child: BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
              buildWhen: (prev, current) {
                return prev.showForm != current.showForm;
              },
              builder: (context, state) {
                if (!state.showForm) return const SizedBox.shrink();

                return Column(
                  children: [
                    _tabBar(),
                    Expanded(child: _tabView()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: TabBar(
        controller: _tabController,
        // give the indicator a decoration (color and border radius)
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: Colors.green,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            text: 'Login',
          ),
          Tab(
            text: 'Register',
          ),
        ],
      ),
    );
  }

  Widget _tabView() {
    return TabBarView(
      controller: _tabController,
      children: [
        _LoginTab(),
        _RegisterTab(),
      ],
    );
  }
}
