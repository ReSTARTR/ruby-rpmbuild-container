#!/bin/env bash
HOME=/opt/rpmbuild

RUBY_VER=${RUBY_VER:-"2.0.0-p481"}
RUBY_MAJOUR_VER=$(echo $RUBY_VER|cut -d"-" -f1)
RUBY_MINOR_VER=$(echo $RUBY_VER|cut -d"-" -f2)
if [ -z "$RUBY_MINOR_VER" ]; then
  RUBY_TARBALL="ruby-$RUBY_MAJOUR_VER.tar.gz"
else
  RUBY_TARBALL="ruby-$RUBY_MAJOUR_VER-$RUBY_MINOR_VER.tar.gz"
fi
RUBY_REMOTE_FILE="http://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOUR_VER:0:3}/$RUBY_TARBALL"

mkdir -p $HOME/rpm/{BUILD,SRPMS,SPECS,SOURCES,RPMS}
echo "%_topdir $HOME/rpm" > $HOME/.rpmmacros
if [ ! -f $HOME/rpm/SOURCES/$RUBY_TARBALL ]; then
  wget $RUBY_REMOTE_FILE -O $HOME/rpm/SOURCES/$RUBY_TARBALL
fi
cp $HOME/ruby-${RUBY_VER}.spec $HOME/rpm/SPECS/ruby.spec
rpmbuild -bb $HOME/rpm/SPECS/ruby.spec

cp $HOME/rpm/RPMS/x86_64/* /shared/
