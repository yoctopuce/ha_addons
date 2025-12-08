#!/usr/bin/with-contenv bashio
lsusb
mkdir -p /data/.virtualhubv2
# start binary in background
if [ "${BUILD_ARCH}" = "amd64" ]; then
  VHUB_BIN="./x86_64/VirtualHub-V2"
else
  VHUB_BIN="./${BUILD_ARCH}/VirtualHub-V2"
fi

echo "Wait 10 secondes.."
sleep 10
echo "Start VirtualHub-V2 (${VHUB_BIN})"
${VHUB_BIN} -c /data/.virtualhubv2/.virtualhub.dat -k /data/.virtualhubv2/.virtualhub.key -s /data/.virtualhubv2/.virtualhub.cert 2>&1
echo "End of VirtualHub-V2 for ${BUILD_ARCH}"

tail -f /dev/null
