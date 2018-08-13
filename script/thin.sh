echo_warning() {
  echo "\033[33m $1 \033[0m"
}

echo_error() {
  echo "\033[31m $1 \033[0m"
}

echo_success() {
  echo "\033[32m $1 \033[0m"
}

thin() {
FRAMEWORK_NAME=$1
BACKUP_DIR="./bak"
if [ ! -d ${FRAMEWORK_NAME}.framework ]; then
  echo_warning "${FRAMEWORK_NAME}.framework 文件不存在，跳过。"
else
  if [ ! -d ${BACKUP_DIR} ]; then
    mkdir ${BACKUP_DIR}
  fi
  cp -r ${FRAMEWORK_NAME}.framework ./bak
  lipo ${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME} -thin armv7 -output ${FRAMEWORK_NAME}_armv7
  lipo ${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME} -thin arm64 -output ${FRAMEWORK_NAME}_arm64
  lipo -create ${FRAMEWORK_NAME}_armv7 ${FRAMEWORK_NAME}_arm64 -output ${FRAMEWORK_NAME}
  mv ${FRAMEWORK_NAME} ${FRAMEWORK_NAME}.framework/
  rm -rf ${FRAMEWORK_NAME}_arm*
  echo_success "${FRAMEWORK_NAME}.framework 瘦身完毕"  
  echo_success "$(lipo -info ${FRAMEWORK_NAME}.framework/${FRAMEWORK_NAME})"
fi
}


# 可以输入参数指定需要瘦身的 Framework
if [ $# == 0 ]; then 
  for i in YZSDKCore YZBaseSDK
  do
      thin $i
  done
else
  for i in $@; do
      thin $i
  done
fi 