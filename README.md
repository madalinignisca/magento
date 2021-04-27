# Run Magento using Docker
_The container is usable on Kubernates also_

NOTE: This is not a real production setup, but can be used as an inspiration.

The Dockerfile will build, using your own credentials from Magento Marketplace
the minimal apache+php to run Magento.

The docker-compose.yaml file contains the ideal setup for all required and
optional services Magento needs and can consume, meaning also Elastic Search
is included out of the box.

PHP 7.4 was used, as to benefit for PHP APM for Elastic Stack Observability.
Plan is to switch to 8.0 the minute Elastic releases stable extension for 8.0.

For production, adapt to your needs, and don't take this as perfect for your
needs. You still need to have a service in front that does SSL termination and
provides additional protection from outside (DDOS, WAF etc.). Do not underestimate
your hardware requirements. Magento is a bit of resource hungry and it's
data services are not light as well. Production for Magento should be of
minimal 4 cpus and 8GB of ram, and even more if spread on multiple servers.
Alternative, using managed database, cache and Elastic Cloud should be prefered
over self maintaining them, as the cost of human support is higher than
dedicated managed services.

I can provide **commercial support** for packing, deploying and maintaining Docker
or Kubernetes deployments for Magento on public cloud, including AWS, Azure,
Google Cloud, Digital Ocean, Hetzner or others.
