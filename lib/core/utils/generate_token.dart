String generateToken(String name) {
  int hash = 0;

  for (int i = 0; i < name.length; i++) {
    hash += name.codeUnitAt(i);
    hash += (hash << 10);
    hash ^= (hash >> 6);
  }

  hash += (hash << 3);
  hash ^= (hash >> 11);
  hash += (hash << 15);

  return hash.toRadixString(16);
}
