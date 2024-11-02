# Flask Application Repository
This project demonstrates a containerized Flask application integrated with Redis and MySQL. The application leverages Alibaba Cloud services for Redis and MySQL, with infrastructure as code (IaC) managed by Terraform.


# Infrastructure main components in Alibaba Cloud.

Virtual Private Cloud (VPC): Secure, isolated network with subnets for public and private resources.
NAT Gateway: Allows private subnet instances to access the internet securely.
Network Load Balancer (NLB): Distributes incoming requests to Flask instances for load balancing.
Elastic Compute Service (ECS): Instances hosting the Flask application, with private IPs accessible through NLB.
Managed Redis (KVStore): Redis instance for caching, with restricted access from the private subnet.
Managed MySQL (RDS): MySQL database instance with a private endpoint, accessible only from within the VPC.
