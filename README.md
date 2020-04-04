# ITC-2020 - Web Applications Development - GoGoGnomes - Documentation

## TODO:
1. change the python app to listen on port 80
1. remove phpmyadmin container from prod
1. finish this README
1. Remove the TODO section

---
---
---

# Running Instructions
**Dependencies:** Docker community edition & Docker-compose  
> Install docker and docker-compose by following the instructions for your distribution here: https://docs.docker.com/install/  

to launch simply run `docker-compose build` & `docker-compose up` from the project directory.  
ensure port 80 is accessible on the host machine.  


<!-- DOCUMENTATION INSTRUCTIONS!
Documentation (10 points)
README file that describes the architecture/design of the systems, enumerate and explain
features of the system, show how different programs interact. If you implement new features,
clearly state them. This document also explains the database design and shows how tables are
related. Please follow this format for submission:
Web Applications Development – Team Name - Documentation
Application Deliverables and Documentation must be submitted by Sunday, April 5th @
11:59PM PST via Google Form. -->

# Documentation
## Docker/Containerization
Docker (with docker-compose) is used for containerizing all of the needed software for the site, namely the python(Django) web app and the mySQL database. This was chosen because it allows for us to quickly iterate on our code and run on multiple machines with minimal friction.  
We use docker-compose to orchestrate the software containers, creating a private network and limiting access to the containers through the docker network, with this setup the database is inaccessible to all (including the host machine) with the exception being the web application, reducing attack surface and increasing security.

## Database
### Table Relations: 
Holidays        |    | SampleCards 
----------------|----| --------------
HolidayName (PK)|    | Image_ID (PK)
HolidayID       | <- | HolidayID (FK)
|               |    | Image
|               |    | Image_Filename
|               |    | user_img_pos_x
|               |    | user_img_pos_y
|               |    | resize_img_len
|               |    | resize_img_wid

### Table Entities:
`Holidays Table` |                                       |
-----------------|---------------------------------------|
HolidayName (PK) | String identifying holiday names      |
HolidayID        | Integer identifier for holiday names  |

---

`SampleCards Table`|                                         |
-------------------|-----------------------------------------|
Image_ID (PK)  | Auto_Incrementing Integer identifier for sample Images |
HolidayID (FK) | Foreign Key pointing to `Holidays` table |
Image          | Blob holding raw image data |
Image_Filename | String for filename |
user_img_pos_x | Integer for X coordinate of template position |
user_img_pos_y | Integer for Y coordinate of template position |
resize_img_len | Integer for template image length in pixels |
resize_img_wid | Integer for template image width in pixels |

## Code:
TODO plz
