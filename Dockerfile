FROM quay.io/openshift/origin-must-gather:4.4.0 as builder

FROM registry.access.redhat.com/ubi8-minimal:latest

RUN microdnf -y install rsync tar gzip

COPY --from=builder /usr/bin/oc /usr/bin/oc
COPY collection-scripts/* /usr/bin/

ENTRYPOINT /usr/bin/gather
