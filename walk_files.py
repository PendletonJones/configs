#!/usr/bin/env python3
import os
import sys
import pprint

walk_path = os.getcwd()

# I can change this to a file path, and then pass it in with the npm command. 
# this file should really go into scripts. 
# file_path = os.path.realpath(walk_path)
# file_dirname = os.path.dirname(walk_path)

file_dirname = walk_path

print(file_dirname)

paths = [((dirpath + "/" + filename), filename)
    for dirpath, dirnames, filenames in os.walk(file_dirname)
        for filename in filenames]


just_paths = [path for path, filename in paths]

max_len = max([len(filename) for path, filename in paths])

common_base_path = os.path.commonpath(just_paths)

print(common_base_path)


unprefixed_paths = [(full_path.replace(common_base_path, "", 1), filename) for full_path, filename in paths]


with open('{file_dirname}/files.js'.format(file_dirname=file_dirname), 'w+') as f:

    for file_path, filename in unprefixed_paths:

        if filename == '.DS_Store':
            continue
        filename=filename.replace('.jsx', '').replace('.js', '')
        # print(file_path)
        file_path=file_path.replace('/src/', '').replace('.jsx', '').replace('.js', '').lstrip('/')
        # print(file_path)
        require_statment = "const {filename:<{width}} = require('{file_path}');\n".format(
                filename=filename,
                file_path=file_path,
                width=max_len
            )

        # print(require_statment)
        f.write(require_statment)



# create a webpack alias file.

_, alias_file_name = os.path.split(os.getcwd())
print(alias_file_name)
alias_path = '/Users/pendletonjones/Desktop/git_repos/work_repos_frontend/muster_front_end/muster_react/.webpack/dev/{alias_file_name}.js'

with open(alias_path.format(alias_file_name=alias_file_name), 'w+') as f:

    f.write('module.exports = {\n')

    for file_path, filename in unprefixed_paths:

        filename=filename.replace('.jsx', '').replace('.js', '')
        if filename == '.DS_Store':
            continue
        
        if filename == 'entry_point':
            continue

        if filename == 'files':
            continueli

        quoted_filename="'{filename}'".format(filename=filename)
        # print(file_path)
        file_path=file_path.replace('/src/', '').replace('.jsx', '').replace('.js', '').lstrip('/')
        # print(file_path)

        full_file_path = os.path.join(file_path, filename)

        require_statment = "\t{quoted_filename:<{width}}:  '{full_file_path}',\n".format(
                quoted_filename=quoted_filename,
                file_path=file_path,
                full_file_path=full_file_path,
                width=max_len
            )

        # print(require_statment)
        f.write(require_statment)

    f.write('}')
