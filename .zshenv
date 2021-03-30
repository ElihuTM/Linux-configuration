# Example aliases
alias vim=openVim
alias v=openVim
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias compiler="bash ~/linux-configuration/auto_compiler.sh"
alias vimconfig="nvim ~/.vimrc"
alias prueba='echo "this is a functional prueba"'

function openVim {
	if [ $# -eq 0  ]; then
		nvim ./
	else
		nvim $1
	fi
}
