# tf_data_aggregator

The idea behind the IaaC here was to provision various resources in Azure and deploy an app backend built with Python and Fast API. 
An Azure Kubernetes Service was planned to be tied in with a service principal account. The Python app would have been deployed to the AKS cluster.
In addition, a basic front end site was planned to be deployed, or even just a simple Swagger UI page, which is built in to FastAPI.
The backend app can be found [here](https://github.com/smithjustinm/yellow_taxi). Currently, the backend is only setup for Docker deployment.

## Basic Overview
 - The infrastructure was intended to be created using Terraform—though I did get too far along before realizing I did not have permissions to create most of the resources I defined. In the end, I found a way to deploy a docker image to a web app on the Azure portal via the container registry. This too, however, was not possible with the level of permissions.
 - My iteration process felt mostly like I spent a lot of time on the hashicorp site getting helpful boilerplate code.
 - As stated above, the site was planned to be deployed to an AKS cluster, but I did not get that far due to permissions issues.
 - There was quite a lot I learned during this process:
   - Starting from scratch is hard with IaaC. There are a lot of ways to organize code and on one's own the impact is lessened.
   - Again, starting from scratch and basically working on it alone, the issues I ran into would have easily been solved with minimal help from someone else (e.g. Github actions for terraform)
   - This, and other take-home projects, have shown me how much I appreciate collaboration. Iterating through a project rarely happens in a vacuum for me.
   - Finally, I am not a front end developer and based on my code, I gravitate toward backend development.
 - There were two very challenging parts:
   - The first was getting the Terraform code to work with minimal permissions. I spent a lot of time writing code without applying it through a Github action or locally. This created the scenario where I have a lot of code that isn't working—to my disappointment.
   - The second was planning for too much. I am quite familiar with the architecture choices I made here, but that was also the problem.
