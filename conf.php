;<?php http_response_code(403); /*
; config file for PrivateBin
;
; An explanation of each setting can be find online at https://github.com/PrivateBin/PrivateBin/wiki/Configuration.

[main]
; enable or disable the discussion feature, defaults to true
discussion = true

; preselect the discussion feature, defaults to false
opendiscussion = false

; enable or disable the password feature, defaults to true
password = true

; enable or disable the file upload feature, defaults to false
fileupload = true

; preselect the burn-after-reading feature, defaults to false
burnafterreadingselected = true

; which display mode to preselect by default, defaults to "plaintext"
; make sure the value exists in [formatter_options]
defaultformatter = "plaintext"

; (optional) set a syntax highlighting theme, as found in css/prettify/
; syntaxhighlightingtheme = "sons-of-obsidian"

; size limit per paste or comment in bytes, defaults to 2 Mibibytes
sizelimit = 2097152

; template to include, default is "bootstrap" (tpl/bootstrap.html)
template = "bootstrap"

; (optional) notice to display
; notice = "Note: This is a test service: Data may be deleted anytime. Kittens will die if you abuse this service."

; by default PrivateBin will guess the visitors language based on the browsers
; settings. Optionally you can enable the language selection menu, which uses
; a session cookie to store the choice until the browser is closed.
languageselection = false

; set the language your installs defaults to, defaults to English
; if this is set and language selection is disabled, this will be the only language
; languagedefault = "en"

; (optional) URL shortener address to offer after a new paste is created
; it is suggested to only use this with self-hosted shorteners as this will leak
; the pastes encryption key
; urlshortener = "https://shortener.example.com/api?link="

; (optional) IP based icons are a weak mechanism to detect if a comment was from
; a different user when the same username was used in a comment. It might be
; used to get the IP of a non anonymous comment poster if the server salt is
; leaked and a SHA256 HMAC rainbow table is generated for all (relevant) IPs.
; Can be set to one these values: none / vizhash / identicon (default).
; icon = none

; Content Security Policy headers allow a website to restrict what sources are
; allowed to be accessed in its context. You need to change this if you added
; custom scripts from third-party domains to your templates, e.g. tracking
; scripts or run your site behind certain DDoS-protection services.
; Check the documentation at https://content-security-policy.com/
; cspheader = "default-src 'none'; manifest-src 'self'; connect-src *; script-src 'self'; style-src 'self'; font-src 'self'; img-src 'self' data:; referrer no-referrer;"

; stay compatible with PrivateBin Alpha 0.19, less secure
; if enabled will use base64.js version 1.7 instead of 2.1.9 and sha1 instead of
; sha256 in HMAC for the deletion token
zerobincompatibility = false

[expire]
; expire value that is selected per default
; make sure the value exists in [expire_options]
default = "1day"

; optionally the "clone" button can be disabled on expiring pastes
; note that this only hides the button, copy & paste is still possible
; clone = false

[expire_options]
; Set each one of these to the number of seconds in the expiration period,
; or 0 if it should never expire
5min = 300
10min = 600
1hour = 3600
1day = 86400
1week = 604800

[formatter_options]
; Set available formatters, their order and their labels
markdown = "Markdown"
plaintext = "Plain Text"
syntaxhighlighting = "Source Code"

[traffic]
; time limit between calls from the same IP address in seconds
; Set this to 0 to disable rate limiting.
limit = 10

; (optional) if your website runs behind a reverse proxy or load balancer,
; set the HTTP header containing the visitors IP address, i.e. X_FORWARDED_FOR
; header = "X_FORWARDED_FOR"

; directory to store the traffic limits in
dir = PATH "data"

[purge]
; minimum time limit between two purgings of expired pastes, it is only
; triggered when pastes are created
; Set this to 0 to run a purge every time a paste is created.
limit = 300

; maximum amount of expired pastes to delete in one purge
; Set this to 0 to disable purging. Set it higher, if you are running a large
; site
batchsize = 10

; directory to store the purge limit in
dir = PATH "data"

[model]
; name of data model class to load and directory for storage
; the default model "Filesystem" stores everything in the filesystem
class = Filesystem
[model_options]
dir = PATH "data"

;[model]
; example of DB configuration for MySQL
;class = Database
;[model_options]
;dsn = "mysql:host=localhost;dbname=privatebin;charset=UTF8"
;tbl = "privatebin_"	; table prefix
;usr = "privatebin"
;pwd = "Z3r0P4ss"
;opt[12] = true	  ; PDO::ATTR_PERSISTENT

;[model]
; example of DB configuration for SQLite
;class = Database
;[model_options]
;dsn = "sqlite:" PATH "data/db.sq3"
;usr = null
;pwd = null
;opt[12] = true	; PDO::ATTR_PERSISTENT