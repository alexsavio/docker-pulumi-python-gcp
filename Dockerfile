FROM python:3.7-slim-buster

ARG GCP_SDK_VERSION=297.0.1

RUN apt-get update && \
    apt-get install -y git ssh curl && \
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates

RUN export SDK_FILENAME=google-cloud-sdk-${GCP_SDK_VERSION}-linux-x86_64.tar.gz && \
    curl -O -J https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${SDK_FILENAME} && \
    tar -zxvf ${SDK_FILENAME} --directory ${HOME} && \
    ln -s ${HOME}/google-cloud-sdk/bin/* /usr/bin && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true

RUN curl -fsSL https://get.pulumi.com | sh

ENTRYPOINT ["pulumi"]
