function install::userland_tools {
    log::info "Installing userland tools";

	# Just put all sorts of commands one by one here.

	# Install bashbox
	curl --proto '=https' --tlsv1.2 -sSfL "https://git.io/Jc9bH" | bash -s selfinstall >/dev/null 2>&1 & disown;

	# Install tools with nix
	USER="$(id -u -n)" && export USER;
	if test ! -e /nix; then {
		log::info "Installing nix";
		curl -sL https://nixos.org/nix/install | bash -s -- --no-daemon >/dev/null 2>&1;
	} fi
	source "$HOME/.nix-profile/etc/profile.d/nix.sh" || source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh;

	local pkgs=(
		nixpkgs.hollywood
		nixpkgs.shellcheck
		# nixpkgs.rsync
		nixpkgs.tree
		nixpkgs.file
		nixpkgs.fzf
		# nixpkgs.bash
		nixpkgs.bat
		nixpkgs.bottom
		# nixpkgs.coreutils
		nixpkgs.exa
		# nixpkgs.ffmpeg
		# nixpkgs.fish
		nixpkgs.fzf
		# nixpkgs.gawk
		# nixpkgs.gh
		# nixpkgs.htop
		# nixpkgs.iftop
		# nixpkgs.jq
		nixpkgs.neofetch
		# nixpkgs.neovim
		# nixpkgs.p7zip
		# nixpkgs.ranger
		# nixpkgs.reattach-to-user-namespace
		nixpkgs.ripgrep
		nixpkgs.shellcheck
		# nixpkgs.tmux
		nixpkgs.tree
		# nixpkgs.yq
		nixpkgs.zoxide
		# nixpkgs.zsh
	)
	nix-env -iA "${pkgs[@]}" >/dev/null 2>&1;
}
