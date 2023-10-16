import '../widgets/custom_dialog_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/state/view_data_state.dart';
import '../../domain/entities/number_trivia_entity.dart';
import '../bloc/home_bloc/home_cubit.dart';
import '../bloc/home_bloc/home_state.dart';
import '../widgets/custom_circular_progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getNumberTriviaRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Starter Flutter"),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          final status = state.homeState.status;

          if (status.isLoading) {
            CustomDialogLoading.show();
          }

          if (status.isHasData || status.isError) {
            CustomDialogLoading.dismiss();
          }
        },
        builder: (context, state) {
          final status = state.homeState.status;
          final data = state.homeState.data ?? const NumberTriviaEntity();
          if (status.isLoading) {
            return const Center(child: CustomCircularProgressIndicator());
          } else if (status.isError) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.homeState.message),
                  Text(state.homeState.failure?.errorMessage ?? ""),
                ],
              ),
            );
          } else if (status.isHasData) {
            return InkWell(
              // onTap: () => Navigator.pushNamed(context, AppRoutes.secondScreen),
              onTap: () => context.read<HomeCubit>().getNumberTriviaRandom(),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.number.toString()),
                    Text(data.text),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
