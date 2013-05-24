(deftheme tangotango-override
  "Overrides for the tangotango theme")

(custom-theme-set-faces
 'tangotango-override
 '(mode-line ((t (:box nil))))
 '(mode-line-highlight ((t (:inverse-video t :box nil)))))

(provide-theme 'tangotango-override)
