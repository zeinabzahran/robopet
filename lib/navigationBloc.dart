import 'package:bloc/bloc.dart';
import 'firstPage.dart';

enum NavigationEvents {
  FirstPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => FirstPage();

  @override
  Stream<NavigationStates> FirstEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.FirstPageClickedEvent:
        yield FirstPage();
        break;
    }
  }

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}