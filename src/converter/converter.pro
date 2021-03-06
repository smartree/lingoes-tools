QT += core sql
QT -= gui

CONFIG += c++11

TARGET = converter
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

DEFINES += SQLITE_HAS_CODEC

macx : {
    DEFINES += SQLCIPHER_CRYPTO_CC
    LIBS += /System/Library/Frameworks/Security.framework/Versions/Current/Security \
            /System/Library/Frameworks/CoreFoundation.framework/Versions/Current/CoreFoundation
} else : {
    DEFINES += SQLCIPHER_CRYPTO_OPENSSL
    win32-msvc {
        DEFINES += _CRT_SECURE_NO_WARNINGS
    } else {
        LIBS += -lssl -lcrypto
    }
    LIBS += -lgdi32
}


SOURCES += main.cpp \
    lingoes.cpp \
    plaintextwriter.cpp \
    sqlitewriter.cpp \
    sqlite3.c \
    sqlcipherwriter.cpp

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    lingoes.h \
    plaintextwriter.h \
    sqlitewriter.h \
    sqlite3.h \
    sqlite3ext.h \
    sqlcipherwriter.h
