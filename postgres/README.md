# seven-databases - Postgress

Instructions:

1. If you are using vagrant, simply navigate to the '[path-to-folder]/seven-databases/vagrant' folder, and run 'vagrant up postgres'. This will download and install postgres for you. Now we want to be able to use the pgadmin GUI to look at our db so do the following:

    •   ssh into the vm by running 'vagrant ssh postgres'
    
    •   setup a password for the linux user 'postgres' by running 'sudo passwd postgres'
    
    •   create a password for the PostgreSQL user 'postgres' by switching users to postgres and opening up psql
    
        a)  switch to the postgres linux user with 'su - postgres' and supplying the password your setup in the previous step
        
        b)  starting the Postgres command line interface with 'psql'
        
        c)  running 'ALTER USER postgres PASSWORD '[ilovehamburgers]' (replacing ilovehamburgers with your own password of choice) into the psql prompt that looks like this 'postgres=#'
        
    •   On your laptop OS (not the vm), download pgadmin3 https://www.pgadmin.org/
    
    •   Open pgadmin, click the 'Add a connection to a server' button at the top left
    
    •   We will be connecting pgadmin to the PostgreSQL server running in our VM, so we need to tell pgadmin how to SSH into the VM
    
            •   Tunnel host:    192.168.33.11
            
            •   Tunnel port:    22
            
            •   username:       postgres
            
            •   password:       [your postgres linux user password]
            
    •   We want to now tell pgadmin how to access the DB with the right credentials
    
            •   name:           [any name, I chose sevenDBsPostgres]
            
            •   host:           localhost
            
            •   port:           5432
            
            •   username:       postgres
            
2. Else if you are not using vagrant, download and install PostGres 9.5.3.1 (avoid beta version)
    
    •	Setup admin password that you can remember for SuperUser

3. Download pgadmin3-1.22.1 (GUI program to interact with SQL)

    •	PGAdmin is the UI that connects to the postGresSQL database created during setup
    •	Take note of the username/password for the database superuser
    •	Use default Port number = 5432

4.  Navigate to PSQL console under the Plugins tab to execute commands and run through the exercises
    •	Take note that the commands are case sensitive

5.  Online docs are found here
    •	https://www.postgresql.org/docs/9.5/static/index.html

Note from Mike regarding previous setup:

    To load extensions 'create extension …..' from shell works fine

(which will make sense when you get to it)

