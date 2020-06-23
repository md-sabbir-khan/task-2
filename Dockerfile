
FROM centos:latest
RUN yum install sudo -y
RUN yum install git -y
RUN yum install wget -y
RUN yum install java-11-openjdk-devel -y
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
RUN yum install jenkins -y
RUN yum install net-tools -y
RUN echo -e "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
EXPOSE 8080
USER jenkins
ENV USER root
CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]




