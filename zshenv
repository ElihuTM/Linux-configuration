alias vim=openVim
alias v=openVim

alias zshconfig="nvim ~/.zshrc"
alias zshenv="nvim ~/.zshenv"
alias vimconfig="nvim ~/.vimrc"

alias compiler="bash ~/linux-configuration/auto_compiler.sh"

function openVim {
	if [ $# -eq 0  ]; then
		nvim ./
	else
		nvim $1
	fi
}
