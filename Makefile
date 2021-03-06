BZIP2                 := bzip2
BZIP2_VERSION         := $(BZIP2)-1.0.6
BZIP2_SRC             := $(BZIP2_VERSION).tar.gz
BZIP2_DOWNLOAD        := "http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz"

FREETYPE              := freetype
FREETYPE_VERSION      := $(FREETYPE)-2.6.2
FREETYPE_SRC          := $(FREETYPE_VERSION).tar.bz2
FREETYPE_DOWNLOAD     := http://download.savannah.gnu.org/releases/freetype/freetype-2.6.2.tar.bz2

GIFLIB                := giflib
GIFLIB_SRC            := submodules/$(GIFLIB)

JANSSON               := jansson
JANSSON_SRC           := submodules/$(JANSSON)

LIBCONFIG             := libconfig
LIBCONFIG_SRC		  := submodules/$(LIBCONFIG)

LIBEXIF               := libexif
LIBEXIF_VERSION       := $(LIBEXIF)-0.6.21
LIBEXIF_SRC           := $(LIBEXIF_VERSION).tar.bz2
LIBEXIF_DOWNLOAD      := http://sourceforge.net/projects/libexif/files/libexif/0.6.21/libexif-0.6.21.tar.bz2/download

LIBJPEGTURBO          := libjpeg-turbo
LIBJPEGTURBO_SRC      := submodules/$(LIBJPEGTURBO)

LIBMAD                := libmad
LIBMAD_VERSION        := $(LIBMAD)-0.15.1b
LIBMAD_SRC            := $(LIBMAD_VERSION).tar.gz
LIBMAD_DOWNLOAD       := "http://sourceforge.net/projects/mad/files/libmad/0.15.1b/libmad-0.15.1b.tar.gz"

LIBOGG                := libogg
LIBOGG_VERSION        := $(LIBOGG)-1.3.2
LIBOGG_SRC            := $(LIBOGG_VERSION).tar.xz
LIBOGG_DOWNLOAD       := "http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.xz"

LIBPNG                := libpng
LIBPNG_VERSION        := $(LIBPNG)-1.6.21
LIBPNG_SRC            := $(LIBPNG_VERSION).tar.xz
LIBPNG_DOWNLOAD       := http://prdownloads.sourceforge.net/libpng/libpng-1.6.21.tar.xz?download

LIBXMP_LITE           := libxmp-lite
LIBXMP_LITE_VERSION   := $(LIBXMP_LITE)-4.3.10
LIBXMP_LITE_SRC       := $(LIBXMP_LITE_VERSION).tar.gz
LIBXMP_LITE_DOWNLOAD  := http://sourceforge.net/projects/xmp/files/libxmp/4.3.10/libxmp-lite-4.3.10.tar.gz/download

MBED_APACHE           := mbedtls
MBED_APACHE_SRC       := submodules/$(MBED_APACHE)

TINYXML               := tinyxml2
TINYXML_SRC           := submodules/$(TINYXML)

TREMOR                := tremor
TREMOR_VERSION        := $(TREMOR)-2a1a8f6
TREMOR_SRC            := $(TREMOR_VERSION).tar.gz
TREMOR_DOWNLOAD       := https://git.xiph.org/?p=tremor.git;a=snapshot;h=2a1a8f621e500fdf0749f115e2206f82919560a3;sf=tgz

XZ                    := xz
XZ_VERSION            := $(XZ)-5.2.2
XZ_SRC                := $(XZ_VERSION).tar.xz
XZ_DOWNLOAD           := "http://tukaani.org/xz/xz-5.2.2.tar.xz"

ZLIB                  := zlib
ZLIB_SRC              := submodules/$(ZLIB)

SOURCE_TARBALL 		  := sources.tar
PORTLIBS_SRC		  := $(filter-out submodules .. ., $(wildcard * .*))
GIT 				  := git

export PORTLIBS_PATH  := $(DEVKITPRO)/portlibs
export PATH           := $(DEVKITARM)/bin:$(PORTLIBS_PATH)/3ds/bin:$(PORTLIBS_PATH)/armv6k/bin:$(PATH)
export PKG_CONFIG     := $(CURDIR)/arm-none-eabi-pkg-config

export CFLAGS         := -march=armv6k -mtune=mpcore -mfloat-abi=hard -mtp=soft -O3 -mword-relocations -ffunction-sections
export CPPFLAGS       := -I$(DEVKITPRO)/libctru/include -I$(PORTLIBS_PATH)/3ds/include -I$(PORTLIBS_PATH)/armv6k/include
export LDFLAGS        := -L$(DEVKITPRO)/libctru/lib -L$(PORTLIBS_PATH)/3ds/lib -L$(PORTLIBS_PATH)/armv6k/lib
export LIBS           := -lctru

