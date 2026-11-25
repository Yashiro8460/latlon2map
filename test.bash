#!/bin/bash -xv
# SPDX-FileCopyrightText: 2026 Takumi Yashiro
# SPDX-License-Identifier: BSD-3-Clause

ng (){
    echo ${1}行目が違いますよ。
    res=1
}

res=0

out=$(echo 35.6812 139.7671 | ./latlon2map)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "https://www.google.com/maps?q=35.6812,139.7671" ] || ng "$LINENO"

out=$(echo あ い| ./latlon2map)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo  | ./latlon2map)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 35.6812 | ./latlon2map)
[ "$?" = 1 ]       || ng "$LINENO"
[ "${out}" = "" ]  || ng "$LINENO"

out=$(echo 35.6812 139.7671 999 | ./latlon2map)
[ "$?" = 1 ]       || ng "$LINENO"
[ "${out}" = "" ]  || ng "$LINENO"

out=$(echo 100 139.7671 | ./latlon2map)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 35.6812 200 | ./latlon2map)
[ "$?" = 1 ]       || ng "$LINENO"
[ "${out}" = "" ]  || ng "$LINENO"

[ "$res" = 0 ] && echo OK

exit $res
