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

;; MUD-client
;(require 'lpmud)
;(autoload 'lpmud "lpmud" "Run LP-MUD in Emacs" t)
(autoload 'mu-open "mu" "Play on MUSHes and MUDs" t)
(add-hook 'mu-connection-mode-hook 'ansi-color-for-comint-mode-on)

;; ;;; erc -- IRC-client
;; ;; adds erc-menu
;; (require 'easymenu)
;; (easy-menu-add-item nil '("tools")
;; 		    ["IRC with ERC" erc t])

;; ; erc-after-connect hook
;; ;(add-hook 'erc-after-connect '(lambda (SERVER NICK)
;; ;				(erc-message "PRIVMSG" "Q@CServe.quakenet.org AUTH vodnik CSk4RzbVB2")))

;; ;; using multi-channel hook instead
;; (add-hook 'erc-after-connect
;; 	  '(lambda (SERVER NICK)
;; 	     (cond
;; 	      ((string-match "quakenet\\.org" SERVER)
;; 	       (erc-message "PRIVMSG" "Q@CServe.quakenet.org AUTH vodnik CSk4RzbVB2")))))
;; ;	      ((string-match "efnet\\.port80\\.se" SERVER)
;; ;	       (())))))
	 

;; ;; and then auto join channels
;; (require 'erc-join)
;; (erc-autojoin-mode 1)
;; (setq erc-autojoin-channels-alist
;;       '(("se.quakenet.org" "#linero")("efnet.port80.se" "#df.lth.se" "#blausoffan")))

;; ;; make sure that it reacts to my name
;; (setq erc-keywords '("davor"))
;; (erc-match-mode)

;; ; add timestamps
;; (erc-timestamp-mode t)
;; (setq erc-timestamp-format "[%R-%m]")

;; ;; logging
;; (setq erc-log-insert-log-on-open nil)
;; (setq erc-log-channels t)
;; (setq erc-log-channels-directory "~/docs/logs/irc/")
;; (setq erc-save-buffer-on-part t)
;; (setq erc-hide-timestamps nil)

;; (defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
;;   (save-some-buffers t (lambda () (when (and (eq major-mode 'erc-mode)
;;                                              (not (null buffer-file-name)))))))

;; (add-hook 'erc-insert-post-hook 'erc-save-buffer-in-logs)
;; (add-hook 'erc-mode-hook '(lambda () (when (not (featurep 'xemacs))
;;                                        (set (make-variable-buffer-local
;;                                              'coding-system-for-write)
;;                                             'emacs-mule))))
;; ;; end logging

;; ;; Truncate buffers so they don't hog core.
;; (setq erc-max-buffer-size 20000)
;; (defvar erc-insert-post-hook)
;; (add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
;; (setq erc-truncate-buffer-on-save t)

;; ;; enable auto-away after 15min of emacs non-activity
;; ;(setq erc-autoaway-idle-seconds 900)
;; ;(setq erc-autoaway-message "Jag kanske inte svarar direkt. (har under %i inte rÃ¶rt emacs sekunder)")
;; ;(setq erc-autoaway-use-emacs-idle t)

;; ;; when everything is done, connect to the network(s)
;; (defun irc-connect ()
;;   "Connect to IRC."
;;   (interactive)
;;   (when (y-or-n-p "IRC? ")
;;     (erc :server "se.quakenet.org" :port 6667
;; 	 :nick "vodnik" :full-name "fahrenheit451")
;;     (erc :server "efnet.port80.se" :port 6667
;; 	 :nick "vodnik" :full-name "fahrenheit451")))

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
; (setq planner-ical-external-calendars
;       '("http://www.google.com/calendar/ical/davorb%40gmail.com/private-1629fcb0d5c1292a4965dc0593c3f3be/basic.ics"))

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;;window
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

;; git gist support
(add-to-list 'load-path "~/.emacs.d/vendor/gist.el")
(require 'gist)


;; window-numbering-mode
;; http://nschum.de/src/emacs/window-numbering-mode/
(require 'window-numbering)
(window-numbering-mode 1)