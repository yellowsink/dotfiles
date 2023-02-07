{ config, pkgs, ... }:

{
	# Home Manager needs a bit of information about you and the
	# paths it should manage.
	home.username = "cain";
	home.homeDirectory = "/home/cain";

	# This value determines the Home Manager release that your
	# configuration is compatible with. This helps avoid breakage
	# when a new Home Manager release introduces backwards
	# incompatible changes.
	#
	# You can update Home Manager without changing this value. See
	# the Home Manager release notes for a list of state version
	# changes in each release.
	home.stateVersion = "22.11";

	# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;

	# Useful because I do not, in fact, use NixOS
	targets.genericLinux.enable = true;

	# Environment vars
	home.sessionVariables = {
		EDITOR = "micro";
		PATH = "$PATH:$HOME/.emacs.d/bin:$HOME/.dotnet/tools:$HOME/.local/bin:$HOME/.cargo/bin";
		MICRO_TRUECOLOR = 1;
	};

	# Install my packages
	home.packages = with pkgs; [
		bun
		rustup
		nodePackages.http-server
		nodePackages.pnpm
		nodePackages.prettier
		nodePackages.typescript
		nodePackages.web-ext
		nodePackages.wrangler
	];

	# Config my shell
	programs.zsh = {
		enable = true;

		shellAliases = {
			chz = "chezmoi";
			che = "chz edit";
			chd = "chz cd";
			cha = "chz add";
			chy = "chz apply -v";
			chu = "chz update -v";
			ls = "exa --icons --colour-scale";
			lsl = "ls -lh --git";
			gitc = "git commit -am";
			gitp = "git push";
			gitr = "git reset --hard HEAD";
			gita = "git add .";
			gitca = "git commit -a --amend --no-edit";
			gitac = "gita && gitc";

			bsd3 = "cp ~/.bsd3 LICENSE.md";
		};

		initExtra = ''
			gitd() { git diff $@ | delta --line-numbers --side-by-side }
			mkz() { mkdir -p $1; z $1 }
			setopt beep extendedglob notify

			eval "$(zoxide init zsh)"
			
			eval "$(direnv hook zsh)"
			
			# gh docs said to do this #
			export GPG_TTY=$(tty)

			# fix my keybinds for home, end, etc #
			source "$HOME/.zshinput"

			# p10k #
			# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
			[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
			(( ! ''${+functions[p10k]} )) || p10k finalize
		'';

		initExtraFirst = ''
			if [ $TERM != "tmux-256color" ]; then
							tmux && exit
			fi
		
			# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
			# Initialization code that may require console input (password prompts, [y/n]
			# confirmations, etc.) must go above this block; everything else may go below.
			if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
				source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
			fi
		'';

		history = {
			size = 1000;
			path = "$HOME/.histfile";
		};

		autocd = true;
		defaultKeymap = "emacs";

		zplug = {
			enable = true;
			plugins = [
				{ name = "zsh-users/zsh-autosuggestions"; }
				{ name = "zsh-users/zsh-syntax-highlighting"; }
				{ name = "zsh-users/zsh-completions"; }
				{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
				{ name = "joshskidmore/zsh-fzf-history-search"; }
			];
		};
	};

	programs.tmux = {
		enable = true;
		terminal = "tmux-256color";
		historyLimit = 100000;
		shortcut = "Space";
		baseIndex = 1;

		plugins = with pkgs; [
			{ plugin = tmuxPlugins.tmux-colors-solarized; }
			{ plugin = tmuxPlugins.extrakto; }
			{
				plugin = tmuxPlugins.better-mouse-mode; 
				extraConfig = ''
					set -g @emulate-scroll-for-no-mouse-alternate-buffer 'on'
				'';
			}
		];

		extraConfig = ''
			set-option -ga terminal-overrides ",xterm-256color:Tc"
			set -as terminal-features ",gnome*:RGB"

			unbind r
			bind r source-file ~/.tmux.conf \; display "Reloaded ~/.tmux.conf"

			set -g mouse on

			#### vertical and horizontal pane splits
			# v and h are not binded by default, but just in case ;)
			unbind v
			unbind h
			# default binds
			unbind % # Split vertically
			unbind '"' # Split horizontally
			# new binds
			bind v split-window -h -c "#{pane_current_path}"
			bind h split-window -v -c "#{pane_current_path}"

			#### windows
			unbind n  #DEFAULT KEY: Move to next window
			unbind w  #DEFAULT KEY: change current window interactively

			bind n command-prompt "rename-window '%%'"
			bind w new-window -c "#{pane_current_path}"

		'';
	};
}
