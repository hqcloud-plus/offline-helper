# Copyright (2018, ) Institute of Software, Chinese Academy of Sciences
# Author wuheng@iscas.ac.cn
# Date   2018-11-29

Name: prod-images
Version: 1.0.0
Release: hqcloud%{?dist}
Source: %{name}-%{version}.tar.gz
Summary: auto generated
Packager: wuheng
License: ASL 2.0

%description
%{name}-%{version}

%prep
%setup -n %{name}-%{version}

%install
mkdir -p %{buildroot}/var/lib/registry/
cp -r /root/rpmbuild/BUILD/%{name}-%{version}/* %{buildroot}/var/lib/registry/

%files
/var/lib/registry/

