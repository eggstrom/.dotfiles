" Settings
set trash         " Enable trash
set nofollowlinks " Automatically resolve symbolic links
set syscalls      " Have Vifm perform its own operations (Enables showing progress)
set ignorecase    " Disable case sensitivity
set smartcase     " Enable case sensitivity when using caps
set dotdirs=      " Disable .. if directory is not empty
set nowrap        " Disable wrapping

" List of things to remember
set vifminfo=dhistory,savedirs,chistory,state,tui,shistory,
            \phistory,fhistory,dirstack,registers,bookmarks,bmarks

" Default programs
let &vicmd = $EDITOR

" :com[mand][!] command_name action
"
" These are some of the macros that can be used in the action part:
"  %a for user arguments
"  %c for current file under the cursor
"  %C for current file under the cursor of inactive pane
"  %f for selected file(s)
"  %F for selected file(s) of inactive pane
"  %b is the same as %f %F
"  %d for current directory name
"  %D for current directory name of inactive pane
"  %r{x} for list of files in register {x}
"  %m runs the command in a menu window
"  %u uses command's output to build a file list
"  see `:help vifm-macros` and `:help vifm-filename-modifiers` for more

" Default commands
com! df df -h %m 1> /dev/null
com! diff vim -d %f %F
com! run !! ./%f
com! make !!make %a
com! mkcd :mkdir %a | cd %a
com! vgrep vim "+grep %a"
com! reload :write | restart full

" Commands for archiving
"com! tar 
"com! untar 
"com! gzip 
"com! ungzip 
com! zip zip -r %c.zip %f
com! unzip unzip -d %a %c 

" Commands for setting background
com! bgcenter   feh --bg-center --force-aliasing %c
com! bgfill     feh --bg-fill   --force-aliasing %c
com! bgmax      feh --bg-max    --force-aliasing %c
com! bgscale    feh --bg-scale  --force-aliasing %c
com! bgtile     feh --bg-tile   --force-aliasing %c
com! bgcenteraa feh --bg-center %c
com! bgfillaa   feh --bg-fill   %c
com! bgmaxaa    feh --bg-max    %c
com! bgscaleaa  feh --bg-scale  %c
com! bgtileaa   feh --bg-tile   %c

" Bookmarks
mark r /
mark h ~/
mark D ~/Downloads
mark d ~/Documents
mark p ~/Pictures
mark m ~/Music
mark v ~/Videos
mark c ~/.config
mark M /run/media

" Status line
set statusline=' %A %u:%g %T%= %d '
set timefmt='%a %b %d/%m/%Y %H:%M:%S'

" Colors
highlight Win ctermbg=none
highlight TopLine ctermfg=white ctermbg=none
highlight TopLineSel ctermfg=default ctermbg=none
highlight Border ctermfg=white ctermbg=none
highlight CmdLine ctermbg=None

" This is how many directories to store in the directory history.
set history=100

" Natural sort of (version) numbers within text.
set sortnumbers

" Maximum number of changes that can be undone.
set undolevels=100

" Use Vim's format of help file (has highlighting and "hyperlinks").
" If you would rather use a plain text help file set novimhelp.
set vimhelp

" If you would like to run an executable file when you
" press Enter, l or Right Arrow, set this.
set norunexec

" Show list of matches on tab completion in command-line mode
set wildmenu

" Display completions in a form of popup with descriptions of the matches
set wildstyle=popup

" Display suggestions in normal, visual and view modes for keys, marks and
" registers (at most 5 files).  In other view, when available.
set suggestoptions=normal,visual,view,otherpane,keys,marks,registers

" Don't highlight search results automatically
set nohlsearch

" Use increment searching (search while typing)
set incsearch

" Try to leave some space from cursor to upper/lower border in lists
set scrolloff=4

" Don't do too many requests to slow file systems
if !has('win')
    set slowfs=curlftpfs
endif


" ------------------------------------------------------------------------------
" File types association
" ------------------------------------------------------------------------------

