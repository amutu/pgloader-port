--- pgloader_wrapper.sh.orig	2017-06-15 08:44:13 UTC
+++ pgloader_wrapper.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# There is a bug for current ccl on FreeBSD, which is  determine_executable_name
+# doesn't do the job for FreeBSD. Now we use this script as a workaround. See:
+# https://github.com/Clozure/ccl/issues/38
+
+BIN_DIR="$(cd $(/usr/bin/dirname $0);pwd)"
+exec "${BIN_DIR}"/pgloader3 "${@}"
