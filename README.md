#### How to setup jenkins for automation deployment scritps


* [localhost] Pull a repository to and Change environment server info want to deploy IN project-crm-c/ansible/inventory/host.init then push to change this:

    ```<HOSTNAME> ansible_ssh_host=<YOUR_IP_SERVER> ansible_ssh_port=<PORT>```

* [Jenkins] The repository is private you must to generate rsa_key on jenkins server to and added in your github setting > SSH and GPG keys > New SSH Key

* [Jenkins console] Create and choose a jobs with `freestyle` to and following setup environment this:

```
    Choose : 2 Sections "This project is parameterized"
             - String Parameter
                - Defind Name for variables for Name of customer
             - String Parameter
                - Defind Nginx Port for variables for expose Port of container

    Choose : "Source Code Management"
             - git 
                - Define Repository URL : https://github.com/kawinpromsopa/project-crm-c.git
             - Credentials
                - Choose your Credentials github account

    Choose : "Build Environment"
             - Delete workspace before build starts
    
    Choose : "Build"
             - Execute Shell: 
             
             cd ${WORKSPACE}/ansible ansible-playbook -i inventory/host.init deployment.yml -e "customer_name=$customer_name nginx_port=$nginx_port"
```


             