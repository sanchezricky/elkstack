# The ELK Stack

### Objectives

1. Create a script to install the ELK stack, Java 8, and Nginx on Ubuntu 18.04. Originally this was meant for AWS EC2 but the free tier of EC2 does not have enough RAM support.

### Technologies used

* **E**lasticsearch - a distributed RESTful search engine which stores all of the collected data.
* **L**ogstash - The data processing component of the Elastic Stack whichsends incoming data to Elasticsearch.
* **K**ibana - A web interface for searching and visualizing logs.
* **B**eats - Lightweight, single-purpose data shippers that can send datat from hundreds or thousands of machines to either Logstash or Elasticsearch
