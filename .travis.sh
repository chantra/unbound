#!/bin/bash

failed=0
MTDIR=../testcode/mini_tdir.sh

set -x

pushd testdata

${MTDIR} clean

if [ "x${WITH_DNSC}" != "x" ]
then
    for t in dnscrypt_cert.tdir dnscrypt_cert_chacha.tdir \
			 dnscrypt_queries.tdir dnscrypt_queries_chacha.tdir
    do
        t_name=${t%.tdir}
        ${MTDIR} exe "${t}"
        if [ ! -e .done-${t_name} ]
        then
            failed=1
        fi
    done
fi

exit ${failed}
