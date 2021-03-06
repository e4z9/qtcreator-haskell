DEFINES += HASKELL_LIBRARY

# Haskell files

SOURCES += \
    haskelleditorfactory.cpp \
    haskellplugin.cpp \
    haskellhighlighter.cpp \
    haskelltokenizer.cpp \
    haskellmanager.cpp \
    optionspage.cpp \
    haskellproject.cpp \
    haskellbuildconfiguration.cpp \
    stackbuildstep.cpp \
    haskellrunconfiguration.cpp

HEADERS += \
    haskell_global.h \
    haskellconstants.h \
    haskelleditorfactory.h \
    haskellplugin.h \
    haskellhighlighter.h \
    haskelltokenizer.h \
    haskellmanager.h \
    optionspage.h \
    haskellproject.h \
    haskellbuildconfiguration.h \
    stackbuildstep.h \
    haskellrunconfiguration.h

## uncomment to build plugin into user config directory
## <localappdata>/plugins/<ideversion>
##    where <localappdata> is e.g.
##    "%LOCALAPPDATA%\QtProject\qtcreator" on Windows Vista and later
##    "$XDG_DATA_HOME/data/QtProject/qtcreator" or "~/.local/share/data/QtProject/qtcreator" on Linux
##    "~/Library/Application Support/QtProject/Qt Creator" on OS X
#USE_USER_DESTDIR = yes

###### If the plugin can be depended upon by other plugins, this code needs to be outsourced to
###### <dirname>_dependencies.pri, where <dirname> is the name of the directory containing the
###### plugin's sources.

QTC_PLUGIN_NAME = Haskell
QTC_LIB_DEPENDS += \
    # nothing here at this time

QTC_PLUGIN_DEPENDS += \
    coreplugin \
    projectexplorer \
    texteditor

QTC_PLUGIN_RECOMMENDS += \
    # optional plugin dependencies. nothing here at this time

###### End _dependencies.pri contents ######

include(config.pri)
include($$IDE_SOURCE_TREE/src/qtcreatorplugin.pri)

RESOURCES += \
    haskell.qrc
