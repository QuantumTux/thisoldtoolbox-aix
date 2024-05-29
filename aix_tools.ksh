#!/usr/bin/ksh93
#######################################################################
# aix_tools.ksh - KSH Code Library for Tools
#######################################################################
# This is a collection of KSH code functions for use in other tools.
#   It provides a standard library of functions.
#
# PROVIDES:
#   _init_script_tool_names ()
#     Parameters: None
#     Global Variables: Populates a wide variety of global variable
#                       names for various executable tools called by
#                       supported scripts
#     Returns: Nothing
#     IMPORTANT: This  *MUST*  be called before any of the _get_*
#                functions will work!
#   _get_os_release ()
#     Parameters: None
#     Global Variables: None
#     Returns: 0=File Parse Error;Otherwise, the Release number
#              AIX 7.1 would return 7
#  _get_os_update ()
#     Parameters: Single-digit positive integer indicating OS Release
#     Global Variables: None
#     Returns: 128=Invalid Parameter; Otherwise, the Update number
#              AIX 7.1 would return 1
#  _get_os_tech_level ()
#     Parameters: None
#     Global Variables: None
#     Returns: 128=Invalid Parameter; Otherwise, the Tech Level number
#              AIX 7100-05-XX-XXXX would return 05
#  _get_os_support_pack ()
#     Parameters: None
#     Global Variables: None
#     Returns: 128=Invalid Parameter; Otherwise, the Support Pack number
#              AIX 7100-03-05-XXXX would return 05
#  _title ()
#     Parameters: Single-word string
#     Global Variables: None
#     Returns: 0
#
# REQUIRES:
#  Designed to be sourced by other KSH tools - not intended
#    for stand-alone use (no output to screen or files)
#
AIX_TOOLS_LIBRARY_VERSION='1.00'
#######################################################################
# Change Log (Reverse Chronological Order)
# Who When______ What__________________________________________________
# dxb 2018-05-24 Initial creation
#######################################################################
# The 'which' command is the same place for AIX as it was for RHEL
#   Also note that the IBM-provided "which" does NOT support --skip-alias
WHICH_TOOL='/usr/bin/which'

# File names/paths used within this library
_FSTAB_FILE='/etc/filesystems'

