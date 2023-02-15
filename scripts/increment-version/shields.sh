#!/bin/sh

bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)

usage () {
    echo "${bold}Usage:${normal} $0 [-c <\
9cf|\
blue|\
blueviolet|\
brightgreen|\
critical|\
ff69b4|\
green|\
important|\
inactive|\
informational|\
lightgrey|\
orange|\
red|\
success|\
yellow|\
yellowgreen\
>] [-f file] [-h] [-i <major|minor|patch>] [-p pattern_prefix] [-u pattern_suffix_url]"
}

file="README.md"
increment_type="patch"
pattern_prefix="\[!\[version\](https:\/\/img.shields.io\/badge\/version-v"

# Change these values to your targets.
# You can also configure these at use.
# This example uses this repository's README.
# You must escape (\) special characters like [] and / for sed to parse it.
pattern_suffix_color="blue"
pattern_suffix_url="https:\/\/github.com\/mjburtenshaw\/eng-dev"

help () {
    echo "${bold}increment-version-shields${normal}"
    echo ""
    echo "increment-version-shields modifies a shields version link."
    echo ""
    echo "It expects the following:"
    echo "    - A markdown ${bold}file${normal} to work in."
    echo "    - The ${bold}file${normal} to have a shields version link."
    echo "    - The shields version link to be wrapped inside a link."
    echo "    - To increment the ${bold}patch${normal} version unless specified by the ${bold}-i${normal} option."
    echo ""
    usage
    echo ""
    echo "${bold}Options${normal}"
    echo ""
    echo "    ${bold}-c pattern_suffix_color${normal}    Use a specified pattern_suffix_color."
    echo "                                   You should define a default value for your own use."
    echo ""
    echo "    ${bold}-f file${normal}                    Use a custom file."
    echo "                                   The default is ${bold}$file${normal}."
    echo ""
    echo "    ${bold}-h${normal}                         Show help."
    echo ""
    echo "    ${bold}-i increment${normal}               Increment a specified version element."
    echo "                                   Valid options are ${bold}major${normal}, ${bold}minor${normal}, and ${bold}patch${normal}."
    echo "                                   The default is ${bold}$increment_type${normal}."
    echo ""
    echo "    ${bold}-p pattern_prefix${normal}          Use a specified pattern_prefix."
    echo "                                   The default is ${bold}$pattern_prefix${normal}."
    echo ""
    echo "    ${bold}-u pattern_suffix_url${normal}      Use a specified pattern_suffix_url."
    echo "                                   You should define a default value for your own use."
    echo ""
    echo "${bold}Arguments:${normal} None."
    echo ""
    echo "${bold}See Also: [Shields.io Version Chips](https://shields.io/category/version)${normal}"
}

while getopts "c:f:hi:p:u:" option; do
    case "${option}" in
        c)
            pattern_suffix_color=$OPTARG
            ;;
        f)
            file=$OPTARG
            ;;
        h)
            help
            exit
            ;;
        i)
            increment_type=$OPTARG
            ;;
        p)
            pattern_prefix=$OPTARG
            ;;
        u)
            pattern_suffix_url=$OPTARG
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

# Validate configuration.
if ! [ $increment_type = "major" ] && ! [ $increment_type = "minor" ] && ! [ $increment_type = "patch" ]; then
    echo "Invalid value for ${bold}-i${normal} option: ${bold}${red}$increment_type${normal}"
    usage
    exit 1
fi

# Extracts the current version from the file using a specified pattern_prefix.
get_current_version () {
    local version_entry=$(grep --line-number "$pattern_prefix" $file)
    version_line_number=${version_entry:0:1}
    current_version=$(sed -n -e "s/^.*$pattern_prefix//p" $file)

    # Strip the suffix from the current_version
    current_version=${current_version%%-*}
}

# Extracts the major, minor, and patch elements of the current version.
get_current_version_elements () {
    current_major_version=${current_version%%.*}
    current_patch_version=${current_version##*.}

    # Strip the major & patch elements and surrounding periods to get the minor element.
    current_minor_version=${current_version%%"$current_patch_version"}
    current_minor_version=${current_minor_version##"$current_major_version"}
    local end=$(( ${#current_minor_version} - 2 ))
    current_minor_version=${current_minor_version:1:end}
}

increment_major_version () {
    local new_major_version=$(( $current_major_version + 1 ))
    new_version="$new_major_version.0.0"
}

increment_minor_version () {
    local new_minor_version=$(( $current_minor_version + 1 ))
    new_version="$current_major_version.$new_minor_version.0"
}

increment_patch_version () {
    local new_patch_version=$(( $current_patch_version + 1 ))
    new_version="$current_major_version.$current_minor_version.$new_patch_version"
}

get_current_version
get_current_version_elements

if [ $increment_type = "major" ]; then
    increment_major_version
elif [ $increment_type = "minor" ]; then
    increment_minor_version
else
    increment_patch_version
fi

# Update the file with the new version.
changed_line="$pattern_prefix$new_version-$pattern_suffix_color)]($pattern_suffix_url)"
sed -i "" "${version_line_number}s/.*/$changed_line/" $file

echo $new_version
