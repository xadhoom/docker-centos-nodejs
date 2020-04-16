FROM centos:7

# elixir expects utf8.
ENV LANG=en_US.utf8

ENV NODESOURCE=https://rpm.nodesource.com/pub_10.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm

RUN set -xe \	
  && yum install -y ${NODESOURCE} \
	&& yum clean all && yum update -y \
	&& yum install -y rpm-build createrepo epel-release make git lsof openssh-clients which nodejs \
	&& yum groups mark install "Development Tools" \
	&& yum groups mark convert "Development Tools" \
	&& yum groupinstall -y "Development Tools" \
	&& useradd -ms /bin/bash cirunner \
  && mkdir /builds && chown cirunner:cirunner /builds

USER cirunner

CMD ["node"]
