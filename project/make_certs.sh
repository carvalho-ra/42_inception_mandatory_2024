#!/bin/bash

mkcert -key-file srcs/requirements/nginx/tools/${USER}.42.fr.key -cert-file srcs/requirements/nginx/tools/${USER}.42.fr.crt https://${USER}.42.fr

chmod 777 srcs/requirements/nginx/tools/${USER}.42.fr.key srcs/requirements/nginx/tools/${USER}.42.fr.crt