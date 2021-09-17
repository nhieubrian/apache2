## Description:

This is an apache2 webserver build that is fit to run on Kubernetes, Docker and Gitlab CI/CD. The build itself is very plain and can be easily editted to fit a new "base" build. 

## Start Up:

Note: This current apache2 build is attaching a storage volume (SeaweedFS) to handle all file streams that the webserver will be displaying. 

*In order to revert this:*

![SeaweedFS](/images/82df11f7ff3a48c79e3c573c49f333c7.png)
  
 - Simply remove these lines from the apache2.yml file and skip the next section!
 
 *In order to keep the volume:*
 
 - You'll need to create your own SeaweedFS volume! [Here's my .yaml file!](https://gitlab.nrp-nautilus.io/nhieubrian/novnc-digital-media-lab/-/blob/master/dml-seaweed.yaml). This is how it's built on the Nautilus PRP website.
 - The beauty of this method is that all of your files will be displayed at the main site of the webserver! For me, this allows me to use a Virtual Machine to access the Seaweed drives.
 
 ```
 kubectl create -f [raw of apache2-service-ingress.yml]
 kubectl create -f [raw of apache2.yml]
 ```
 
 [Link to webserver!](https://apache.nrp-nautilus.io/). <- This url is written in the ingress!
 
 
