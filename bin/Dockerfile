FROM registry.gitlab.com/goozbach-infra-containers/asciidoctor
LABEL org.opencontainers.image.source=https://github.com/openawarenesstraining/openawarenesstraining

RUN dnf -y install ansible python3-pip
RUN pip install python-frontmatter

WORKDIR /opt/source
