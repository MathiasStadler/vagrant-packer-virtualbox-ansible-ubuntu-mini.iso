../resetToStart.sh && \
../run.sh -b ../ubuntu-miniIso-packer.json  ../&& \
../box/init-BOX.sh && \
../box/start-BOX.sh && \
../box/stop-BOX.sh && \
../box/clean-BOX.sh