#######################################################################
# Function: _init_script_tool_names                                   #
# Parameters: None                                                    #
# Local Variables: None                                               #
# Global Variables: See function for list                             #
# Purpose: Sets Global Variables for names of OS-provided             #
#     programs/tools that are used by various other                   #
#     internally-developed tool                                       #
#     The variable names are common across all tools                  #
# Returns: Nothing                                                    #
# NOTE: This function  *MUST*  be called before any of the            #
#       _get_* functions may be used                                  #
#######################################################################
_init_script_tool_names ()
{
  # NOTE: I append "2>&1" when calling "which" to suppress any
  #   error messages when a particular executable is
  #   not found (e.g. ps2pdf, enscript)

  # SPECIAL CASES
  # I need certain tools because we make different initialization
  #   choices below in some cases
  UNAME_TOOL=$( ${WHICH_TOOL} uname 2>&1 )

  # A
  AIX_CONF_TOOL=$( ${WHICH_TOOL} getconf 2>&1 )
  AWK_TOOL=$( ${WHICH_TOOL} awk 2>&1 )

  # B

  # C
  CAT_TOOL=$( ${WHICH_TOOL} cat 2>&1 )
  CALC_TOOL=$( ${WHICH_TOOL} bc 2>&1 )
  CALENDAR_TOOL=$( ${WHICH_TOOL} cal 2>&1 )
  CD_TOOL=$( ${WHICH_TOOL} cd 2>&1 )
  CFG_TOOL=$( ${WHICH_TOOL} ifconfig 2>&1 )
  CHGRP_TOOL=$( ${WHICH_TOOL} chgrp 2>&1 )
  CHMODE_TOOL=$( ${WHICH_TOOL} chmod 2>&1 )
  CHOWN_TOOL=$( ${WHICH_TOOL} chown 2>&1 )
  CP_TOOL=$( ${WHICH_TOOL} cp 2>&1 )
  CUT_TOOL=$( ${WHICH_TOOL} cut 2>&1 )

  # D
  DATE_TOOL=$( ${WHICH_TOOL} date 2>&1 )
  DD_TOOL=$( ${WHICH_TOOL} dd 2>&1 )
  DF_TOOL=$( ${WHICH_TOOL} df 2>&1 )
  DNS_TOOL=$( ${WHICH_TOOL} host 2>&1 )

  # E
  EGREP_TOOL=$( ${WHICH_TOOL} egrep 2>&1 )
  ENT_TOOL=$( ${WHICH_TOOL} entstat 2>&1 )
  # F
  FUSER_TOOL=$( ${WHICH_TOOL} fuser 2>&1 )

  # G
  GREP_TOOL=$( ${WHICH_TOOL} grep 2>&1 )

  # H
  HEAD_TOOL=$( ${WHICH_TOOL} head 2>&1 )
  HOSTNAME_TOOL=$( ${WHICH_TOOL} hostname 2>&1 )

  # I
  ID_TOOL=$( ${WHICH_TOOL} id 2>&1 )

  # J
  # K

  # L
  LAST_TOOL=$( ${WHICH_TOOL} last 2>&1 )
  LOGGER_TOOL=$( ${WHICH_TOOL} logger 2>&1 )
  LS_ATTR_TOOL=$( ${WHICH_TOOL} lsattr 2>&1 )
  LS_CFG_TOOL=$( ${WHICH_TOOL} lscfg 2>&1 )
  LS_DEV_TOOL=$( ${WHICH_TOOL} lsdev 2>&1 )
  LS_TOOL=$( ${WHICH_TOOL} ls 2>&1 )
  LVS_TOOL=$( ${WHICH_TOOL} lslv 2>&1 )

  # M
  MAIL_TOOL=$( ${WHICH_TOOL} sendmail 2>&1 )
  MAIL_TOOL_CLIENT=$( ${WHICH_TOOL} mail 2>&1 )
  MKDIR_TOOL=$( ${WHICH_TOOL} mkdir 2>&1 )
  MKTCPIP_TOOL=$( ${WHICH_TOOL} mktcpip 2>&1 )
  MOUNT_TOOL=$( ${WHICH_TOOL} mount 2>&1 )
  MV_TOOL=$( ${WHICH_TOOL} mv 2>&1 )

  # N
  NAWK_TOOL=$( ${WHICH_TOOL} nawk 2>&1 )
  NETSTAT_TOOL=$( ${WHICH_TOOL} netstat 2>&1 )

  # O
  OS_TOOL=$( ${WHICH_TOOL} oslevel 2>&1 )

  # P
  PING_TOOL=$( ${WHICH_TOOL} ping 2>&1 )
  PKG_TOOL=$( ${WHICH_TOOL} rpm 2>&1 )
  PS_TOOL=$( ${WHICH_TOOL} ps 2>&1 )
  PVS_TOOL=$( ${WHICH_TOOL} lspv 2>&1 )

  # Q

  # R
  RM_TOOL=$( ${WHICH_TOOL} rm 2>&1 )
  RMSOCK_TOOL=$( ${WHICH_TOOL} rmsock 2>&1 )

  # S
  SCP_TOOL=$( ${WHICH_TOOL} scp 2>&1 )
  SED_TOOL=$( ${WHICH_TOOL} sed 2>&1 )
  SLEEP_TOOL=$( ${WHICH_TOOL} sleep 2>&1 )
  SORT_TOOL=$( ${WHICH_TOOL} sort 2>&1 )
  SSH_TOOL=$( ${WHICH_TOOL} ssh 2>&1 )
  STRINGS_TOOL=$( ${WHICH_TOOL} strings 2>&1 )
  SYS_CONF_TOOL=$( ${WHICH_TOOL} prtconf 2>&1 )

  # T
  TAIL_TOOL=$( ${WHICH_TOOL} tail 2>&1 )
  TOUCH_TOOL=$( ${WHICH_TOOL} touch 2>&1 )
  TPUT_TOOL=$( ${WHICH_TOOL} tput 2>&1 )
  TR_TOOL=$( ${WHICH_TOOL} tr 2>&1 )

  # U
  # UNAME_TOOL is a special case above
  UNLINK_TOOL=$( ${WHICH_TOOL} unlink 2>&1 )

  # V
  # VGS depends on OS
  VGS_TOOL=$( ${WHICH_TOOL} lsvg 2>&1 )

  # W
  WC_TOOL=$( ${WHICH_TOOL} wc 2>&1 )
  WGET_TOOL=$( ${WHICH_TOOL} wget 2>&1 )
  WGET_TOOL="${WGET_TOOL} -q -O"
  WHO_TOOL=$( ${WHICH_TOOL} who 2>&1 )
  # X
  # Y
  # Z
}

