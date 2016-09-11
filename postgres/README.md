# seven-databases - Postgres

## Using vagrant

1. If you are using vagrant, simply navigate to the '[path-to-folder]/seven-databases/vagrant' folder, and run 'vagrant up postgres'. This will download and install postgres for you. Now we want to be able to use the pgadmin GUI to look at our db so do the following:
        
    •   On your laptop OS (not the vm), download pgadmin3 https://www.pgadmin.org/
    
    •   Open pgadmin, click the 'Add a connection to a server' button at the top left
    
    •   We will be connecting pgadmin to the PostgreSQL server running in our VM, so we need to tell pgadmin how to SSH into the VM
    
            •   Tunnel host:    localhost
            
            •   Tunnel port:    2222
            
            •   username:       vagrant
            
            •   password:       vagrant
            
    •   We want to now tell pgadmin how to access the DB with the right credentials
    
            •   name:           [any name, I chose sevenDBsPostgres]
            
            •   host:           localhost
            
            •   port:           5432
            
            •   username:       vagrant

            •   password:       vagrant

## Without vagrant

1. If you are not using vagrant, download and install PostGres 9.5.3.1 (avoid beta version)
    
    •	Setup admin password that you can remember for SuperUser

2. Download pgadmin3-1.22.1 (GUI program to interact with SQL)

    •	PGAdmin is the UI that connects to the postGresSQL database created during setup
    •	Take note of the username/password for the database superuser
    •	Use default Port number = 5432

3.  Navigate to PSQL console under the Plugins tab to execute commands and run through the exercises
    •	Take note that the commands are case sensitive

4.  Online docs are found here
    •	https://www.postgresql.org/docs/9.5/static/index.html

Note from Mike regarding previous setup:

    To load extensions 'create extension …..' from shell works fine

(which will make sense when you get to it)

