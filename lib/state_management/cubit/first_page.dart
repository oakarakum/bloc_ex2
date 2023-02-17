import 'package:bloc_ex/state_management/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit , int>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Text(state.toString()),// STATE kısmından gelen değer yazdırıldı.
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {
                            context.read<CounterCubit>().increment();//arttırma burada okuma ile çağrıldı
                          },
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {
                            context.read<CounterCubit>().decrement();
                          },
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
