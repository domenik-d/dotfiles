# modules/desktop/plasma.nix
{ pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      clickToOpenHasEffect = false;
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    shortcuts = {
      ksmserver = {
        "Lock Session" = "Meta+L";
      };
      kwin = {
        "Expose" = "Meta+F10";
      };
    };
  };
}
