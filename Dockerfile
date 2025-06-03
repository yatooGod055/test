FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl fuse sudo unzip nano wget git docker.io docker-compose rclone

# Create mount folder and rclone config directory
RUN mkdir -p /mnt/gdrive /root/.config/rclone

# Copy rclone.conf during build
COPY rclone/rclone.conf /root/.config/rclone/rclone.conf

RUN echo 'user_allow_other' >> /etc/fuse.conf

EXPOSE 8096
