(define-module (youngker myst)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix packages))

(define-public yst
  (package
   (name "yst")
   (version "0.1")
   (source
    (origin
     (method git-fetch)
     (uri
      (git-reference
       (url "https://github.com/LukeSmithxyz/st.git")
       (commit "13b3c631be13849cd80bef76ada7ead93ad48dc6")))
     (file-name (git-file-name name version))
     (sha256
      (base32 "009za6dv8cr2brs31sjqixnkk3jwm8k62qk38sz4ggby3ps9dzf4"))))

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
   (home-page "tbd")
   (synopsis "tbd")
   (description "tbd")
   (license license:gpl3+)))
