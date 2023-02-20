import 'package:bloc_ex/state_management/project2/proje2_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ProjectPage2 extends StatelessWidget {
  const ProjectPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NamesCubit(userList: _userList),
      child: const Project2View());
    
  }
}

class Project2View extends StatelessWidget {
  const Project2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<NamesCubit,String?>(
        builder: (context, String? nameState){
          final textButton = TextButton(onPressed: () {
            context.read<NamesCubit>().getRandomName();
          }, child: Text("Fetch user"));
          if (nameState != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nameState),
                  textButton
                ],
              ),
            );
          }
          else{
return Center(
  child: textButton,
);
          }
        },
        )
    );
  }
}

const Iterable<String> _userList = <String>[//Iterable lazy list örneği
  'Sydnee',
  'Percy',
  'Newell',
  'Brain',
  'Armstrong',
  'Gutmann',
  'Sawayn',
];


