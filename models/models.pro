TARGET = model
TEMPLATE = lib
CONFIG += shared c++11 x86_64
QT += sql xml
QT -= gui
greaterThan(QT_MAJOR_VERSION, 4): QT += qml
DEFINES += TF_DLL
DESTDIR = ../lib
INCLUDEPATH += ../helpers sqlobjects mongoobjects
DEPENDPATH  += ../helpers sqlobjects mongoobjects
LIBS += -L../lib -lhelper
MOC_DIR = .obj/
OBJECTS_DIR = .obj/

include(../appbase.pri)
HEADERS += sqlobjects/customerinfoobject.h
HEADERS += customerinfo.h
SOURCES += customerinfo.cpp
HEADERS += sqlobjects/deviceinfoobject.h
HEADERS += deviceinfo.h
SOURCES += deviceinfo.cpp
HEADERS += sqlobjects/logininfoobject.h
HEADERS += logininfo.h
SOURCES += logininfo.cpp
HEADERS += sqlobjects/relationshipobject.h
HEADERS += relationship.h
SOURCES += relationship.cpp
HEADERS += sqlobjects/serviceinfoobject.h
HEADERS += serviceinfo.h
SOURCES += serviceinfo.cpp
HEADERS += sqlobjects/venderinfoobject.h
HEADERS += venderinfo.h
SOURCES += venderinfo.cpp
