FROM centos:latest
Maintainer janowicz.mateusz@gmail.com
RUN yum update -y
RUN yum upgrade -y
RUN yum install -y httpd
RUN yum install -y openssh-server.x86_64
RUN yum install -y net-tools
RUN echo nameserver 8.8.8.8 > /etc/resolv.conf
RUN mkdir /etc/httpd/vhost.d
RUN /usr/sbin/httpd
RUN ssh-keygen -P "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -P "" -t rsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -P "" -t rsa -f /etc/ssh/ssh_host_ed25519_key
RUN /usr/sbin/sshd
RUN echo 'root:password' | chpasswd
#RUN yum install -y java-1.8.0-openjdk.x86_64
#RUN cp /etc/profile /etc/profile_backup
#RUN echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | tee -a /etc/profile
#RUN echo 'export JRE_HOME=/usr/lib/jvm/jre' | tee -a /etc/profile
#RUN yum install -y wget
#RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
#RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#RUN yum install -y jenkins
#RUN yum install -y firewalld
#RUN yum -y install systemd; yum clean all; 
#RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); 
#RUN rm -f /lib/systemd/system/multi-user.target.wants/*;
#RUN rm -f /etc/systemd/system/*.wants/*;
#RUN rm -f /lib/systemd/system/local-fs.target.wants/*; 
#RUN rm -f /lib/systemd/system/sockets.target.wants/*udev*; 
#RUN rm -f /lib/systemd/system/sockets.target.wants/*initctl*; 
#RUN rm -f /lib/systemd/system/basic.target.wants/*;
#RUN rm -f /lib/systemd/system/anaconda.target.wants/*;
#VOLUME ["/sys/fs/cgroup"]
#EXPOSE 80
#CMD ["/usr/sbin/httpd"]
#EXPOSE 22
#CMD ["/usr/sbin/sshd"]
