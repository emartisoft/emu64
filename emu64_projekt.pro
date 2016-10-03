# Emu64 by Thorsten Kattanek

# Versionsnummer ermitteln aus Git Tag Nummer
GIT_VERSION = $$system(git --git-dir \"$$PWD/.git\" describe --always --tags)
DEFINES += str_emu64_version=\\\"$$GIT_VERSION\\\"

TRANSLATIONS = emu64_de.ts
TRANSLATIONS = emu64_en.ts

QT += core gui
#CONFIG += rtti
#CONFIG += console

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app

SOURCES += \
    main.cpp \
    info_window.cpp \
    main_window.cpp \
    siddump.cpp \
    c64_class.cpp \
    mos6569_class.cpp \
    mos6581_8085_class.cpp \
    mmu_class.cpp \
    mos6510_class.cpp \
    mos6526_class.cpp \
    mos6526_port.cpp \
    videopal_class.cpp \
    tv_setup_window.cpp \
    floppy_window.cpp \
    c64_keyboard_window.cpp \
    crt_class.cpp \
    am29f040_class.cpp \
    crt_window.cpp \
    widget_file_browse.cpp \
    tree_widget_mod.cpp \
    debugger_window.cpp \
    widget_sr_edit.cpp \
    label_widget_mod.cpp \
    mos6522_class.cpp \
    mos6502_class.cpp \
    floppy1541_class.cpp \
    widget_floppy_status.cpp \
    d64_class.cpp \
    memory_window.cpp \
    widget_memory_zeile.cpp \
    widget_bit_leiste.cpp \
    setup_window.cpp \
    debugger_vic_window.cpp \
    single_application.cpp \
    button_mod.cpp \
    custom_splashscreen.cpp \
    c64_speed_window.cpp \
    reu_class.cpp \
    georam_class.cpp \
    debugger_iec_window.cpp \
    vcd_class.cpp \
    floppy_new_d64_window.cpp \
    tape1530_class.cpp \
    tape_window.cpp \
    widget_tape_counter.cpp \
    tape_new_window.cpp

HEADERS  += \
    info_window.h \
    main_window.h \
    mos6581_8085_wellenformen.h \
    mos6581_8085_calc.h \
    siddump.h \
    mos6581_8085_voice.h \
    c64_class.h \
    mos6569_class.h \
    structs.h \
    mos6581_8085_class.h \
    mmu_class.h \
    mos6510_class.h \
    micro_code_tbl_6510.h \
    micro_code_string_tbl_6510.h \
    mos6526_class.h \
    mos6526_port.h \
    c64_colors.h \
    videopal_class.h \
    tv_setup_window.h \
    floppy_window.h \
    c64_keys.h \
    c64_keyboard_window.h \
    crt_class.h \
    am29f040_class.h \
    crt_window.h \
    widget_file_browse.h \
    tree_widget_mod.h \
    debugger_window.h \
    widget_sr_edit.h \
    label_widget_mod.h \
    mos6522_class.h \
    mos6502_class.h \
    micro_code_tbl_6502.h \
    micro_code_string_tbl_6502.h \
    floppy1541_class.h \
    widget_floppy_status.h \
    d64_class.h \
    cpu_info.h \
    memory_window.h \
    widget_memory_zeile.h \
    widget_bit_leiste.h \
    setup_window.h \
    debugger_vic_window.h \
    single_application.h \
    button_mod.h \
    custom_splashscreen.h \
    c64_speed_window.h \
    firmware/usbconfig.h \
    reu_class.h \
    georam_class.h \
    debugger_iec_window.h \
    vcd_class.h \
    mk7pla.h \
    floppy_new_d64_window.h \
    tape1530_class.h \
    tape_window.h \
    widget_tape_counter.h \
    tape_new_window.h

FORMS    += \
    info_window.ui \
    main_window.ui \
    widgedaudiovisuell.ui \
    tv_setup_window.ui \
    floppy_window.ui \
    c64_keyboard_window.ui \
    crt_window.ui \
    widget_file_browse.ui \
    debugger_window.ui \
    widget_sr_edit.ui \
    widget_floppy_status.ui \
    memory_window.ui \
    widget_memory_zeile.ui \
    widget_bit_leiste.ui \
    setup_window.ui \
    debugger_vic_window.ui \
    c64_speed_window.ui \
    debugger_iec_window.ui \
    floppy_new_d64_window.ui \
    tape_window.ui \
    widget_tape_counter.ui \
    tape_new_window.ui

RESOURCES += \
    emu64.qrc

linux-g++-32{
DEFINES += str_system_arch=\\\"32Bit\\\"
TARGET = emu64
LIBS += -lSDL2 -lSDL2_image -lquazip -lGL -lGLU
}

linux-g++-64{
DEFINES += str_system_arch=\\\"64Bit\\\"
TARGET = emu64
LIBS += -lSDL2 -lSDL2_image -lquazip -lGL -lGLU
}

# Windows Crossbuild with MXE
win32{

win32:contains(ARCH, x86_64):{
    DEFINES += str_system_arch=\\\"64Bit\\\"
    #DESTDIR = "bin"
    TARGET = emu64
}else{
    DEFINES += str_system_arch=\\\"32Bit\\\"
    #DESTDIR = "bin"
    TARGET = emu64
}

DEFINES += QUAZIP_STATIC
RC_FILE = emu64.rc
LIBS += $$system($$ARCH-w64-mingw32.$$LINKTYP-sdl2-config --libs) $$system($$ARCH-w64-mingw32.$$LINKTYP-pkg-config SDL2_image gl glu --libs) -lquazip
}

OTHER_FILES += \
    emu64.rc \
    docs/ToDo \
    ../bin/Creating Final Versions/Linux/readme.txt \
    docs/readme linux.txt \
    docs/readme linux.txt \
    docs/readme linux.txt \
    docs/readme.txt \
    fonts/lucon.ttf \
    roms/kernal.rom \
    roms/char.rom \
    roms/basic.rom \
    roms/1541.rom \
    readme.md \
    emu64_de.ts \
    emu64_en.ts \
    floppy_sounds/stepper_inc.raw \
    floppy_sounds/stepper_dec.raw \
    floppy_sounds/motor_on.raw \
    floppy_sounds/motor_off.raw \
    floppy_sounds/motor.raw \
    floppy_sounds/FloppySound Hinweis.txt \
    floppy_sounds/anschlag.raw \
    lizenz.pdf \
    license.pdf \
    qt_de.qm

## Translation Release ##

QMAKE_PRE_LINK += lrelease \"$$PWD/emu64_de.ts\" \
                & lrelease \"$$PWD/emu64_en.ts\"

# Installer

linux-g++-64 | linux-g++-32 | linux-g++{

target.path = /usr/bin/
INSTALLS += target

roms.path = /usr/share/emu64/roms/
roms.files += roms/kernal.rom
roms.files += roms/char.rom
roms.files += roms/basic.rom
roms.files += roms/1541.rom
INSTALLS += roms

floppy_sounds.path = /usr/share/emu64/floppy_sounds/
floppy_sounds.files += floppy_sounds/stepper_inc.raw
floppy_sounds.files += floppy_sounds/stepper_dec.raw
floppy_sounds.files += floppy_sounds/motor_on.raw
floppy_sounds.files += floppy_sounds/motor_off.raw
floppy_sounds.files += floppy_sounds/motor.raw
floppy_sounds.files += floppy_sounds/anschlag.raw
INSTALLS += floppy_sounds

gfx.path = /usr/share/emu64/gfx/
gfx.files += grafik/kreis0.png
gfx.files += grafik/kreis1.png
gfx.files += grafik/pfeil0.png
gfx.files += grafik/pfeil1.png
gfx.files += grafik/sdl_icon.png
INSTALLS += gfx

lan.path = /usr/share/emu64/languages/
lan.files += emu64_de.qm
lan.files += grafik/flaggen/emu64_de.png
lan.files += emu64_en.qm
lan.files += grafik/flaggen/emu64_en.png
INSTALLS += lan

desktop.path =  /usr/share/applications/
desktop.files = emu64.desktop
INSTALLS += desktop

icon.path =  /usr/share/pixmaps/
icon.files = grafik/emu64.png
INSTALLS += icon

}

DISTFILES += \
    build_deb.sh
