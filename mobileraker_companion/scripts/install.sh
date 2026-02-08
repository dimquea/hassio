#!/bin/sh

REPO_DIR=$(readlink -f "$(dirname "$0")")
ENV_DIR="${HOME}/mobileraker-env"

#
# Now make sure the virtual env exists, is updated, and all of our currently required PY packages are updated.
#

# ensure the virtual environment is created.
mkdir -p "${ENV_DIR}"
virtualenv -p /usr/bin/python3 --system-site-packages "${ENV_DIR}"

# Update pip if needed
"${ENV_DIR}"/bin/python -m pip install --upgrade pip

# Set the cache directory based on the OS
CACHE_DIR="${ENV_DIR}/cache"

# Finally, ensure our plugin requirements are installed and updated.
TMPDIR="${CACHE_DIR}" "${ENV_DIR}"/bin/pip3 install -q -r "${REPO_DIR}"/mobileraker-requirements.txt

# Before launching our PY script, set any vars it needs to know
# Pass all of the command line args, so they can be handled by the PY script.
# Note that USER can be empty string on some systems when running as root. This is fixed in the PY installer.
USERNAME=${USER}
USER_HOME=${HOME}
CMD_LINE_ARGS="$@"

# ToDo Adjust passed args to match the needs of mobileraker
PY_LAUNCH_JSON="{\"REPO_DIR\":\"${REPO_DIR}\",\"ENV_DIR\":\"${ENV_DIR}\",\"USERNAME\":\"${USERNAME}\",\"USER_HOME\":\"${USER_HOME}\",\"CMD_LINE_ARGS\":\"${CMD_LINE_ARGS}\"}"

# Now launch into our py setup script, that does everything else required.
# Since we use a module for file includes, we need to set the path to the root of the module
# so python will find it.
export PYTHONPATH="${REPO_DIR}"

cd "${REPO_DIR}" > /dev/null || exit 1

"${ENV_DIR}/bin/python3" -B -m installer "$PY_LAUNCH_JSON"
