FROM ubuntu:wily

#ADD apt-http-proxy /etc/apt/apt.conf.d/
ENV HOME /root
RUN apt update && apt install -y aptitude && apt-get clean

### Basic sysadmin tools ###

RUN apt install -y dstat htop man sudo && apt-get clean

### User tools ###

RUN apt install -y vim fish sloccount byobu && apt-get clean

### Software engineering tools ###

RUN apt install -y mercurial git git-man && apt-get clean

# Remove unnecessary packages
RUN apt-get autoremove -y

### OCaml ###

RUN apt install -y ocaml-nox && apt-get clean

### Environment ###

ADD docker-run-cmd.sh /bin/
RUN echo fish >> /bin/docker-run-cmd.sh
CMD /bin/docker-run-cmd.sh
RUN chsh -s /usr/bin/fish root && byobu-ctrl-a screen

ADD apti /usr/sbin/apti
ADD user /usr/sbin/user

ADD fish/config.fish /root/.config/fish/config.fish

RUN date > ~/build_date.txt

RUN cp -vr --reflink=auto -t /etc/skel ~/* ~/.profile ~/.byobu ~/.config

RUN useradd -m -s /usr/bin/fish -U user && chown -R user:user ~user

### Yup ###

RUN apt update && apt install -y menhir && aptitude clean

ADD build-yup.sh /opt/
RUN su user -c /opt/build-yup.sh
