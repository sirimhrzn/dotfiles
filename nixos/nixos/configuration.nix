# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  unstable,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "nixos";
    nameservers = [
    ];
  };
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-intel" ];

  programs.starship = {
    enable = true;
  };
  fonts.packages = [
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
    pkgs.noto-fonts-emoji
    pkgs.liberation_ttf
    pkgs.fira-code
    pkgs.fira-code-symbols
    pkgs.mplus-outline-fonts.githubRelease
    pkgs.dina-font
    pkgs.proggyfonts
    pkgs.noto-fonts-emoji
    (unstable.nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
        "JetBrainsMono"
        "ZedMono"
      ];
    })
  ];

  programs.zsh.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  programs.light.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kathmandu";
  i18n.defaultLocale = "en_US.UTF-8";

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  # xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 "/home/sirimhrzn/.config/sway/config.in";
  programs.sway = {
     enable = true;
     wrapperFeatures.gtk = true;
     package = pkgs.sway;
     extraOptions = [
     "-c /home/sirimhrzn/.config/sway/config"
     ];
     extraPackages = with pkgs; [
  	i3status i3status-rust
  	termite rofi light
	swaylock swayidle foot
     ];
  };
 services.xserver = {
    enable = true;
    displayManager = {
      # defaultSession = "sway";
      # autoLogin = true;
        gdm = {
	  enable = true;
	  wayland = true;
	};
    };
  };
  users.groups.sirimhrzn = { };
  users.users.sirimhrzn = {
    isNormalUser = true;
    group = "sirimhrzn";
    description = "sirimhrzn";
    hashedPassword = "$6$gj7wGP2bivbhIQQ3$b22ysKyYOMXlrPh0iRhAUHAhOE2wC1uVrhbBMKdYAnH3wedZfqPP5ho6op8kHFLNed4p3lR47mnoH6ib/sYK31";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];
    packages = [
      pkgs.firefox-beta
      pkgs.networkmanagerapplet
      pkgs.font-awesome
      pkgs.nerdfonts
      pkgs.oh-my-zsh
      pkgs.acpi
      # pkgs.gnome.nautilus
      pkgs.gitui
      pkgs.cargo
      pkgs.bat
      pkgs.nodejs_21
      pkgs.pavucontrol
      pkgs.blueman
      pkgs.bluez
      pkgs.bluez-tools
      pkgs.swappy
      pkgs.grimblast
      pkgs.pamixer
      pkgs.discord
      pkgs.docker
      pkgs.silicon
      pkgs.starship
      pkgs.btop
      pkgs.neofetch
      pkgs.typora

      pkgs.pulseaudio
      pkgs.minikube
      pkgs.ngrok
      unstable.dmenu-rs

      pkgs.haskellPackages.kmonad
      pkgs.picom
      unstable.zed-editor
      unstable.teams-for-linux
      unstable.zoxide
      unstable.postman
      unstable.brave
      unstable.nodePackages.npm
      unstable.go
      unstable.gopls
      unstable.glab
      unstable.vscode
      unstable.alacritty
      unstable.wezterm
      unstable.git-cliff
      unstable.delta
      unstable.neovim
      unstable.helix
      unstable.frankenphp
    ];
  };

  nix.settings.trusted-users = [
    "root"
    "sirimhrzn"
  ];
  users.defaultUserShell = pkgs.zsh;
  environment.interactiveShellInit = ''
	alias ls="eza";
  '';


  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };

  # services.nginx =
  #   let
  #     data_dir = "/home/sirimhrzn/Desktop/Genius/news/public";
  #   in
  #   {
  #     enable = true;
  #     recommendedProxySettings = true;
  #     virtualHosts.localhost = {
  #       extraConfig = ''
  #         add_header x-systemd-nginx yes;
  #       '';
  #       locations."/" = {
  #         root = data_dir;
  #         extraConfig = ''
  #           proxy_pass http://localhost:8080;
  #         '';
  #       };
  #     };
  #   };

 #  services.caddy = {
 #    enable = true;
 #    globalConfig = ''
	#     frankenphp
 #    	    order php_server before file_server
 #    '';
 #    virtualHosts.localhost  = {
	# extraConfig = ''
	# 	root * /home/sirimhrzn/Desktop/Genius/octane/franken/public/
	# 	encode zstd br gzip
	# 	php_server
	# '';
 #    };
 #  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      9000
    ];
  };

  environment.systemPackages = [
    pkgs.vim
    pkgs.wget
    pkgs.dunst
    pkgs.libnotify
    pkgs.waybar
    pkgs.swww
    pkgs.polkit_gnome
    pkgs.dolphin
    pkgs.ntfs3g
    pkgs.wl-clipboard
    pkgs.curl
    pkgs.zsh
    pkgs.polybar
    pkgs.rofi
    pkgs.fluent-bit
    pkgs.brightnessctl
    pkgs.wofi
    pkgs.fish
    pkgs.git
    pkgs.jq
    pkgs.sddm
    pkgs.kubectl
    pkgs.xclip
    pkgs.clang
    pkgs.rsyslog
    pkgs.openvpn
    pkgs.ripgrep
    pkgs.openssl.dev
    pkgs.eza
    pkgs.nginx
    unstable.kitty
    unstable.zellij
  ];
  systemd.user.services.sway = {
    description = "Sway";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.sway}/bin/sway --config /home/sirimhrzn/.config/sway/config'';
    };
  };
 services.openssh.enable = true;
  services.rsyslogd = {
    enable = true;
    extraConfig = ''
      $ModLoad imtcp
      $InputTCPServerRun 514
      if $programname == 'laravel' then /var/log/laravel.log
      if $programname == 'nginx' then /var/log/nginx.log
    '';
  };
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  # virtualisation.oci-containers = {
  #   backend = "docker";
  #   containers = {
  #     pma =
  #       {
  #         image = "phpmyadmin:latest";
  #         ports = [ "8080:80" ];
  #         autoStart = true;
	 #  environment = {
	 #    PMA_HOST = "0.0.0.0";
	 #    PMA_PORT = "3306";
	 #    PMA_ARBITRARY= "1";
	 #  };
  #       };
  #   };
  # };

  # virtualisation.oci-containers = {
  #   backend = "docker";
  #   containers = {
  #     nginx =
  #       let
  #         dir = "/home/sirimhrzn/nixos-containers/nginx";
  #       in
  #       {
  #         image = "nginx:stable-alpine";
  #         ports = [ "8080:80" ];
  #         volumes = [
  #           "${dir}/nginx.conf:/etc/nginx/nginx.conf"
  #           "${dir}/conf.d:/etc/nginx/conf.d"
  #           "${dir}/log:/var/log/nginx"
  #         ];
  #         autoStart = true;
  #       };
  #   };
  # };
  system.stateVersion = "23.11";
}