{...}: {
  environment.persistence = {
    "/persist" = {
      hideMounts = true;
      users.titan = {
        directories = [
          # of course, our flake source location:
          ".flake"

          # .config folders from flake:
          ".config/anyrun"
          ".config/BraveSoftware"
          ".config/cargo"
          ".config/fuzzel"
          ".config/ghostty"
          ".config/hypr"
          ".config/keepassxc"
          ".config/matugen"
          ".config/niri"
          ".config/nix-search-tv"
          ".config/rustup"
          ".config/sunsetr"
          ".config/television"
          ".config/xdg-desktop-portal-termfilechooser"
          ".config/yazi"

          # .config folders from private repo:
          ".config/goverlay"
          ".config/lact"
          ".config/MangoHud"
          ".config/noctalia"
          ".config/pipewire"
          ".config/quickshell"
          ".config/spotify"
          ".config/tmux"
          ".config/vesktop"
          ".config/VSCodium"

          # .cache folders:
          ".cache/nix-index"
          ".cache/mozilla"

          # other one-offs:
          ".local/share/Trash" # deserves some experimentation
          ".local/share/org.localsend.localsend_app"
          ".mozilla" # not backed up to github. Too many files.
          ".pki"
          ".plasticity"
          ".ssh"
          ".steam"
          ".vscode-oss" # also mostly not backed up online. Too many files.
          "archroot" # empty mount-point folder
          "Documents"
          "Games" # empty mount-point and symlink location for steam
          "Projects"
          "Media"
        ];
        files = [
          ".config/starship.toml"
          ".local/share/clipvault.db"
          ".bash_history"
          ".face"
          ".gitconfig"
          ".zsh_history"
          ".zshrc"
        ];
      };
    };
  };
}
