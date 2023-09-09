import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_pass_event.dart';
part 'category_pass_state.dart';

class CategoryPassBloc extends Bloc<CategoryPassEvent, CategoryPassState> {
  CategoryPassBloc() : super(CategoryPassInitial()) {
    on<CategoryPassEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
