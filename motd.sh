#!/bin/bash

set -ex

printf '%0.1s' "-"{1..64}
printf '\n'

BC_FILE="/etc/vagrant_box_build_date"
if [ -e ${BCFILE} ]
then
    # yup, it's a boxcutter
    BC_DATE=$(date -f ${BC_FILE} -I)
    BUILT_MSG=$(printf 'built %s' "${BC_DATE}")
fi

MOTD_FILE=/etc/motd
BANNER_WIDTH=64
PLATFORM_RELEASE=$(lsb_release -sd)
PLATFORM_MSG=$(printf '%s' "$PLATFORM_RELEASE")
ENV_VERSION=$(printf 'Anchor %s' $(git rev-parse --short HEAD))
ENV_BUILT=$(printf 'built %s' $(date -I))
printf '%2s%-30s%30s\n' " " "${PLATFORM_MSG}" "${BUILT_MSG}"
printf '%2s%-30s%30s\n' " " "${ENV_VERSION}" "${ENV_BUILT}"
printf '%0.1s' "-"{1..64}
printf '\n'
