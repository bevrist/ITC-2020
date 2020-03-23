# ITC-2020

# Running Instructions

Install Docker: https://docs.docker.com/install/  
to launch simply run `docker-compose down; docker-compose build; docker-compose up`  
visit http://localhost:8000/homepage for the django site and http://localhost:8081 for PhpMyAdmin  
MySQL username is `root` and password is `mypass123` --- `#FIXME: remove this at some point`  


--- 
---

# Dev Instructions:
## for VsCode users:
- open the remote explorer tab to the far left of vscode, 
- then click the plus symbol next to the 'containers' dropdown, and select "open current folder in container"
- once the docker container has been deployed, type `ctrl+~` symbols to open your terminal in vscode
- then in the GoGoGnomes dir run "`python manage.py runserver 0.0.0.0:8000`" in the terminal 
- you may now access the django app from `localhost:8000` and PhpMyAdmin from `localhost:8081` in your local web browser, you may also open your vscode extensions tab to install extensions into your dev container
- no need to follow below instructions, all prerequisites are installed according to the ./GoGoGnomes/requirements.txt file
- In the event you need to open more ports, in the remote explorer tab click the plus symbol next to 'forwarded ports' and open any requested ports to your local machine
--- 

## Need to have installed: 
   Python 3.8+  
   ~~Django 3.0.4+~~  
   `pip install -r ./GoGoGnomes/requirements.txt`


## To run locally:
   Type "python manage.py runserver" into Powershell<br>
   Access the page on - localhost:8000/homepage


