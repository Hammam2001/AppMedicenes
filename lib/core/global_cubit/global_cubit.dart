import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());
  static  GlobalCubit get(context) => BlocProvider.of(context);
  late String token;
  late String firstName;
  late String lastName;
  late String phone;
  List filterSearch = [];

}

