Name:           underworld
Version:        1.0
Release:        1%{?dist}
Summary:        Open-source simulator of the student life at the Tula State University
Source0:        %{name}-%{version}.tar.gz

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

%build
fpc -Funcurses underworld.pas

%install
install -d -m755 %{buildroot}/usr/games/ %{buildroot}/usr/share/applications/ 
install -d -m755 %{buildroot}/usr/share/pixmaps/ %{buildroot}/usr/share/games/underworld/story
install -d -m755 %{buildroot}%{_mandir}/man6/
install -m755 underworld %{buildroot}/usr/games/underworld-bin
install -m755 underworld-xterm.sh %{buildroot}/usr/games/underworld
install -m644 story/*.spt %{buildroot}%{_datadir}/games/underworld/story
install -m644 underworld.desktop %{buildroot}%{_datadir}/applications/underworld.desktop
install -m644 underworld.png %{buildroot}%{_datadir}/pixmaps/underworld.png
install -m644 underworld.6 %{buildroot}%{_mandir}/man6/underworld.6

%files
/usr/games/underworld-bin
/usr/games/underworld
%{_datadir}/games/underworld/story
%{_datadir}/applications/underworld.desktop
%{_datadir}/pixmaps/underworld.png
%{_mandir}/man6/*


%changelog
* Wed Aug 3 2016 Roman Chistokhodov 1.0-1
- Initial release
