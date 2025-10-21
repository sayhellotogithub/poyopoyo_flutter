// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/21
// Description:
// -------------------------------------------------------------------
typedef Reducer<S, A> = S Function(S, A);
typedef Dispatcher<A> = void Function(A);
typedef StateHookWithReducer<S, A> = (S Function(), Dispatcher<A>);

StateHookWithReducer<S, A> useReducer<S, A>(
  Reducer<S, A> reducer,
  S initialValue,
) {
  S state = initialValue;
  S get() => state;
  void dispatch(A action) {
    state = reducer(state, action);
  }

  return (get, dispatch);
}

void main() {
  final (getCount, dispatch) = useReducer<int, String>((state, action) {
    if (action == "increment") return state + 1;
    if (action == "reset") return 0;
    return state;
  }, 0);

  print(getCount());
  dispatch("increment");
  print(getCount());
  dispatch("increment");
  print(getCount());
  dispatch("reset");
  print(getCount());
}
