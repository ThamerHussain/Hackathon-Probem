void insertOrAppend<T>(List<T> list, int index, T item) {
  if (index < list.length) {
    list.insert(index, item);
  } else {
    list.add(item);
  }
}
