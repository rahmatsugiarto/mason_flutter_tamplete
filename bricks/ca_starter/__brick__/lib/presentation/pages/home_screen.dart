import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/state/view_data_state.dart';
import '../../domain/entities/number_trivia_entity.dart';
import '../bloc/home_bloc/home_cubit.dart';
import '../bloc/home_bloc/home_state.dart';
import '../widgets/custom_circular_progress_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Starter Flutter"),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
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
                  Text(state.homeState.failure?.errorMessage??""),
                ],
              ),
            );
          } else if (status.isHasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.number.toString()),
                  Text(data.text),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      // body: BlocConsumer<HomeCubit, HomeState>(
      //   listener: (context, state) {
      //     // TODO: implement listener
      //   },
      //   builder: (context, state) {
      //     final status = state.homeState.status;
      //     final data = state.homeState.data ?? const NumberTriviaEntity();
      //     return LoadingStack(
      //       isLoading: status.isLoading,
      //       widget: Center(
      //         child: SizedBox(
      //           height: MediaQuery.of(context).size.height,
      //           child: Column(
      //             children: [
      //               Text(data.number.toString()),
      //               Text(data.text),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
