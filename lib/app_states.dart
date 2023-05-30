class AppStates{
  int counter;
  AppStates({required this.counter});

}

class InitStates extends AppStates{
  InitStates():super(counter: 0); /// We calling AppStates constructor and passing 0 as argument
}