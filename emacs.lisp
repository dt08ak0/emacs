(add-to-list 'load-path "~/.emacs.d/")
					;windmove
					;(require 'framemove)
					;(framemove-default-keybindings) ;; default prefix is Meta
;;didn't work

(custom-set-variables
 (menu-bar-mode)
 ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(erc-log-insert-log-on-open t)
 '(erc-log-write-after-send t)
 '(erc-modules (quote (autojoin button completion fill irccontrols log match menu netsplit noncommands readonly ring scrolltobottom smiley sound stamp track)))
 '(erc-paranoid t)
 '(erc-server-reconnect-attempts 3)
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
 ;; Your init file should contain only one such instance.
 )

;; ANSI shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ibuffer
(require 'ibuffer)

;; Color-themes
					;(require 'color-theme-autoload "color-theme-autoloads")
(require 'color-theme)
(color-theme-initialize)
					;(color-theme-tty)
					;(color-theme-classic)
(color-theme-arjen)

;; Lethe, Linh, Resolve, Robin Hood, TTY Dark

;; gnus gmail imap info

(setq user-mail-address "davor@davor.se")
(setq user-full-name "Davor")
(load-library "smtpmail")
(load-library "nnimap")
(load-library "starttls")
(setq gnus-select-method '(nnimap "imap.gmail.com"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-authinfo-file "~/.authinfo")
				  (nnimap-stream ssl)))

(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("smtp.gmail.com"
				   587
				   "davor@davor.se"
				   )))
(add-hook 'gnus-topic-mode-hook 'gnus-topic-mode)
;;
(put 'upcase-region 'disabled nil)


;; F12 invokes ibuffer
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-use-header-line t)
(global-set-key [(f12)] 'ibuffer)


;; F11 switches to most recently used buffer and
;; shift+F11 selects the buffer that was selected
;; before
(when (require 'bubble-buffer nil t)
  (global-set-key [f11] 'bubble-buffer-next)
  (global-set-key [(shift f11)] 'bubble-buffer-previous))
(setq bubble-buffer-omit-regexp "\\(^ .+$\\|\\*Messages\\*\\|*compilation\\*\\|\\*.+output\\*$\\|\\*TeX Help\\*$\\|\\*vc-diff\\*\\|\\*Occur\\*\\|\\*grep\\*\\|\\*cvs-diff\\*\\)")

;; ical-importer
;; Get calendar info from google calendar into planner.
					;(require 'planner-ical-import)
;; (setq planner-ical-external-calendars
;;       '("http://www.google.com/calendar/ical/davorb%40gmail.com/private-1629fcb0d5c1292a4965dc0593c3f3be/basic.ics"))

;;disable backup
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)

;;window
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

;; git gist support
(require 'gist)


;; window-numbering-mode
;; http://nschum.de/src/emacs/window-numbering-mode/
(require 'window-numbering)
(window-numbering-mode 1)

;; enter the debugger each time an error is found
(setq debug-on-error t)

;; Preserve hard links to the file you’re editing (this is especially important if you edit system files).
(setq backup-by-copying-when-linked t)

;; Preserve the owner and group of the file you’re editing (this is especially important if you edit files as root).
(setq backup-by-copying-when-mismatch t)

;;Always indent using spaces, never tabs (See NoTabs)
(setq-default indent-tabs-mode nil)

;;Include current buffer name in the title bar
(setq frame-title-format "%b - emacs")

;;Emacs is a text editor, make sure your text files end in a newline
;;this will make emacs ask each time it's needed
(setq require-final-newline 'query)

;;Play nice with other version control users
(setq vc-initial-comment t
      vc-diff-switches diff-switches)

;;Never byte-compile your InitFile by hand again
(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name) (expand-file-name (concat default-directory ".emacs")))
      (byte-compile-file (buffer-file-name))))
(add-hook 'after-save-hook 'autocompile)


;;A fun startup message, somewhat reminiscent of “The Matrix: Reloaded”

(defconst animate-n-steps 3) 
(defun emacs-reloaded ()
  (animate-string (concat ";; Initialization successful, welcome to "
			  (substring (emacs-version) 0 16)
			  ".")
		  0 0)
  (newline-and-indent)  (newline-and-indent))

(add-hook 'after-init-hook 'emacs-reloaded)  

;; icicles
(require 'icicles)
(icy-mode 1)
