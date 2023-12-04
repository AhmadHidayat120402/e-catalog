// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_ecatalog/data/datasource/auth_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDataSource authDataSource;
  RegisterBloc(
    this.authDataSource,
  ) : super(RegisterInitial()) {
    on<DoRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await authDataSource.register(event.model);
      result.fold(
        (error) => emit(
          RegisterError(error),
        ),
        (data) => emit(
          RegisterLoaded(data),
        ),
      );
    });
  }
}
