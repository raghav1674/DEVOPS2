FROM centos:latest
RUN yum install sudo -y
RUN yum install python3 -y
RUN yum install mailx -y
RUN yum install net-tools -y
RUN yum install wget -y
RUN yum install java-11-openjdk.x86_64 -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
RUN yum install openssh-clients -y
RUN yum install sudo -y
RUN yum install jenkins -y
RUN yum install /sbin/service -y
RUN  mkdir /workdir
COPY ./check_forext.py /workdir/
RUN mkdir /storage/
COPY  ./mail.rc  /etc/mail.rc
RUN echo -e "jenkins ALL(=ALL) NOPASSWD: ALL" >> /etc/sudoers
CMD java -jar /usr/lib/jenkins/jenkins.war
EXPOSE 8080


#IN THE DIRECTORY WHERE YOU HAVE COPIED THIS THE mail.rc and  check_forext.py should be there 
# TO BUILD THIS IMAGE USE THE COMMAND :

#docker build -t imagename:version  folder where the Dockerfile u have copied.

#and for running the conatiner from this image use command:

#docker run -it -P --name containername imagename:version

#U CAN ACCESS THE JENKINS FROM 
#base os using BASEDOCKERHOSTIP:PORT MAPPED .
#u can see the port number to which 8080 port of the container is mapped using netstat -tnlp 