.PHONY: all \
        install \
        install-$(ZLIB) \
        clean \
        download \
		tar-source \
        $(BZIP2) \
        $(FREETYPE) \
        $(GIFLIB) \
        $(JANSSON) \
        $(LIBCONFIG) \
        $(LIBEXIF) \
        $(LIBJPEGTURBO) \
        $(LIBMAD) \
        $(LIBOGG) \
        $(LIBPNG) \
        $(MBED_APACHE) \
        $(MBED_GPL) \
        $(LIBXMP_LITE) \
        $(TINYXML) \
        $(TREMOR) \
        $(XZ) \
        $(ZLIB)

all:
	@echo "Please choose one of the following targets:"
	@echo "  $(BZIP2)"
	@echo "  $(FREETYPE) (requires zlib to be installed)"
	@echo "  $(GIFLIB)"
	@echo "  $(JANSSON)"
	@echo "  $(LIBCONFIG)"
	@echo "  $(LIBEXIF)"
	@echo "  $(LIBJPEGTURBO)"
	@echo "  $(LIBMAD)"
	@echo "  $(LIBOGG)"
	@echo "  $(LIBPNG) (requires zlib to be installed)"
	@echo "  $(LIBXMP_LITE)"
	@echo "  $(MBED_APACHE) (requires zlib to be installed)"
	@echo "  $(TINYXML)"
	@echo "  $(TREMOR) (requires $(LIBOGG) to be installed)"
	@echo "  $(XZ)"
	@echo "  $(ZLIB)"

download: $(BZIP2_SRC) $(FREETYPE_SRC) $(GIFLIB_SRC) $(JANSSON_SRC) $(LIBCONFIG_SRC) $(LIBEXIF_SRC) $(LIBJPEGTURBO_SRC) $(LIBMAD_SRC) $(LIBOGG_SRC) $(LIBPNG_SRC) $(LIBXMP_LITE_SRC) $(MBED_APACHE_SRC) $(TINYXML_SRC) $(TREMOR_SRC) $(XZ_SRC) $(ZLIB_SRC)

tar-source: $(SOURCE_TARBALL)

$(SOURCE_TARBALL): $(PORTLIBS_SRC) $(BZIP2_SRC) $(FREETYPE_SRC) $(GIFLIB_SRC) $(JANSSON_SRC) $(LIBCONFIG_SRC) $(LIBEXIF_SRC) $(LIBJPEGTURBO_SRC) $(LIBMAD_SRC) $(LIBOGG_SRC) $(LIBPNG_SRC) $(LIBXMP_LITE_SRC) $(MBED_APACHE_SRC) $(TINYXML_SRC) $(TREMOR_SRC) $(XZ_SRC) $(ZLIB_SRC)
	tar cvf $@ $^ > /dev/null 2>&1

DOWNLOAD = wget --no-check-certificate -O "$(1)" "$(2)" || curl -Lo "$(1)" "$(2)"

$(BZIP2_SRC):
	@$(call DOWNLOAD,$@,$(BZIP2_DOWNLOAD))

$(FREETYPE_SRC):
	$(call DOWNLOAD,$@,$(FREETYPE_DOWNLOAD))

$(GIFLIB_SRC):
	$(GIT) submodule update $(GIFLIB_SRC)

$(JANSSON_SRC):
	$(GIT) submodule update $(JANSSON_SRC)

$(LIBCONFIG_SRC):
	$(GIT) submodule update $(LIBCONFIG_SRC)

$(LIBEXIF_SRC):
	@$(call DOWNLOAD,$@,$(LIBEXIF_DOWNLOAD))

$(LIBJPEGTURBO_SRC):
	$(GIT) submodule update $(LIBJPEGTURBO_SRC)

$(LIBMAD_SRC):
	@$(call DOWNLOAD,$@,$(LIBMAD_DOWNLOAD))

$(LIBOGG_SRC):
	@$(call DOWNLOAD,$@,$(LIBOGG_DOWNLOAD))

$(LIBPNG_SRC):
	@$(call DOWNLOAD,$@,$(LIBPNG_DOWNLOAD))

$(LIBXMP_LITE_SRC):
	@$(call DOWNLOAD,$@,$(LIBXMP_LITE_DOWNLOAD))

$(MBED_APACHE_SRC):
	$(GIT) submodule update $(MBED_APACHE_SRC)

$(TINYXML_SRC):
	$(GIT) submodule update $(TINYXML_SRC)

$(TREMOR_SRC):
	@$(call DOWNLOAD,$@,$(TREMOR_DOWNLOAD))

$(XZ_SRC):
	@$(call DOWNLOAD,$@,$(XZ_DOWNLOAD))

$(ZLIB_SRC):
	$(GIT) submodule update $(ZLIB_SRC)

