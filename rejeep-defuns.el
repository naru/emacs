;;; rejeep-defuns.el --- Custom functions

(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list)) (delete-other-windows))

(defun untabify-buffer ()
  "Replaces all tabs in the buffer with spaces."
  (interactive)
  (untabify (point-min) (point-max)))

(defun untabify-buffer-or-region ()
  "Replaces all tabs in the buffer with spaces."
  (interactive)
  (if mark-active
      (untabify-buffer)
    (untabify (point-min) (point-max))))

(defun indent-buffer ()
  "Indents whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-buffer-or-region ()
  "Indents region if any. Otherwise whole buffer."
  (interactive)
  (if mark-active
      (call-interactively 'indent-region)
    (indent-buffer)))

(defun open-line-below ()
  "Open a line below the line the point is at.
Then move to that line and indent accordning to mode"
  (interactive)
  (move-end-of-line 1)
  (newline)
  (indent-according-to-mode))

(defun open-line-above ()
  "Open a line above the line the point is at.
Then move to that line and indent accordning to mode"
  (interactive)
  (move-beginning-of-line 1)
  (newline)
  (previous-line)
  (indent-according-to-mode))

(defun back-to-indentation-or-beginning-of-line ()
  "Moves point back to indentation if there is any
non blank characters to the left of the cursor.
Otherwise point moves to beginning of line."
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line)
    (back-to-indentation)))

(defun copy-region-to-scratch-buffer ()
  "Copies region to *scratch* buffer."
  (interactive)
  (append-to-buffer "*scratch*" (region-beginning) (region-end)))

(defun mark-current-line ()
  "Marks the current line. Mark is lower than point."
  (interactive)
  (set-mark (line-end-position))
  (back-to-indentation))

(defun mark-whole-lines-region ()
  "Marks whole lines in the selected region."
  (if (< (point) (mark))
      (beginning-of-line)
    (end-of-line))
  (exchange-point-and-mark)
  (if (< (point) (mark))
      (beginning-of-line)
    (end-of-line))
  (exchange-point-and-mark))

(defun comment-or-uncomment-whole-lines-or-region ()
  "Comments or uncomments whole lines in region. If no region is selected,
current line is commented or uncommented."
  (interactive)
  (save-excursion
    (if mark-active
        (mark-whole-lines-region)
      (mark-current-line))
    (comment-or-uncomment-region (region-beginning) (region-end))))

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
        ((looking-back "\\s\)") (backward-list 1))
        (t (self-insert-command arg))))

(defun duplicate-current-line ()
  "Duplicates the current line by placing it right under the current."
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))

(defun google (query)
  "googles a query"
  (interactive "sQuery: ")
  (browse-url (concat "http://www.google.com/search?q=" query)))

(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" (buffer-substring beg end))))

(provide 'rejeep-defuns)