#######################################################################
# Function: _init_script_variables                                    #
# Parameters: None                                                    #
# Local Variables: None                                               #
# Global Variables: See function for list                             #
# Purpose: Sets Global Variables that allow Korn shell scripts to     #
#           emulate some BASH built-in variables (for example, EUID)  #
#   The variable names are common across all tools                    #
# Notes: IMPORTANT! The _init_script_tool_names function  *MUST*      #
#       be invoked prior to invoking this function                    #
# Returns: Nothing                                                    #
#######################################################################
_init_script_variables ()
{
  # Numeric UID variables
  EUID=$( ${ID_TOOL} -u )
  UID=$( ${ID_TOOL} -ru )

  _HOSTS_FILE='/etc/hosts'
}

#######################################################################
# Function: _init_script_colors                                       #
# Parameters: None                                                    #
# Local Variables: None                                               #
# Global Variables: See function for list                             #
# Purpose: Sets Global Variables for ASCII colors used by various     #
#     other internally-developed tools                                #
#     The variable names are common across all tools                  #
# Returns: Nothing                                                    #
#######################################################################
_init_script_colors ()
{
  INVERT_TEXT='\033[7m'
  EOL='\033[0K'
  EOL='\033[0K'
  UNDERLINE_TEXT='\033[4m'

  SCREEN_HOME='\033[0;0H'

  # Colors for text output
  GREEN_BLACK='\033[32;40m'
  YELLOW_BLACK='\033[33;40m'
  RED_BLACK='\033[31;40m'
  BLUE_BLACK='\033[34;40m'
  WHITE_BLACK='\033[37;40m'
  CYAN_RED='\033[36;41m'
  MAGENTA_BLACK='\033[35;40m'
  BOLD_TEXT='\033[1m'
  BLINK_ON='\033[5m'
  ALL_OFF='\033[0m'
}

#########################
# Function Declarations #
#########################

#######################################################################
# Function: _get_os_release                                           #
# Security: No privilege required                                     #
# Parameters: None                                                    #
# Local Variables: _CHKSTR - Working string variable                  #
# Global Variables: None                                              #
# Purpose: Uses "oslevel" to get the AIX Major version                #
#          AIX 7.1 would return 7                                     #
# Returns: 0 - Unable to determine                                    #
#          Any other return value should be the Release number        #
#######################################################################
_get_os_release ()
{
  # Parse the AIX Release number from "oslevel" output
  _CHKSTR=$( ${OS_TOOL} | ${AWK_TOOL} -F '.' '{ print $1 }' )
  case ${_CHKSTR} in
    *[!0-9]*|"")  return 0 ;;
    *)            return ${_CHKSTR} ;;
  esac
}

