set -x EDITOR vim

set fisher_path $__fish_config_dir/plugins
set fish_function_path $fisher_path/functions $fish_function_path
set fish_complete_path $fisher_path/completions $fish_complete_path
for source in $fisher_path/conf.d/*.fish
  source $source
end

alias ll='ls -lh'
alias la='ls -Alh'
