Name:           underworld
Version:        1.0
Release:        1%{?dist}
Summary:        Open-source simulator of the student life at the Tula State University
Source0:        %{name}-%{version}.tar.gz

Patch0:         underworld.guidelines.patch

License:        MIT
URL:            https://github.com/alexanderlarin/%{name}

BuildRequires:  fpc,ncurses-devel
Requires: ncurses,xterm

%description
Underworld is an open-source simulator of the student 
life at the Tula State University, in which a player must 
dominate other students and fight the League of evil lecturers 
to get the degree.

%prep
%setup -q

%patch0

%build
fpc -Funcurses underworld.pas

%install
install -d -m755 %{buildroot}%{_bindir} %{buildroot}%{_datadir}/applications/ 
install -d -m755 %{buildroot}%{_datadir}/pixmaps/ %{buildroot}%{_datadir}/underworld/story
install -d -m755 %{buildroot}%{_mandir}/ru/man6 %{buildroot}%{_mandir}/man6
install -m755 underworld %{buildroot}%{_bindir}/underworld-bin
install -m755 underworld-xterm.sh %{buildroot}%{_bindir}/underworld
install -m644 story/*.spt %{buildroot}%{_datadir}/underworld/story
install -m644 underworld.desktop %{buildroot}%{_datadir}/applications/underworld.desktop
install -m644 underworld.png %{buildroot}%{_datadir}/pixmaps/underworld.png
install -m644 underworld.6 %{buildroot}%{_mandir}/man6/underworld.6
install -m644 underworld.ru.6 %{buildroot}%{_mandir}/ru/man6/underworld.6

%files
%{_bindir}/underworld-bin
%{_bindir}/underworld
%{_datadir}/underworld/story
%{_datadir}/applications/underworld.desktop
%{_datadir}/pixmaps/underworld.png
%{_mandir}/man6/*
%{_mandir}/ru/man6/*


%changelog
* Wed Aug 3 2016 Roman Chistokhodov 1.0-1
- Initial release