#######################################################################
# Function: _get_os_update                                            #
# Security: No privilege required                                     #
# Parameters: None                                                    #
# Local Variables: _CHKSTR - Working string variable                  #
# Global Variables: None                                              #
# Purpose: Uses "oslevel" to get the Update level of the installed    #
#           AIX version                                               #
#            AIX 7.1 would return 1                                   #
# Returns: 255 - Unable to determine                                  #
#		Any other return value should be the Update number            #
#######################################################################
_get_os_update ()
{
  # Parse the Update of the AIX Release number from "oslevel" output
  _CHKSTR=$( ${OS_TOOL} | ${AWK_TOOL} -F '.' '{ print $2 }' )
  case ${_CHKSTR} in
    *[!0-9]*|"")  return 255 ;;
    *)            return ${_CHKSTR} ;;
  esac
}

#######################################################################
# Function: _get_os_tech_level                                        #
# Security: No privilege required                                     #
# Parameters: None                                                    #
# Local Variables: _CHKSTR - Working string variable                  #
# Global Variables: None                                              #
# Purpose: Uses "oslevel" to get the Technology Level of the          #
#         installed AIX	version; AIX 7100-05-XX-XXXX would return 05  #
# Returns: 255 - Unable to determine                                  #
#   Any other return value should be the Tech Level number, which     #
#   will generally be a zero-left-paddeed two-digit value             #
#######################################################################
_get_os_tech_level ()
{
  # Parse the Technology Level of the AIX version number from
  #   "oslevel" output
  _CHKSTR=$( ${OS_TOOL} -s | ${AWK_TOOL} -F '-' '{ print $2 }' )
  case ${_CHKSTR} in
    *[!0-9]*|"")  return 255 ;;
    *)            return ${_CHKSTR} ;;
  esac
}

#######################################################################
# Function: _get_os_support_pack                                      #
# Security: No privilege required                                     #
# Parameters: None                                                    #
# Local Variables: _CHKSTR - Working string variable                  #
# Global Variables: None                                              #
# Purpose: Uses "oslevel" to get the Support Pack of the installed    #
#         AIX version; AIX 7100-03-05-XXXX would return 05            #
# Returns: 255 - Unable to determine                                  #
#        Any other return value should be the Support Pack number,    #
#        which will generally be a zero-left-paddeed two-digit value  #
#######################################################################
_get_os_support_pack ()
{
  # Parse the Support Pack number of the AIX version from "oslevel" output
  _CHKSTR=$( ${OS_TOOL} -s | ${AWK_TOOL} -F '-' '{ print $3 }' )
  case ${_CHKSTR} in
    *[!0-9]*|"")  return 255 ;;
    *)            return ${_CHKSTR} ;;
  esac
}

#######################################################################
# Function: _title                                                    #
# Parameters: Single word string                                      #
# Local Variables: _WIDTH - Width of screen in columns as reported    #
#                   by tput                                           #
#   _TITLE_BAR - Holds the text of the title bar that will have       #
#     a variant length based on screen width                          #
#   _TITLE_BAR_CHAR - The character used to compose the title bar     #
#   __iterator - Local looping counter                                #
# Global Variables: None                                              #
# Purpose: The parameter is printed in the center of a line, with     #
#           a solid line of asterisk characters printed above and     #
#           below                                                     #
# Returns: 0 (no error checking)                                      #
#######################################################################
_title ()
{
  _WIDTH=$( ${TPUT_TOOL} cols )
  _TITLE_BAR=''
  _TITLE_BAR_CHAR='*'
  for (( __iterator=1 ; __iterator < ${_WIDTH} ; __iterator++ )); do
    _TITLE_BAR="${_TITLE_BAR}${_TITLE_BAR_CHAR}"
  done
  print "\n${_TITLE_BAR}"
  print "${1}" | ${AWK_TOOL} -v mywidth=${_WIDTH} '{spaces = ""
    for (i = 1; i < (mywidth - length($0)) / 2; i ++)
    spaces = spaces " "
    print spaces $0 }'
  print "${_TITLE_BAR}"
}

# Blank for future use
#######################################################################
# Function:                                                           #
# Parameters: None (uses Global Variables instead)                    #
# Local Variables:                                                    #
# Global Variables:                                                   #
# Purpose:                                                            #
# Returns:                                                            #
#######################################################################

#######################
# End of aix_tools.sh #
#######################
