{pkgs, ...}: {
  programs.anyrun = {
    enable = true;
    config = {
      x = {fraction = 0.5;};
      y = {fraction = 0.3;};
      width = {fraction = 0.3;};
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = null;

      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/libshell.so"
        "${pkgs.anyrun}/lib/libtranslate.so"
        "${pkgs.anyrun}/lib/libdictionary.so"
        "${pkgs.anyrun}/lib/libnix_run.so"
        "${pkgs.anyrun}/lib/libniri_focus.so"
      ];
    };

    # Inline comments are supported for language injection into
    # multi-line strings with Treesitter! (Depends on your editor)
    extraCss =
      /*
      css
      */
      ''
        # .some_class {
        #  background: red;
        # }
      '';

    extraConfigFiles = {
      "applications.ron".text = ''
        // <Anyrun config dir>/applications.ron
        Config(
          // Also show the Desktop Actions defined in the desktop files, e.g. "New Window" from LibreWolf
          desktop_actions: true,

          max_entries: 5,

          // A command to preprocess the command from the desktop file. The commands should take arguments in this order:
          // command_name <term|no-term> <command>
          preprocess_exec_script: Some("/home/user/.local/share/anyrun/preprocess_application_command.sh")

          // The terminal used for running terminal based desktop entries, if left as `None` a static list of terminals is used
          // to determine what terminal to use.
          terminal: Some(Terminal(
            // The main terminal command
            command: "alacritty",
            // What arguments should be passed to the terminal process to run the command correctly
            // {} is replaced with the command in the desktop entry
            args: "-e {}",
          )),
        )'';

      "shell.ron".text = ''
        // <Anyrun config dir>/shell.ron
        Config(
          prefix: ":sh",
          // Override the shell used to launch the command
          shell: None,
        )'';

      "translate.ron".text = ''
        // <Anyrun config dir>/translate.ron
        Config(
          prefix: ":",
          language_delimiter: ">",
          max_entries: 3,
        )'';

      "dictionary.ron".text = ''
        // <Anyrun config dir>/dictionary.ron
        Config(
          prefix: ":def",
          max_entries: 5,
        )'';

      "nix-run.ron".text = ''
        // <Anyrun config dir>/nix-run.ron
        Config(
          prefix: ":nr ",
          // Whether or not to allow unfree packages
          allow_unfree: false,
          // Nixpkgs channel to get the package list from
          channel: "nixpkgs-unstable",
          max_entries: 3,
        )'';

      "niri-focus.ron".text = ''
        // <Anyrun config dir>/niri-focus.ron
        Config(
          max_entries: 2,
        )'';
    };
  };
}
