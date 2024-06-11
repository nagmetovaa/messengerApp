abstract class ContactState{}


class ContactLoadState extends ContactState {}

class ContactLoadedState extends ContactState {
  List <dynamic>? loadedContactlist;
  ContactLoadedState({required this.loadedContactlist}) : assert(loadedContactlist != null);
}
class ContactErrorState extends ContactState {
  print(e) {
    throw UnimplementedError();
  }
}