$(BZIP2): $(BZIP2_SRC)
	@[ -d $(BZIP2_VERSION) ] || tar -xzf $<
	@cd $(BZIP2_VERSION)
	@$(MAKE) -C $(BZIP2_VERSION) CC=arm-none-eabi-gcc AR=arm-none-eabi-ar RANLIB=arm-none-eabi-ranlib CPPFLAGS="$(CPPFLAGS)" CFLAGS="-D_FILE_OFFSET_BITS=64 -Winline $(CFLAGS)" libbz2.a

$(FREETYPE): $(FREETYPE_SRC)
	@[ -d $(FREETYPE_VERSION) ] || tar -xjf $<
	@cd $(FREETYPE_VERSION) && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static --without-harfbuzz
	@$(MAKE) -C $(FREETYPE_VERSION)

$(GIFLIB): $(GIFLIB_SRC)
	@cd $(GIFLIB_SRC) && \
	 autoreconf -i && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(GIFLIB_SRC)

$(JANSSON): $(JANSSON_SRC)
	@cd $(JANSSON_SRC) && \
	 autoreconf -i && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(JANSSON_SRC)

$(LIBCONFIG): $(LIBCONFIG_SRC)
	@cd $(LIBCONFIG_SRC) && \
	 autoreconf -i && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-cxx --disable-examples
	@$(MAKE) -C $(LIBCONFIG_SRC)/lib

$(LIBEXIF): $(LIBEXIF_SRC)
	@[ -d $(LIBEXIF_VERSION) ] || tar -xjf $<
	@cd $(LIBEXIF_VERSION) && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(LIBEXIF_VERSION)

$(LIBJPEGTURBO): $(LIBJPEGTURBO_SRC)
	@cd $(LIBJPEGTURBO_SRC) && \
	 autoreconf -i && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(LIBJPEGTURBO_SRC)

$(LIBMAD): $(LIBMAD_SRC)
	@[ -d $(LIBMAD_VERSION) ] || tar -xzf $<
	@cd $(LIBMAD_VERSION) && \
	 patch -Np1 -i ../libmad-0.15.1b.patch && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(LIBMAD_VERSION)

$(LIBOGG): $(LIBOGG_SRC)
	@[ -d $(LIBOGG_VERSION) ] || tar -xJf $<
	@cd $(LIBOGG_VERSION) && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(LIBOGG_VERSION)

$(LIBPNG): $(LIBPNG_SRC)
	@[ -d $(LIBPNG_VERSION) ] || tar -xJf $<
	@cd $(LIBPNG_VERSION) && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(LIBPNG_VERSION)

$(LIBXMP_LITE): $(LIBXMP_LITE_SRC)
	@[ -d $(LIBXMP_LITE_VERSION) ] || tar -xzf $<
	@cd $(LIBXMP_LITE_VERSION) && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static
	@$(MAKE) -C $(LIBXMP_LITE_VERSION)

$(MBED_APACHE): $(MBED_APACHE_SRC)
	@cd $(MBED_APACHE_SRC) && \
	 patch -Np1 -i ../../libmbedtls-2.5.1.patch && \
	 cmake -DCMAKE_SYSTEM_NAME=Generic -DCMAKE_C_COMPILER=$(DEVKITARM)/bin/arm-none-eabi-gcc \
	 -DCMAKE_CXX_COMPILER=$(DEVKITARM)/bin/arm-none-eabi-g++ \
	 -DCMAKE_INSTALL_PREFIX=$(PORTLIBS_PATH)/3ds -DCMAKE_C_FLAGS="$(CFLAGS) $(CPPFLAGS)" \
	 -DCMAKE_CXX_FLAGS="$(CFLAGS) -fno-exceptions -fno-rtti" \
	 -DZLIB_ROOT="$(PORTLIBS_PATH)/armv6k" \
	 -DENABLE_ZLIB_SUPPORT=TRUE -DENABLE_TESTING=FALSE -DENABLE_PROGRAMS=FALSE .
	@$(MAKE) -C $(MBED_APACHE_SRC)

# tinyxml2 uses cmake
$(TINYXML): $(TINYXML_SRC)
	@cd $(TINYXML_SRC) && cmake -DCMAKE_SYSTEM_NAME=Generic -DCMAKE_C_COMPILER=$(DEVKITARM)/bin/arm-none-eabi-gcc -DCMAKE_CXX_COMPILER=$(DEVKITARM)/bin/arm-none-eabi-g++ -DCMAKE_INSTALL_PREFIX=$(PORTLIBS_PATH)/armv6k -DCMAKE_C_FLAGS="$(CFLAGS)" -DCMAKE_CXX_FLAGS="$(CFLAGS) -fno-exceptions -fno-rtti" . && make

