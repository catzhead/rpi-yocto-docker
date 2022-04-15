IMAGE_NAME=yocto-rpi-build

WORK_DIR=yocto-workdir
YOCTO_RELEASE=honister
TARGET_YOCTO_WORKDIR=/yocto-workdir

CD=cd
CONTMANAGER=podman
GIT=git
MKDIR=mkdir -p
PWD=`pwd`

build:
	${CONTMANAGER} build . -t ${IMAGE_NAME}

prepare:
	${MKDIR} ${WORK_DIR}
	${GIT} clone -b ${YOCTO_RELEASE} --depth 1 git://git.yoctoproject.org/poky.git ${WORK_DIR}
	${CD} ${WORK_DIR} ; \
		${GIT} clone -b ${YOCTO_RELEASE} --depth 1 git://git.openembedded.org/meta-openembedded
	${CD} ${WORK_DIR} ; \
		${GIT} clone -b ${YOCTO_RELEASE} --depth 1 git://git.yoctoproject.org/meta-raspberrypi

clean:
	${RM} -rf ${WORK_DIR}

run:
	${CONTMANAGER} run -it \
    --mount type=bind,src="${PWD}"/${WORK_DIR},target=${TARGET_YOCTO_WORKDIR} \
		${IMAGE_NAME}
