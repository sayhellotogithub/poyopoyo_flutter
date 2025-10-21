// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/10/21
// Description:
// -------------------------------------------------------------------
typedef StateHook<T> = (T Function(), void Function(T));

StateHook<T> useState<T>(T initialValue) {
  T state = initialValue;
  T get() => state;
  void set(T newValue) {
    state = newValue;
  }

  return (get, set);
}

void main(){
  final (get, set) = useState(1);
  print(get());
  set(3);

  print(get());

}