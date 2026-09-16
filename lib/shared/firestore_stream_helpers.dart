import 'package:cloud_firestore/cloud_firestore.dart';

Stream<T?> watchDocument<T>(DocumentReference<T> reference) {
  return reference.snapshots().map((snapshot) => snapshot.data());
}

Stream<List<T>> watchQuery<T>(
  Query<T> query, {
  bool Function(T value)? where,
  Comparator<T>? compare,
}) {
  return query.snapshots().map((snapshot) {
    Iterable<T> values = snapshot.docs.map((document) => document.data());

    if (where != null) {
      values = values.where(where);
    }

    final result = values.toList();
    if (compare != null) {
      result.sort(compare);
    }

    return result;
  });
}
