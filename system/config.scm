;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules
 (gnu)
 (youngker packages suckless))

(use-package-modules
 admin
 autotools
 base
 cmake
 commencement
 compression
 compton
 curl
 emacs
 file
 fonts
 fontutils
 gnuzilla
 golang
 gtk
 haskell
 ibus
 image-viewers
 linux
 lsof
 ncurses
 package-management
 pkg-config
 rust-apps
 tls
 tmux
 version-control
 wm
 xdisorg
 xorg)

(use-service-modules
 desktop
 networking
 ssh
 xorg)

(operating-system
 (locale "en_US.utf8")
 (timezone "Asia/Seoul")
 (keyboard-layout (keyboard-layout "us"))
 (host-name "guix")
 (users (cons* (user-account
                (name "youngker")
                (comment "YoungJoo Lee")
                (group "users")
                (home-directory "/home/youngker")
                (supplementary-groups
                 '("wheel" "netdev" "audio" "video")))
               %base-user-accounts))
 (packages
  (append
   (list
    autoconf
    automake
    cmake
    compton
    curl
    emacs
    fd
    feh
    file
    font-google-noto
    fontconfig
    gcc-toolchain
    ghc
    ghc-xmonad-contrib
    git
    gnu-make
    go
    harfbuzz
    ibus
    ibus-libhangul
    icecat
    libxft
    lsof
    ncurses
    openssl
    p7zip
    pkg-config
    ripgrep
    rofi
    setxkbmap
    st-patched
    stow
    strace
    tar
    tmux
    tree
    unzip
    xmobar
    xmonad
    xorgproto
    xrandr
    xrdb
    zip
    zip
    zstd
    zutils
    (specification->package "nss-certs"))
   %base-packages))
 (services
  (append
   (list
    (service openssh-service-type)
    (set-xorg-configuration
     (xorg-configuration
      (keyboard-layout keyboard-layout))))
   %desktop-services))
 (bootloader
  (bootloader-configuration
   (bootloader grub-bootloader)
   (target "/dev/sda")
   (keyboard-layout keyboard-layout)))
 (swap-devices
  (list (uuid "93e93b32-68ff-44b4-ba0a-a64bec270e05")))
 (file-systems
  (cons* (file-system
          (mount-point "/boot/efi")
          (device (uuid "74B4-00ED" 'fat32))
          (type "vfat"))
         (file-system
          (mount-point "/")
          (device
           (uuid "2dde18f7-cbcc-48da-a502-56d6f634a23d"
                 'ext4))
          (type "ext4"))
         %base-file-systems)))
