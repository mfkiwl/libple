dnl Copyright (C) 2004-2010 EDF
dnl
dnl This file is part of the PLE software package.  For license
dnl information, see the COPYING file in the top level directory of the
dnl PLE source distribution.


# PLE_AC_CONFIG_PUBL_INIT([OUPUT FILE NAME])
#-------------------------------------------
# Initialize file

AC_DEFUN([PLE_AC_CONFIG_PUBL_INIT],[

# First arg is output file name
if test "$1" = "" ; then
  ple_ac_config_publ_h="config_publ.h"
else
  ple_ac_config_publ_h=$1
fi
ple_ac_lower='abcdefghijklmnopqrstuvwxyz.'
ple_ac_upper='ABCDEFGHIJKLMNOPQRSTUVWXYZ_'
ple_ac_config_publ_upname=`echo $ple_ac_config_publ_h | sed y/$ple_ac_lower/$ple_ac_upper/`
unset ple_ac_lower
unset ple_ac_upper
echo "#ifndef __"${ple_ac_config_publ_upname}"__" >  "$ple_ac_config_publ_h"-tmp
echo "#define __"${ple_ac_config_publ_upname}"__" >> "$ple_ac_config_publ_h"-tmp
echo >> "$ple_ac_config_publ_h"-tmp
echo "/* $ple_ac_config_publ_h. Generated by configure */" >> "$ple_ac_config_publ_h"-tmp
echo >> "$ple_ac_config_publ_h"-tmp

AC_MSG_NOTICE([initializing $ple_ac_config_publ_h])
])dnl


# PLE_AC_CONFIG_PUBL_FINALIZE
#----------------------------
# Finalize file

AC_DEFUN([PLE_AC_CONFIG_PUBL_FINALIZE],[

AC_REQUIRE([PLE_AC_CONFIG_PUBL_INIT])dnl

echo "#endif /* __"${ple_ac_config_publ_upname}"__ */" >>  "$ple_ac_config_publ_h"-tmp

AC_MSG_NOTICE([closing $ple_ac_config_publ_h])

diff $ple_ac_config_publ_h $ple_ac_config_publ_h-tmp  > /dev/null 2>&1
if test $? -eq 0 ; then
  AC_MSG_NOTICE([$ple_ac_config_publ_h  is unchanged])
  rm -f $ple_ac_config_publ_h-tmp
else
  mv $ple_ac_config_publ_h-tmp $ple_ac_config_publ_h
fi

unset ple_ac_config_publ_h
unset ple_ac_config_publ_upname

])dnl


# PLE_AC_CONFIG_PUBL_VERBATIM([VERBATIM TEXT])
#---------------------------------------------
# Add text to config file

AC_DEFUN([PLE_AC_CONFIG_PUBL_VERBATIM],[

AC_REQUIRE([PLE_AC_CONFIG_PUBL_INIT])dnl

echo "$1" >> "$ple_ac_config_publ_h"-tmp
echo ""   >> "$ple_ac_config_publ_h"-tmp

])dnl


# PLE_AC_CONFIG_PUBL_DEFINE(VARIABLE NAME, VALUE, [COMMENT])
#-----------------------------------------------------------
# Define variable

AC_DEFUN([PLE_AC_CONFIG_PUBL_DEFINE],[

AC_REQUIRE([PLE_AC_CONFIG_PUBL_INIT])dnl

unset ple_ac_lower
unset ple_ac_upper
if test "$3" != "" ; then
  echo "/* $3 */" >> "$ple_ac_config_publ_h"-tmp
fi
echo "#define $1 $2" >> "$ple_ac_config_publ_h"-tmp
echo >> "$ple_ac_config_publ_h"-tmp

])dnl


# PLE_AC_CONFIG_PUBL_DEFINE_STRING(VARIABLE NAME, VALUE, [COMMENT])
#------------------------------------------------------------------
# Define string variable

AC_DEFUN([PLE_AC_CONFIG_PUBL_DEFINE_STRING],[

AC_REQUIRE([PLE_AC_CONFIG_PUBL_INIT])dnl

unset ple_ac_lower
unset ple_ac_upper
if test "$3" != "" ; then
  echo "/* $3 */" >> "$ple_ac_config_publ_h"-tmp
fi
echo '#define $1 "$2"' >> "$ple_ac_config_publ_h"-tmp
echo >> "$ple_ac_config_publ_h"-tmp

])dnl


# PLE_AC_CONFIG_PUBL_SET(VARIABLE NAME, YES OR NO, [COMMENT])
#------------------------------------------------------------
# Set variable (define to 1 if second arg is yes, undefine if no )

AC_DEFUN([PLE_AC_CONFIG_PUBL_SET],[

# First arg is variable name, second arg is value, optional third arg is comment

AC_REQUIRE([PLE_AC_CONFIG_PUBL_INIT])dnl

unset ple_ac_lower
unset ple_ac_upper
if test "$3" != "" ; then
  echo "/* $3 */" >> "$ple_ac_config_publ_h"-tmp
fi
if test "$2" = "yes" ; then
  echo "#define $1 1" >> "$ple_ac_config_publ_h"-tmp
else
  echo "#undef $1" >> "$ple_ac_config_publ_h"-tmp
fi
echo >> "$ple_ac_config_publ_h"-tmp

])dnl

