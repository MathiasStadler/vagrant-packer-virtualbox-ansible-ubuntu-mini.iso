../resetToStart.sh && \
../run.sh  -f ../ubuntu_miniIso -b ../ubuntu_miniIso/ubuntu_miniIso_packer.json  && \
../box/init-BOX.sh && \
../box/start-BOX.sh && \
../box/stop-BOX.sh && \
../box/clean-BOX.sh
