FROM monokrome/sshd
MAINTAINER Brandon R. Stoner <monokrome@monokro.me>

RUN useradd -m -s /bin/bash git

ADD . /home/git/gitolite

RUN apt-get install -y git-core && mkdir /home/git/bin
RUN /home/git/gitolite/install -to /home/git/bin
RUN chmod +x /home/git/bin/* && chown -R git:git /home/git

RUN su git -c "/home/git/bin/gitolite setup --hooks-only"
