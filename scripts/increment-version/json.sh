#!/bin/sh

bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)

usage () {
    echo "${bold}Usage:${normal} $0 [-f file] [-h] [-i <major|minor|patch>] [-p pattern]"
}

file="package.json"
increment_type="patch"
pattern='"version": '

help () {
    echo "${bold}increment-version-json${normal}"
    echo ""
    echo "increment-version-json modifies the version attrbute of a JSON file."
    echo ""
    echo "It expects the following:"
    echo "    - A JSON ${bold}file${normal} to work in."
    echo "    - The ${bold}file${normal} to have a top-level key called ${bold}version${normal}."
    echo "    - The ${bold}version${normal} to have the ${bold}major.minor.patch${normal} convention."
    echo "    - To increment the ${bold}patch${normal} version unless specified by the ${bold}-i${normal} option."
    echo ""
    usage
    echo ""
    echo "${bold}Options${normal}"
    echo ""
    echo "    ${bold}-f file${normal}         Use a custom file."
    echo "                        The default is ${bold}$file${normal}."
    echo ""
    echo "    ${bold}-h${normal}              Show help."
    echo ""
    echo "    ${bold}-i increment${normal}    Increment a specified version element."
    echo "                        Valid options are ${bold}major${normal}, ${bold}minor${normal}, and ${bold}patch${normal}."
    echo "                        The default is ${bold}$increment_type${normal}."
    echo ""
    echo "    ${bold}-p pattern${normal}      Use a specified pattern."
    echo "                        The default is ${bold}$pattern${normal}."
    echo ""
    echo "${bold}Arguments:${normal} None."
    echo ""
    echo "${bold}Author: Malcolm Burtenshaw${normal}"
    echo ""
}

while getopts "f:hi:p:" option; do
    case "${option}" in
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
            pattern=$OPTARG
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

# Extracts the current version from the file using a specified pattern.
get_current_version () {
    local version_entry=$(grep --line-number "$pattern" $file)
    version_line_number=${version_entry:0:1}
    current_version=$(sed -n -e "s/^.*$pattern//p" $file)

    # Strip quotes and trailing comma from current_version.
    local end=$(( ${#current_version} - 3 ))
    current_version=${current_version:1:end}
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
changed_line="  $pattern\"$new_version\","
sed -i "" "${version_line_number}s/.*/$changed_line/" $file

echo $new_version
