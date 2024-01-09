String getInitialName(String name) {
  var initials = name.split(" ");
  var initialName = "";
  for (var i = 0; i < 2; i++) {
    initialName += initials[i].substring(0, 1);
  }
  return initialName;
}
