Application-Deployment
This project demonstrates the end-to-end deployment of a full-stack movie application using DevOps practices and AWS cloud infrastructure.
The pipeline is fully automated using Jenkins CI/CD and integrates
SonarQube → Code quality and vulnerability checks
Docker → Containerization of the application
AWS EKS (Kubernetes) → Orchestration and deployment
EFK Stack (Elasticsearch, Fluentd, Kibana) → Centralized logging and monitoring
Email Notifications → Build status updates to DevOps engineers 

Using terraform created resources<img width="940" height="477" alt="image" src="https://github.com/user-attachments/assets/aaafa3ac-2607-4d08-92f7-a64e1709c47a" />
<img width="940" height="472" alt="image" src="https://github.com/user-attachments/assets/f4feb57a-d045-4f89-ac00-ad90df2f8800" />
<img width="940" height="481" alt="image" src="https://github.com/user-attachments/assets/7c1e5a17-e6d3-47eb-a3a9-96aebc765895" />

Using ansible installed jenkins and docker in their respective EC2 instance.
<img width="940" height="471" alt="image" src="https://github.com/user-attachments/assets/6b9a7119-6052-4633-80dd-78afb8ce35a3" />
<img width="940" height="480" alt="image" src="https://github.com/user-attachments/assets/2b7c3fd8-a1ba-45dd-93e9-5384eef6d8a3" />
<img width="940" height="470" alt="image" src="https://github.com/user-attachments/assets/3df71aa2-a6eb-4380-acfd-aceb69f2b250" />
Used jenkins master slave architecture <img width="940" height="466" alt="image" src="https://github.com/user-attachments/assets/abcd7ca7-4fba-40ed-b2c3-18f7a41def6e" />
Connected SonarQube and Jenkins checked the code quality <img width="940" height="523" alt="image" src="https://github.com/user-attachments/assets/1e5b9b73-9c46-483e-9ea4-e074f71c0257" />


Installed Kubectl, ekscluster and aws cli
<img width="940" height="243" alt="image" src="https://github.com/user-attachments/assets/f2dbf697-bb54-4e85-af5d-39257c13fe10" />
<img width="940" height="377" alt="image" src="https://github.com/user-attachments/assets/d847a608-e7b3-4301-b174-0e72bbeef326" />
Ran deployment and service file successfully.
The jenkins pipeline with full script build successfully. <img width="940" height="484" alt="image" src="https://github.com/user-attachments/assets/32524de4-103c-488d-a6d5-3a7d80fe9aee" />


After that installed EFK stack to capture logs.<img width="940" height="437" alt="image" src="https://github.com/user-attachments/assets/fb9091e8-ee3d-412e-8f14-788ce66a67b0" />
<img width="940" height="455" alt="image" src="https://github.com/user-attachments/assets/c1ce9de5-7a69-4af0-9f40-4864224aa400" />
<img width="940" height="519" alt="image" src="https://github.com/user-attachments/assets/a7c36f99-d84b-4a3b-a183-634ff81afb64" />

Using DNS name from loadbalancer accessed the website.
<img width="940" height="478" alt="image" src="https://github.com/user-attachments/assets/66bab01a-070d-4b39-b24e-9586dd1c94b1" />


Email notification also received of running it successfully.
<img width="940" height="384" alt="image" src="https://github.com/user-attachments/assets/bbf4eedc-563a-4c2a-a78a-f2af314cd656" />

That's it.
Thank YOU :)

