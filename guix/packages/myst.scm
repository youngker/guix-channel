(define-module (guix packages myst)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu))
;;  #:use-module (gnu packages myst))

(define-public myst
  (package
   (name "myst")
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
      (modify-phases %standard-phases
                     (delete 'configure))))
   (build-system gnu-build-system)
   (home-page "ttt")
   (synopsis "ttt")
   (description "ttt")
   (license license:gpl3+)))

