# Chef Workstation Setup

Once the Chef Server is completed, go to Administration tab and select your organisation. 
Download the Chef Development kit and unzip the package.
Change the working directory to 'chef-repo'.
Download and install the package of Chef workstation.

### Using Knife utility

1. Bootsrap Nodes:

- Nodes can be registered with Chef Server using the following command:

```sh
knife bootstrap -x <remote_user> -P <remote_user_password> -N <remote_node_name>
```
Above command has following effect:

- Installs Chef-client on remote machine
- Generates keys
- Gets registered with the server with the name specified in <remote_node_name>
- Checks for the run_list[]

2. Create Cookbook

```sh
knife cookbook create consul
```
Above command has following effect:

- Creates the Cookbook with the name 'consul'
- Creates default file structure for the Cookbook.

3. Upload Cookbook on Chef Server

```sh
knife cookbook upload consul
```
Above command has following effect:

- Uploads the Cookbook 'consul' on the Chef Server

4. Setting Runlist for Nodes[Assuming name of the node to be 'LoadBalancer']

```sh
knife node run_list add LoadBalancer 'recipe[consul]'
```
Above command has following effect:

- Sets a sequence of Cookbook/Recipe(s) to be executed on a node when 'chef-client' command is executed.
- For the given example, one Cookbook will be executed i.e. 'consul' for the node 'LoadBalancer' when 'chef-client' command is executed there.

5. Using 'chef-client' command
- 'chef-client' command can be executed in two ways i.e. on that node or from Chef Workstation
- For using the command directly on the node use following command:
```sh
sudo chef-client
```
- Using 'Knife' utility:
```sh
knife ssh <IP of remote machine> 'sudo chef-client' --manual-list --ssh-user <remote_user> --ssh-password <remote_user_password>
```


### Using Roles:

- Roles are used to set a specific Role for the Node. Ex. we want a node to work as a load balancer, we will create a Role for the node and set list of sequence of Cooksbooks to be executed on the node. Hence by creating Roles, we can avoid setting run_list ever time and use already created Role.

Following are the steps to create Roles:

1. Create Role named 'load_balancer':

```sh
knife role create load_balancer
```
It will open an editor with a JSON template, wherein we have to just set the run_list for the Role

2. Adding Data to the file

```sh
{
  "name": "load_balancer",
  "description": "",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
  },
  "chef_type": "role",
  "run_list": [

	"recipe[consul]",
        "recipe[consul_server]",
	"recipe[haproxy]",
        "recipe[consul_template]"

  ],
  "env_run_lists": {
  }
}
```
3. Save the file. It will be uploaded to the Chef Server.
4. Edit the Node to use the role:

```sh
knife node edit LoadBalancer
```

5. Make following changes:

```sh
{
  "name": "LoadBalancer",
  "chef_environment": "_default",
  "normal": {
    "tags": [

    ]
  },
  "run_list": [
    "role[load_balancer]"
  ]
}
```

6. Execute 'chef-client -o "role[load_balancer]"' on the node 'LoadBalancer'.
