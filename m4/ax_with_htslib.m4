HTSDIR="htslib"

ax_cv_htslib=yes
HTSLIB_CPPFLAGS="-I$HTSDIR"
HTSLIB_LDFLAGS="-L$HTSDIR"
 
AC_CHECK_HEADER([htslib/sam.h],
    [AC_CHECK_LIB(hts, hts_version, [ax_cv_htslib=yes], [ax_cv_htslib=no])],
    [ax_cv_htslib=no], [;])
ax_saved_CPPFLAGS=$CPPFLAGS
ax_saved_LDFLAGS=$LDFLAGS
HTSLIB_CPPFLAGS="-I$HTSDIR/include"
HTSLIB_LDFLAGS="-L$HTSDIR/lib"
CPPFLAGS="$CPPFLAGS $HTSLIB_CPPFLAGS"
LDFLAGS="$LDFLAGS $HTSLIB_LDFLAGS"

AC_CONFIG_SUBDIRS($HTSDIR)

AC_CHECK_HEADER([htslib/sam.h],
    [AC_CHECK_LIB(hts, hts_version, [ax_cv_htslib=yes], [ax_cv_htslib=no])],
    [ax_cv_htslib=no], [;])
  
AC_SUBST([HTSDIR])
AC_SUBST([HTSLIB_CPPFLAGS])
AC_SUBST([HTSLIB_LDFLAGS])
