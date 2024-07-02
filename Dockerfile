# Use an official Python runtime as a parent image
FROM python:3.11-slim-bullseye as build
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Set the working directory in the container
WORKDIR /app
# Copy the requirements file into the container at /app
COPY requirements.txt /app/
COPY apps /app/
COPY media /app/
COPY multitenantsaas /app/
# COPY staticfiles /app/
COPY tests /app/
COPY .env /app/
COPY manage.py /app/


RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
# Install any needed packages specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r requirements.txt
# Copy the current directory contents into the container at /app
# COPY . /app/

# Run vulnerability scan on build image
# FROM build AS vulnscan
# COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/trivy
# RUN trivy rootfs --no-progress /

EXPOSE 8585
EXPOSE 8000
EXPOSE 80
