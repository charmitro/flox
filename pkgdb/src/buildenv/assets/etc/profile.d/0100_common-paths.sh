# ============================================================================ #
#
# Setup common paths.
#
# ---------------------------------------------------------------------------- #

PATH="$FLOX_ENV/bin:$FLOX_ENV/sbin${PATH:+:$PATH}"
FPATH="$FLOX_ENV/share/zsh/vendor-completions${FPATH:+:$FPATH}"
FPATH="$FLOX_ENV/share/zsh/site-functions:$FPATH"
INFOPATH="$FLOX_ENV/share/info${INFOPATH:+:$INFOPATH}"
CPATH="$FLOX_ENV/include${CPATH:+:$CPATH}"
LIBRARY_PATH="$FLOX_ENV/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
PKG_CONFIG_PATH="$FLOX_ENV/share/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
PKG_CONFIG_PATH="$FLOX_ENV/lib/pkgconfig:$PKG_CONFIG_PATH"
ACLOCAL_PATH="$FLOX_ENV/share/aclocal${ACLOCAL_PATH:+:$ACLOCAL_PATH}"
XDG_DATA_DIRS="$FLOX_ENV/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"

export \
  PATH \
  FPATH \
  INFOPATH \
  CPATH \
  LIBRARY_PATH \
  PKG_CONFIG_PATH \
  ACLOCAL_PATH \
  XDG_DATA_DIRS \
  ;

# ---------------------------------------------------------------------------- #

# Set the man(1) search path.
# The search path for manual pages is determined
# from the MANPATH environment variable in a non-standard way:
#
# 1) If MANPATH begins with a colon, it is appended to the default list;
# 2) if it ends with a colon, it is prepended to the default list;
# 3) or if it contains two adjacent colons,
#    the standard search path is inserted between the colons.
# 4) If none of these conditions are met, it overrides the standard search path.
#
# In order for man(1) to find manual pages not definded in the flox environment,
# we ensure that we prepend the flox search path _with_ a colon in all cases.
#
# Thus, the man pages defined in the flox environment are searched first,
# and default search paths still apply.
# Additionally, decisions made by the user by setting the MANPATH variable
# are not overridden by the flox environment:
# - If MANPATH starts with `:` we now have `::` -> rule 1/3,
#   the defaults are inserted in between,
#   i.e. in front of MANPATH, but FLOXENV will take precedence in any case
# - If MANPATH ends with `:` we end with `:` -> rule 2,
#   the defaults are appended (no change)
# - If MANPATH does not start or end with `:`, -> rule 4,
#   FLOX_ENV:MANPATH replaces the defaults (no change)
MANPATH="$FLOX_ENV/share/man:${MANPATH:+$MANPATH}"
export MANPATH

# ---------------------------------------------------------------------------- #


if [ -z "${FLOX_NOSET_LD_LIBRARY_PATH:-}" ]; then
  LD_LIBRARY_PATH="$FLOX_ENV/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export LD_LIBRARY_PATH
fi

# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #