from ubuntu:focal
maintainer rootkiter@rootkiter.com

WORKDIR /downloads/
RUN mkdir /root/compile_bins

RUN apt-get update && apt-get install -y wget git vim

RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv4l.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-armv5l.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-i586.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-i686.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-m68k.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mipsel.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-mips.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-powerpc-440fp.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-powerpc.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-sh4.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-sparc.tar.bz2
RUN wget https://www.uclibc.org/downloads/binaries/0.9.30.1/cross-compiler-x86_64.tar.bz2
RUN wget http://distro.ibiblio.org/slitaz/sources/packages/c/cross-compiler-armv4eb.tar.bz2
RUN wget http://distro.ibiblio.org/slitaz/sources/packages/c/cross-compiler-armv4tl.tar.bz2
RUN wget http://distro.ibiblio.org/slitaz/sources/packages/c/cross-compiler-armv6l.tar.bz2
RUN wget http://distro.ibiblio.org/slitaz/sources/packages/c/cross-compiler-i486.tar.bz2
RUN wget http://distro.ibiblio.org/slitaz/sources/packages/c/cross-compiler-mips64.tar.bz2
RUN wget http://landley.net/aboriginal/downloads/binaries/cross-compiler-sh2eb.tar.gz
RUN wget http://landley.net/aboriginal/downloads/binaries/cross-compiler-sh2elf.tar.gz

RUN ls *.tar.bz2 | awk '{system("tar -jxf  "$1" -C /root/compile_bins/")}'
RUN ls *.tar.gz  | awk '{system("tar -zxvf "$1" -C /root/compile_bins/")}'

ENV PATH="/root/compile_bins/cross-compiler-armv4l/bin:/root/compile_bins/cross-compiler-armv5l/bin:/root/compile_bins/cross-compiler-i586/bin:/root/compile_bins/cross-compiler-i686/bin:/root/compile_bins/cross-compiler-m68k/bin:/root/compile_bins/cross-compiler-mipsel/bin:/root/compile_bins/cross-compiler-mips/bin:/root/compile_bins/cross-compiler-powerpc-440fp/bin:/root/compile_bins/cross-compiler-powerpc/bin:/root/compile_bins/cross-compiler-sh4/bin:/root/compile_bins/cross-compiler-sparc/bin:/root/compile_bins/cross-compiler-x86_64/bin:/root/compile_bins/cross-compiler-armv4eb/bin:/root/compile_bins/cross-compiler-armv4tl/bin:/root/compile_bins/cross-compiler-armv6l/bin:/root/compile_bins/cross-compiler-i486/bin:/root/compile_bins/cross-compiler-mips64/bin:/root/compile_bins/cross-compiler-sh2eb/bin:/root/compile_bins/cross-compiler-sh2elf/bin:$PATH"

RUN echo 'export PATH="$PATH"' >> /root/.bashrc
RUN rm -rf /downloads/
WORKDIR /root/
