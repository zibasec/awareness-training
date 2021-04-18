FROM --platform=linux/amd64 fedora:latest

RUN dnf -y install \
  ansible \
  python3-pip \
  asciidoctor \
  aspell \
  aspell-en \
  ruby-devel \
  make \
  gcc \
  redhat-rpm-config \
  rubygem-asciidoctor.noarch \
  rubygem-asciidoctor-pdf.noarch \
  rubygem-jekyll-asciidoc.noarch \
  git \
  rsync \
  nodejs \
  npm \
  python3-jinja2-cli \
  git \
  tree \
  vim-enhanced \
  stow \
  python3-jinja2 && dnf clean all;

RUN pip install python-frontmatter

RUN curl -sLo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/3.3.2/yq_linux_amd64 && chmod +x /usr/local/bin/yq
RUN curl -sLo /usr/local/bin/asciidoctor-revealjs https://github.com/asciidoctor/asciidoctor-reveal.js/releases/download/v4.0.1/asciidoctor-revealjs-linux && chmod +x /usr/local/bin/asciidoctor-revealjs

RUN echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/wheel

RUN mkdir -p /opt/source

WORKDIR /opt/source
