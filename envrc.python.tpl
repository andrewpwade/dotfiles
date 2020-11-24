#!/bin/bash
set -u

venv_path="$HOME/.virtualenvs/$(basename $PWD)"

if [[ ! -d "${venv_path}" ]]; then
    python3 -m venv "${venv_path}"
    "${venv_path}/bin/pip" install -U pip wheel
fi

export VIRTUAL_ENV="${venv_path}"
export PATH="${venv_path}/bin:$PATH"
