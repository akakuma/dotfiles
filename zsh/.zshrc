# -----------------------------
# autoload
# -----------------------------
# 色を使用出来るようにする
autoload -Uz colors && colors

# zsh-completions の設定。コマンド補完機能
autoload -Uz compinit && compinit -u

# -----------------------------
# setopt
# -----------------------------
# cd なしでもディレクトリ移動
setopt auto_cd

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

# コマンドのスペルミスを訂正する
setopt correct

# 8bit文字を有効にする
setopt print_eight_bit

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd

# 同時に起動した zsh の間でヒストリーを共有する
setopt share_history

# 直前と同じコマンドの場合はヒストリーに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリーに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリーに残さない
setopt hist_ignore_space

# ヒストリーに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# cd した先のディレクトリをディレクトリスタックに追加する
# ※ディレクトリスタック: 今までに行ったディレクトリのヒストリーのこと
setopt auto_pushd

# ディレクトリスタックに追加した時、ディレクトリがすでに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# ex) 特定ディレクトリにある.txt以外のファイルを探すとき
# ls test/^*.txt
setopt extended_glob

# PROMPT変数内で変数参照する
setopt prompt_subst

# -----------------------------
# zstyle
# -----------------------------
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# [TAB] でパス名の補完候補を表示したあと、
# 続けて [TAB] を押すと候補からパス名を選択できるようになる
# 候補を選ぶには [TAB] か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

#補完でカラーを使用する
zstyle ':completion:*' list-colors "${LS_COLORS}"

# -----------------------------
# other
# -----------------------------
# PROMPT
# %F{color_code}と%fで囲んだ箇所に色が付与される
PROMPT='%F{cyan}%n%f:%~ %# '

# RPROMPTにgitのブランチ名を表示する
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '[%b]'
precmd () { vcs_info }
RPROMPT='%F{green}${vcs_info_msg_0_}%f'

# 履歴を保存するように、履歴数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# emacs
bindkey -d
bindkey -e

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものにしている
# ex) Ctrl-W でカーソル前の1単語を削除したとき / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# エディタをvimに設定
export EDITOR=vim

# -----------------------------
# user setting
# -----------------------------
