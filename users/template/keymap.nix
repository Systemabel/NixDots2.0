{...}: {
  console.keyMap = "us";
  services.xserver.xkb = {
    layout = "us";
    variant = ""; # "" is default (usually qwerty or whatever your
    # language sets). You can also do something like "colemak", "dvorak", or
    # "workman" if you wanted to...
    options = "";
  };
}
