ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN apk add --no-cache binutils libusb glib libc6-compat

ARG BUILD_ARCH


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh
RUN echo "echo \"Start VirtualHub-V2 for ${BUILD_ARCH}\" " >> /run.sh;
RUN echo "mkdir -p /data/.virtualhubv2" >> /run.sh;
RUN if [ "${BUILD_ARCH}" = "amd64" ]; then \
      echo "./x86_64/VirtualHub-V2 -c /data/.virtualhubv2/.virtualhub.dat" -k  /data/.virtualhubv2/.virtualhub.key -s  /data/.virtualhubv2/.virtualhub.cert >> /run.sh; \
    else \
      echo "./${BUILD_ARCH}/VirtualHub-V2 -c /data/.virtualhubv2/.virtualhub.dat" -k  /data/.virtualhubv2/.virtualhub.key -s  /data/.virtualhubv2/.virtualhub.cert >> /run.sh; \
    fi

COPY i386/VirtualHub-V2  /i386/VirtualHub-V2
COPY x86_64/VirtualHub-V2 /x86_64/VirtualHub-V2
COPY armhf/VirtualHub-V2 /armhf/VirtualHub-V2
COPY aarch64/VirtualHub-V2 /aarch64/VirtualHub-V2
RUN chmod a+x /i386/VirtualHub-V2
RUN chmod a+x /x86_64/VirtualHub-V2
RUN chmod a+x /armhf/VirtualHub-V2
RUN chmod a+x /aarch64/VirtualHub-V2

CMD [ "/run.sh" ]