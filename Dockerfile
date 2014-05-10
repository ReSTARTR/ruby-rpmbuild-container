FROM centos:6.4

# setup
RUN yum update -y
RUN yum install -y rpm-build gcc

# epel
RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN rpm -ihv http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# ruby-depends
RUN yum install —enablerepo=epel -y libyaml-devel
RUN yum install -y byacc readline-devel ncourses-devel tcl-devel openssl-devel gdbm-devel db4-devel

# build rpm
WORKDIR /opt/rpmbuild
ADD rubybuild.sh /opt/rpmbuild/rubybuild.sh
ADD ruby-2.0.0-p481.spec /opt/rpmbuild/ruby-2.0.0-p481.spec
