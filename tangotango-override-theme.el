(deftheme tangotango-override
  "Overrides for the tangotango theme")

(custom-theme-set-faces
 'tangotango-override
 '(mode-line ((t (:box nil))))
 '(mode-line-highlight ((t (:inverse-video t :box nil))))
 '(whitespace-space ((t (:background nil :foreground "grey35"))))
 '(whitespace-tab ((t (:background nil :foreground "grey35")))))

(provide-theme 'tangotango-override)
