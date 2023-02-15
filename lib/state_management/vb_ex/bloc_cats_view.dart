import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cats_cubit.dart';
import 'cats_repository.dart';
import 'cats_state.dart';

class BlocCatsView extends StatelessWidget {
  const BlocCatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatsCubit(SampleCatsRepository()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        //floatingActionButton: CallButton(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cats"),
        ),
        body: BlocConsumer<CatsCubit, CatsState>(
          listener: (context, state) {
            // state çalışırken herhangi bir anda CatsError yanıtı gelirse
            if (state is CatsError) {
              Scaffold.of(context).showBottomSheet(
                  (context) => SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is CatsInitial) {
              return buildCenterInitialChild(
                state: state,
              );
            } else if (state is CatsLoading) {
              return buildCenterLoadingChild();
            } else if (state is CatsCompleted) {
              return Center(
                child: SizedBox(
                  height: 600,
                  width: 350,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Image.network(
                          //state.response[index].imageUrl.toString()
                          "${state.response[index].imageUrl}"),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${state.response[index].description}",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    itemCount: state.response.length,
                  ),
                ),
              );
            } else {
              final error = state as CatsError;
              return Text(error.message);
            }
          },
        ),
      );
}

class buildCenterLoadingChild extends StatelessWidget {
  const buildCenterLoadingChild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class buildCenterInitialChild extends StatelessWidget {
  final state;
  const buildCenterInitialChild({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CallButton(),
          const Text("Hello"),
        ],
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  const CallButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.clear_all_sharp),
      onPressed: () {
        context.read<CatsCubit>().getCats();
      },
    );
  }
}
