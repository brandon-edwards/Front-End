FROM cbica/captk_centos7:devtoolset-4_superbuild

LABEL authors="FeTS_Admin <admin@fets.ai>"

ENV HTTPS_PROXY http://proxy-us.intel.com:912
ENV HTTP_PROXY http://proxy-us.intel.com:912
ENV http_proxy http://proxy-us.intel.com:912
ENV https_proxy http://proxy-us.intel.com:912

RUN yum update -y

RUN yum install git

RUN echo "running ls -l" && ls -l && pwd

WORKDIR /Front-End

COPY . .

RUN echo "running ls -l" && ls -l && pwd

RUN bash ./buildscript.sh

# set up the docker for GUI
ENV QT_X11_NO_MITSHM=1
ENV QT_GRAPHICSSYSTEM="native"

RUN bash ./add_env/additional_environment.sh

# define entry point
# ENTRYPOINT ["/Front-End/bin/install/appdir/usr/bin/BraTSPipeline"]
ENTRYPOINT ["/bin/bash"]
