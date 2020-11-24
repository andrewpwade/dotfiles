#!/bin/bash
set -u

venv_path="$HOME/.virtualenvs/$(basename $PWD)"

[[ -d "${venv_path}" ]] || python3 -m venv "${venv_path}"

export VIRTUAL_ENV="${venv_path}"
export PATH="${venv_path}/bin:$PATH"
