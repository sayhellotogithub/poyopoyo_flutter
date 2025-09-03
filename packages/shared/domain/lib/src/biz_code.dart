// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/26
// Description:
// -------------------------------------------------------------------
final class BizCode {
  final String ns; // Namespaces, such as "auth" / "payment"
  final String name; // Code name, such as "user_blocked"
  const BizCode(this.ns, this.name);

  @override
  String toString() => '$ns:$name';

  @override
  bool operator ==(Object o) => o is BizCode && o.ns == ns && o.name == name;

  @override
  int get hashCode => Object.hash(ns, name);
}
