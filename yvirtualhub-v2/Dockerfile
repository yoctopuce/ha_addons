ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN apk add --no-cache binutils libusb glib libc6-compat

ARG BUILD_ARCH
ENV BUILD_ARCH=${BUILD_ARCH}

# Copy the pre-written run.sh script
COPY run.sh /
RUN chmod a+x /run.sh

# Copy binaries
COPY i386/VirtualHub-V2  /i386/VirtualHub-V2
COPY x86_64/VirtualHub-V2 /x86_64/VirtualHub-V2
COPY armhf/VirtualHub-V2 /armhf/VirtualHub-V2
COPY aarch64/VirtualHub-V2 /aarch64/VirtualHub-V2

# Set execute permissions
RUN chmod a+x /i386/VirtualHub-V2 && \
    chmod a+x /x86_64/VirtualHub-V2 && \
    chmod a+x /armhf/VirtualHub-V2 && \
    chmod a+x /aarch64/VirtualHub-V2

# Start the container
CMD ["/bin/sh", "-c", "/run.sh"]
