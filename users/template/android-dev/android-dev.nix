{...}: {
  users.users.template.extraGroups = ["kvm" "adbusers"];
  programs.adb.enable = true;
}