" :filetype pattern1,pattern2 defaultprogram,program2
" :fileviewer pattern1,pattern2 consoleviewer
"
" The first entry is the default program to be used with a matching file.
" The other programs for the file type can be accessed via :file command.
" The command macros like %f, %F, %d, %D may be used in the commands.
" The %a macro is ignored.  To use a % you must put %%.
" Spaces in an app name must be escaped, for example: QuickTime\ Player.app

" For automated FUSE mounts, you must register an extension with :file[x]type
" in one of the following formats:
"
" :filetype patterns FUSE_MOUNT|mount_cmd %SOURCE_FILE %DESTINATION_DIR
"
" %SOURCE_FILE and %DESTINATION_DIR are filled in at runtime.
"
" Example:
"   :filetype *.zip,*.[jwe]ar FUSE_MOUNT|fuse-zip %SOURCE_FILE %DESTINATION_DIR
"
" :filetype patterns FUSE_MOUNT2|mount_cmd %PARAM %DESTINATION_DIR
"
" %PARAM and %DESTINATION_DIR are filled in at runtime.
"
" Example:
"   :filetype *.ssh FUSE_MOUNT2|sshfs %PARAM %DESTINATION_DIR
"
" %PARAM value is the first line of the matched file, example: root@127.0.0.1:/
"
" You can also add %CLEAR if you want to clear screen before running FUSE
" program.  There is also %FOREGROUND, which is useful for entering passwords.

" Directories
fileviewer {*/,.*/} tree -aC %c

