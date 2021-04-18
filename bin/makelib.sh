outputfile=${1}
moduledir=$(dirname ${outputfile})
indexyaml=${moduledir/output/content}/index.yml
fullpages=$(yq r ${indexyaml} 'full_pages[*]')
module_basedir=$(dirname ${outputfile/output/content})
ASCIIDOC_COMMON_ARGS='-a skip-front-matter -a nofooter -a docinfo=shared -a docinfodir=templates/docinfo'

# exit handling
declare -a on_exit_items
function on_exit()
{
    for i in "${on_exit_items[@]}"
    do
        eval "${i}"
    done
}

function add_on_exit()
{
    local n=${#on_exit_items[*]}
    on_exit_items[$n]="$*"
    if [[ $n -eq 0 ]]; then
        trap on_exit EXIT
    fi
}

# ayml array
declare -a ayml_files

for mypage in ${fullpages}
do
  add_on_exit "rm -f ${module_basedir}/${mypage/.adoc/.ayml}"
  bin/frontmatter ${module_basedir}/${mypage} > ${module_basedir}/${mypage/.adoc/.ayml}
  ayml_files+=( "${module_basedir}/${mypage/.adoc/.ayml}" )
done

mkdir -p ${moduledir}
