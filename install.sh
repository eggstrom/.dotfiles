#!/usr/bin/env bash

cd "$(dirname $0)"

echo -n 'How would you like to install the configuration files?
 1) Copy the files
 2) Create symlinks to the files
Your choice [1/2]: '
read install_method

until [[ "$install_method" = '1' || "$install_method" = '2' ]]; do
	echo -n 'Invalid input, please try again [1/2]: '
	read install_method
done

files=$(find . -type f ! -path '*/.git/*' ! -name 'README.md' ! -name 'install.sh' | cut -d/ -f2- | sort)

for file in ${files[@]}; do
	[[ -f "$HOME/$file" ]] && overwritten_files+=("$HOME/$file")
done

if [[ ${#overwritten_files[@]} > 0 ]]; then
	echo 'If you proceed with the installation, the following files will be overwritten:'
	for file in ${overwritten_files[@]}; do
		echo " - $HOME/$file"
	done
	echo -n 'Would you still like to proceed? [Y/N]: '
	read confirmation
else
	confirmation='Y'
fi

if [[ "$confirmation" = 'Y' || "$confirmation" = 'y' ]]; then
	if [[ "$install_method" = '1' ]]; then
		echo 'Copying files...'
		for file in ${files[@]}; do
			echo "$PWD/$file to $HOME/$file"
		done
		echo 'The files have been copied, you can delete this directory.'
	else
		echo 'Creating symlinks to files...'
		for file in ${files[@]}; do
			echo "$HOME/$file -> $PWD/$file"
		done
		echo 'The symlinks have been created. The configuration will stop working if you delete this directory.'
	fi

else
	echo 'The installation has been aborted.'
fi
