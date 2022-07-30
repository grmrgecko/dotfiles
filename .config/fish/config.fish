if command -vq flatpak
    set -ga fish_user_paths ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin
    set -gx --path XDG_DATA_DIRS /usr/local/share/ /usr/share/ ~/.local/share/flatpak/exports/share
    for install_dir in (flatpak --installations)
        set -gxa XDG_DATA_DIRS $install_dir/exports/share
    end
end

egrep "^export " ~/.bash_profile | while read e
	set var (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\1/")
	set value (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\2/")

	# remove surrounding quotes if existing
	set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

	if test $var = "PATH"
		# replace ":" by spaces. this is how PATH looks for Fish
		set value (echo $value | sed -E "s/:/ /g")

		# use eval because we need to expand the value
		eval set -xg $var $value

		continue
	end

	# evaluate variables. we can use eval because we most likely just used "$var"
	set value (eval echo $value)

	#echo "set -xg '$var' '$value' (via '$e')"
	set -xg $var $value
end

if status --is-interactive
    neofetch
end

set -U fish_user_paths /usr/local/ubin ~/bin ~/go/bin ~/anaconda3/bin $fish_user_paths
