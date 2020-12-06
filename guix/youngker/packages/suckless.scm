(define-module (youngker packages suckless)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix packages))

(define-public st-patched
  (package
   (name "st-patched")
   (version "0.8.4")
   (source
    (origin
     (method git-fetch)
     (uri
      (git-reference
       (url "https://github.com/youngker/st.git")
       (commit "db6ed5218cf6b7584f2e715759c671c1b16f9b67")))
     (file-name (git-file-name name version))
     (sha256
      (base32 "08fqbiz0gp2lnqax7warjwfdq8y6ln8lp4dag28aab7gxsq4i9sc"))))

   (arguments
    `(#:make-flags (list "CC=gcc")
      #:phases
      (modify-phases
       %standard-phases
       (delete 'configure)
       (delete 'check)
       (replace 'install
                (lambda _
                  (let* ((out (assoc-ref %outputs "out"))
                         (bin (string-append out "/bin")))
                    (install-file "st" bin)))))))
   (build-system gnu-build-system)
   (native-inputs
    `(("pkg-config" ,pkg-config)))
   (inputs
    `(("libxft" ,libxft)
      ("libx11" ,libx11)
      ("harfbuzz", harfbuzz)))
   (home-page "https://st.suckless.org")
   (synopsis "Simple terminal emulator")
   (description "St implements a simple and lightweight terminal emulator.  It implements 256 colors, most VT10X escape sequences, utf8, X11 copy/paste, antialiased fonts (using fontconfig), fallback fonts, resizing, and line drawing.")
   (license license:x11)))
