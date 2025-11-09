{...}: {
  services.pulseaudio = {
    enable = false;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # alsa.support32bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = {main."monitor.libcamera" = "disabled";};
        };
        "11-low-latency" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 64;
            "default.clock.min-quantum" = 64;
            "default.clock.max-quantum" = 64;
          };
        };
      };
    };
  };
}