" Images
fileviewer <image/*> wezterm imgcat --width %pw --height %ph %f
filetype <image/*> feh %f &

" Videos
fileviewer {*.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
           \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
           \*.as[fx],*.unknown_video},
          \<video/*>
         \ ffprobe -hide_banner -pretty %c 2>&1
filetype <video/*> mpv %f

" PDFs
fileviewer {*.pdf},<application/pdf> pdftotext -nopgbrk %c -
filetype {*.pdf},<application/pdf> firefox %c

" Audio
filetype {*.wav,*.mp3,*.flac,*.m4a,*.wma,*.ape,*.ac3,*.og[agx],*.spx,*.opus,
         \*.aac,*.mpga},
        \<audio/*>
       \ {Play using MPlayer}
       \ mplayer %f,
       \ {Play using mpv}
       \ mpv --no-video %f %s,
       \ {Play using ffplay}
       \ ffplay -nodisp -hide_banner -autoexit %c,
fileviewer {*.wav,*.mp3,*.flac,*.m4a,*.wma,*.ape,*.ac3,*.og[agx],*.spx,*.opus,
           \*.aac,*.mpga},
          \<audio/*>
         \ ffprobe -hide_banner -pretty %c 2>&1

" Torrent
filetype {*.torrent},<application/x-bittorrent> ktorrent %f &
fileviewer {*.torrent},<application/x-bittorrent>
         \ dumptorrent -v %c,
         \ transmission-show %c

" FuseZipMount
filetype {*.zip,*.jar,*.war,*.ear,*.oxt,*.apkg},
        \<application/zip,application/java-archive>
       \ {Mount with fuse-zip}
       \ FUSE_MOUNT|fuse-zip %SOURCE_FILE %DESTINATION_DIR,
       \ {View contents}
       \ unzip -l %f | less,
       \ {Extract here}
       \ unzip %c,
fileviewer *.zip,*.jar,*.war,*.ear,*.oxt unzip -l %f

" ArchiveMount
filetype {*.tar,*.tar.bz2,*.tbz2,*.tgz,*.tar.gz,*.tar.xz,*.txz,*.tar.zst,
         \*.tzst},
        \<application/x-tar>
       \ {Mount with archivemount}
       \ FUSE_MOUNT|archivemount %SOURCE_FILE %DESTINATION_DIR,
fileviewer *.tgz,*.tar.gz tar -tzf %c
fileviewer *.tar.bz2,*.tbz2 tar -tjf %c
fileviewer *.tar.xz,*.txz tar -tJf %c
fileviewer *.tar.zst,*.tzst tar -t --zstd -f %c
fileviewer {*.tar},<application/x-tar> tar -tf %c

" Rar2FsMount and rar archives
filetype {*.rar},<application/x-rar>
       \ {Mount with rar2fs}
       \ FUSE_MOUNT|rar2fs %SOURCE_FILE %DESTINATION_DIR,
fileviewer {*.rar},<application/x-rar> unrar v %c

" Fuse7z and 7z archives
filetype {*.7z},<application/x-7z-compressed>
       \ {Mount with fuse-7z}
       \ FUSE_MOUNT|fuse-7z %SOURCE_FILE %DESTINATION_DIR,
fileviewer {*.7z},<application/x-7z-compressed> 7z l %c

" Other
fileviewer * highlight -O ansi %c

" Syntax highlighting in preview
"
" Explicitly set highlight type for some extensions
"
" 256-color terminal
" fileviewer *.[ch],*.[ch]pp highlight -O xterm256 -s dante --syntax c %c
" fileviewer Makefile,Makefile.* highlight -O xterm256 -s dante --syntax make %c
"
" 16-color terminal
" fileviewer *.c,*.h highlight -O ansi -s dante %c
"
" Or leave it for automatic detection
" fileviewer *[^/] pygmentize -O style=monokai -f console256 -g

" Open all other files with default system programs (you can also remove all
" :file[x]type commands above to ensure they don't interfere with system-wide
" settings).  By default all unknown files are opened with 'vi[x]cmd'
" uncommenting one of lines below will result in ignoring 'vi[x]cmd' option
" for unknown file types.
" For *nix:
" filetype * xdg-open
" For OS X:
" filetype * open
" For Windows:
" filetype * explorer %"f &

" ------------------------------------------------------------------------------
" Panel configuration examples
" ------------------------------------------------------------------------------

" Customize view columns a bit (enable ellipsis for truncated file names)
" set viewcolumns=-{name}..,6{}.

" Show vertical border
" set fillchars=vborder:│

" Filter-out build and temporary files
" filter! {*.lo,*.o,*.d,*.class,*.pyc,*.pyo,.*~}

" ------------------------------------------------------------------------------
" Sample keyboard mappings
" ------------------------------------------------------------------------------

" Start shell in current directory
nnoremap s :shell<cr>

" Display sorting dialog
nnoremap S :sort<cr>

" Toggle visibility of preview window
nnoremap w :view<cr>
vnoremap w :view<cr>gv

if $DISPLAY && executable('gvim')
    " Open file in existing instance of gvim
    nnoremap o :!gvim --remote-tab-silent %f<cr>
    " Open file in new instance of gvim
    nnoremap O :!gvim %f<cr>
endif

" Open file in the background using its default program
nnoremap gb :file &<cr>l

" Interaction with system clipboard
if has('win')
    " Yank current directory path to Windows clipboard with forward slashes
    nnoremap yp :!echo %"d:gs!\!/! %i | clip<cr>
    " Yank path to current file to Windows clipboard with forward slashes
    nnoremap yf :!echo %"c:gs!\!/! %i | clip<cr>
elseif $WAYLAND_DISPLAY
    if executable('wl-copy')
        " Yank current directory path into primary and selection clipboards
        nnoremap yd :!echo -n %d | wl-copy %i &&
                    \ echo -n %d | wl-copy -p %i<cr>
        " Yank current file path into into primary and selection clipboards
        nnoremap yf :!echo -n %c:p | wl-copy %i &&
                    \ echo -n %c:p | wl-copy -p %i<cr>
    endif
elseif $DISPLAY
    if executable('xclip')
        " Yank current directory path into the clipboard
        nnoremap yd :!echo %d | xclip %i<cr>
        " Yank current file path into the clipboard
        nnoremap yf :!echo %c:p | xclip %i<cr>
    elseif executable('xsel')
        " Yank current directory path into primary and selection clipboards
        nnoremap yd :!echo -n %d | xsel --input --primary %i &&
                    \ echo -n %d | xsel --clipboard --input %i<cr>
        " Yank current file path into into primary and selection clipboards
        nnoremap yf :!echo -n %c:p | xsel --input --primary %i &&
                    \ echo -n %c:p | xsel --clipboard --input %i<cr>
    endif
endif

" Mappings for faster renaming
nnoremap I cw<c-a>
nnoremap cc cw<c-u>
nnoremap A cw

" As above, but without the file extension
" nnoremap I cW<c-a>
" nnoremap cc cW<c-u>
" nnoremap A cW

" Open console in current directory
if $DISPLAY && executable('xterm')
    nnoremap ,t :!xterm &<cr>
elseif $TERMINAL
    nnoremap ,t :!$TERMINAL &<cr>
endif

" Open editor to edit vifmrc and apply settings after returning to vifm
nnoremap ,c :write | edit $MYVIFMRC | restart full<cr>

" Open gvim to edit vifmrc
if $DISPLAY && executable('gvim')
    nnoremap ,C :!gvim --remote-tab-silent $MYVIFMRC &<cr>
endif

" Toggle wrap setting on ,w key
nnoremap ,w :set wrap!<cr>

" Example of standard two-panel file managers mappings
nnoremap <f3> :!less %f<cr>
nnoremap <f4> :edit<cr>
nnoremap <f5> :copy<cr>
nnoremap <f6> :move<cr>
nnoremap <f7> :mkdir<space>
nnoremap <f8> :delete<cr>

" Midnight commander alike mappings
" Open current directory in the other pane
nnoremap <a-i> :sync<cr>
" Open directory under cursor in the other pane
nnoremap <a-o> :sync %c<cr>
" Swap panes
nnoremap <c-u> <c-w>x

" ------------------------------------------------------------------------------
" Various customization examples
" ------------------------------------------------------------------------------

" Use ag (the silver searcher) instead of grep
" set grepprg='ag --line-numbers %i %a %s'

" Add additional place to look for executables
" let $PATH = $HOME.'/bin/fuse:'.$PATH

" Block particular shortcut
" nnoremap <left> <nop>

" Export IPC name of current instance as environment variable and use it to
" communicate with the instance later.
"
" It can be used in some shell script that gets run from inside vifm, for
" example, like this:
"     vifm --server-name "$VIFM_SERVER_NAME" --remote +"cd '$PWD'"
"
" let $VIFM_SERVER_NAME = v:servername

" Filetypes/directories
set classify=' :dir:/, :exe:, :reg:, :link:,? :?:, ::../::'

" Specific files
set classify+=' ::.Xdefaults,,.Xresources,,.bashprofile,,.bash_profile,,.bashrc,,.dmrc,,.d_store,,.fasd,,.gitconfig,,.gitignore,,.jack-settings,,.mime.types,,.nvidia-settings-rc,,.pam_environment,,.profile,,.recently-used,,.selected_editor,,.xinitpurc,,.zprofile,,.yarnc,,.snclirc,,.tmux.conf,,.urlview,,.config,,.ini,,.user-dirs.dirs,,.mimeapps.list,,.offlineimaprc,,.msmtprc,,.Xauthority,,config::'
set classify+=' ::dropbox::'
set classify+=' ::favicon.*,,README,,readme::'
set classify+=' ::.vim,,.vimrc,,.gvimrc,,.vifm::'
set classify+=' ::gruntfile.coffee,,gruntfile.js,,gruntfile.ls::'
set classify+=' ::gulpfile.coffee,,gulpfile.js,,gulpfile.ls::'
set classify+=' ::ledger::'
set classify+=' ::license,,copyright,,copying,,LICENSE,,COPYRIGHT,,COPYING::'
set classify+=' ::node_modules::'
set classify+=' ::react.jsx::'

" File extensions
set classify+='λ ::*.ml,,*.mli::'
set classify+=' ::*.styl::'
set classify+=' ::*.scss::'
set classify+=' ::*.py,,*.pyc,,*.pyd,,*.pyo::'
set classify+=' ::*.php::'
set classify+=' ::*.markdown,,*.md::'
set classify+=' ::*.json::'
set classify+=' ::*.js::'
set classify+=' ::*.bmp,,*.gif,,*.ico,,*.jpeg,,*.jpg,,*.png,,*.svg,,*.svgz,,*.tga,,*.tiff,,*.xmb,,*.xcf,,*.xpm,,*.xspf,,*.xwd,,*.cr2,,*.dng,,*.3fr,,*.ari,,*.arw,,*.bay,,*.crw,,*.cr3,,*.cap,,*.data,,*.dcs,,*.dcr,,*.drf,,*.eip,,*.erf,,*.fff,,*.gpr,,*.iiq,,*.k25,,*.kdc,,*.mdc,,*.mef,,*.mos,,*.mrw,,*.obm,,*.orf,,*.pef,,*.ptx,,*.pxn,,*.r3d,,*.raf,,*.raw,,*.rwl,,*.rw2,,*.rwz,,*.sr2,,*.srf,,*.srw,,*.tif,,*.x3f,,*.webp,,*.avif,,*.jxl::'
set classify+=' ::*.ejs,,*.htm,,*.html,,*.slim,,*.xml::'
set classify+=' ::*.mustasche::'
set classify+=' ::*.css,,*.less,,*.bat,,*.conf,,*.ini,,*.rc,,*.yml,,*.cfg::'
set classify+=' ::*.rss::'
set classify+=' ::*.coffee::'
set classify+=' ::*.twig::'
set classify+=' ::*.c++,,*.cpp,,*.cxx,,*.h::'
set classify+=' ::*.cc,,*.c::'
set classify+=' ::*.hs,,*.lhs::'
set classify+=' ::*.lua::'
set classify+=' ::*.jl::'
set classify+=' ::*.go::'
set classify+=' ::*.ts::'
set classify+=' ::*.db,,*.dump,,*.sql::'
set classify+=' ::*.sln,,*.suo::'
set classify+=' ::*.exe::'
set classify+=' ::*.diff,,*.sum,,*.md5,,*.sha512::'
set classify+=' ::*.scala::'
set classify+=' ::*.java,,*.jar::'
set classify+=' ::*.xul::'
set classify+=' ::*.clj,,*.cljc::'
set classify+=' ::*.pl,,*.pm,,*.t::'
set classify+=' ::*.cljs,,*.edn::'
set classify+=' ::*.rb::'
set classify+=' ::*.fish,,*.sh,,*.bash::'
set classify+=' ::*.dart::'
set classify+=' ::*.f#,,*.fs,,*.fsi,,*.fsscript,,*.fsx::'
set classify+=' ::*.rlib,,*.rs::'
set classify+=' ::*.d::'
set classify+=' ::*.erl,,*.hrl::'
set classify+=' ::*.ai::'
set classify+=' ::*.psb,,*.psd::'
set classify+=' ::*.jsx::'
set classify+=' ::*.aac,,*.anx,,*.asf,,*.au,,*.axa,,*.flac,,*.m2a,,*.m4a,,*.mid,,*.midi,,*.mp3,,*.mpc,,*.oga,,*.ogg,,*.ogx,,*.ra,,*.ram,,*.rm,,*.spx,,*.wav,,*.wma,,*.ac3::'
set classify+=' ::*.avi,,*.flv,,*.mkv,,*.mov,,*.mp4,,*.mpeg,,*.mpg,,*.webm,,*.av1::'
set classify+=' ::*.epub,,*.pdf,,*.fb2,,*.djvu::'
set classify+=' ::*.7z,,*.apk,,*.bz2,,*.cab,,*.cpio,,*.deb,,*.gem,,*.gz,,*.gzip,,*.lh,,*.lzh,,*.lzma,,*.rar,,*.rpm,,*.tar,,*.tgz,,*.xz,,*.zip,,*.zst::'
set classify+=' ::*.cbr,,*.cbz::'
set classify+=' ::*.log::'
set classify+=' ::*.doc,,*.docx,,*.adoc::'
set classify+=' ::*.xls,,*.xlsmx::'
set classify+=' ::*.pptx,,*.ppt::'
