# Chef Server Installation:

### Step 1: Install chef server package
* Use following command to install Chef Server

```sh
curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chef-server
```

### Step 2: Update chef-server config file

* Chef Server configuration file path is '/etc/opscode/chef-server.rb'

* Open the file using following command:

```sh
nano /etc/opscode/chef-server.rb
```

* Add following content to the file with appropriate details

```sh
server_name = "CHEF_SERVER_FQDN"
api_fqdn server_name
bookshelf['vip'] = server_name
nginx['url'] = "https://#{server_name}"
nginx['server_name'] = server_name
nginx['ssl_certificate'] = "/var/opt/opscode/nginx/ca/#{server_name}.crt"
nginx['ssl_certificate_key'] = "/var/opt/opscode/nginx/ca/#{server_name}.key"
```

### Step 3: Reconfigure chef-server and restart

* Reconfigure

```sh
chef-server-ctl reconfigure
```

### Step 4: Install management console and reporting features

```sh
sudo chef-server-ctl install chef-managesudo chef-server-ctl reconfiguresudo chef-manage-ctl reconfigure

sudo chef-server-ctl install opscode-reportingsudo chef-server-ctl reconfiguresudo opscode-reporting-ctl reconfigure
```

### Step 5: Create admin account and organization

```sh
sudo chef-server-ctl user-create jsmith Joe Smith joe.smith@example.com p4ssw0rd --filename jsmith.pem
```

> Replace with required values. 
> This command generates pem file that enables you enables you to run knife commands against the Chef server as an authenticated user.

```sh
sudo chef-server-ctl org-create 4thcoffee "Fourth Coffee, Inc." --association_user jsmith
```

This command outputs private key which was used in bootstraping but not in later versions.


### Step 6: Access the Chef Server

> Open the web browser and go to http://server-ip/login
> Login with created user credentials and download the starter kit. Extract the zip.


### Step 7: Download server SSL certificates

```sh
knife ssl fetch
```

* Verify the downloaded ssl certificates using following command

```sh
knife ssl check
```

Step 8: Check connection with server

```sh
knife client list
```
