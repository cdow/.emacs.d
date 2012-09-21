(deftheme local
  "My local theme")

(custom-theme-set-faces
 'local
 '(fringe ((t (:background "#969696"))))
 '(mode-line ((t (:foreground "#ffffff" :background "#595959" :box nil))))
 '(font-lock-comment-face ((t (:foreground "#7d827d"))))
 '(font-lock-string-face ((t (:foreground "magenta"))))
 '(font-lock-variable-name-face ((t (:foreground "#e6a00f"))))
 '(minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
 '(mode-line-highlight ((t (:inverse-video t :box nil)))))

(provide-theme 'local)