$(TREMOR): $(TREMOR_SRC)
	@[ -d $(TREMOR_VERSION) ] || tar -xzf $<
	@cd $(TREMOR_VERSION) && \
	 ./autogen.sh --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --disable-oggtest
	@$(MAKE) -C $(TREMOR_VERSION)

$(XZ): $(XZ_SRC)
	@[ -d $(XZ_VERSION) ] || tar -xJf $<
	@cd $(XZ_VERSION) && \
	 ./configure --prefix=$(PORTLIBS_PATH)/armv6k --host=arm-none-eabi --disable-shared --enable-static --disable-xz --enable-threads=no
	@$(MAKE) -C $(XZ_VERSION)

$(ZLIB): $(ZLIB_SRC)
	@cd $(ZLIB_SRC) && \
	 CHOST=arm-none-eabi ./configure --static --prefix=$(PORTLIBS_PATH)/armv6k
	@$(MAKE) -C $(ZLIB_SRC)

install-$(ZLIB):
	@$(MAKE) -C $(ZLIB_SRC) install

install:
	@if [ -d $(BZIP2_VERSION) ]; then \
		cp -fv $(BZIP2_VERSION)/bzlib.h $(PORTLIBS_PATH)/armv6k/include; \
		chmod a+r $(PORTLIBS_PATH)/armv6k/include/bzlib.h; \
		cp -fv $(BZIP2_VERSION)/libbz2.a $(PORTLIBS_PATH)/armv6k/lib; \
		chmod a+r $(PORTLIBS_PATH)/armv6k/lib/libbz2.a; \
	fi
	@[ ! -d $(FREETYPE_VERSION) ] || $(MAKE) -C $(FREETYPE_VERSION) install
	@[ ! -d $(GIFLIB_SRC) ] || $(MAKE) -C $(GIFLIB_SRC) install
	@[ ! -d $(JANSSON_SRC) ] || $(MAKE) -C $(JANSSON_SRC) install
	@[ ! -d $(LIBCONFIG_SRC) ] || $(MAKE) -C $(LIBCONFIG_SRC)/lib install
	@[ ! -d $(LIBEXIF_VERSION) ] || $(MAKE) -C $(LIBEXIF_VERSION) install
	@[ ! -d $(LIBJPEGTURBO_SRC) ] || $(MAKE) -C $(LIBJPEGTURBO_SRC) install
	@[ ! -d $(LIBMAD_VERSION) ] || $(MAKE) -C $(LIBMAD_VERSION) install
	@[ ! -d $(LIBOGG_VERSION) ] || $(MAKE) -C $(LIBOGG_VERSION) install
	@[ ! -d $(LIBPNG_VERSION) ] || $(MAKE) -C $(LIBPNG_VERSION) install
	@[ ! -d $(LIBXMP_LITE_VERSION) ] || $(MAKE) -C $(LIBXMP_LITE_VERSION) install
	@[ ! -d $(MBED_APACHE_SRC) ] || $(MAKE) -C $(MBED_APACHE_SRC) install
	@[ ! -d $(TINYXML_SRC) ] || $(MAKE) -C $(TINYXML_SRC) install
	@[ ! -d $(TREMOR_VERSION) ] || $(MAKE) -C $(TREMOR_VERSION) install
	@[ ! -d $(XZ_VERSION) ] || $(MAKE) -C $(XZ_VERSION) install

clean:
	@$(RM) -r $(BZIP2_VERSION)
	@$(RM) -r $(BZIP2_SRC)
	@$(RM) -r $(FREETYPE_VERSION)
	@$(RM) -r $(FREETYPE_SRC)
	@$(RM) -r $(GIFLIB_SRC)
	@$(RM) -r $(JANSSON_SRC)
	@$(RM) -r $(LIBCONFIG_SRC)
	@$(RM) -r $(LIBEXIF_VERSION)
	@$(RM) -r $(LIBEXIF_SRC)
	@$(RM) -r $(LIBJPEGTURBO_SRC)
	@$(RM) -r $(LIBMAD_VERSION)
	@$(RM) -r $(LIBMAD_SRC)
	@$(RM) -r $(LIBOGG_VERSION)
	@$(RM) -r $(LIBOGG_SRC)
	@$(RM) -r $(LIBPNG_VERSION)
	@$(RM) -r $(LIBXMP_LITE_VERSION)
	@$(RM) -r $(MBED_APACHE_SRC)
	@$(RM) -r $(TINYXML_SRC)
	@$(RM) -r $(TREMOR_VERSION)
	@$(RM) -r $(TREMOR_SRC)
	@$(RM) -r $(XZ_VERSION)
	@$(RM) -r $(XZ_SRC)
	@$(RM) -r $(ZLIB_SRC)
