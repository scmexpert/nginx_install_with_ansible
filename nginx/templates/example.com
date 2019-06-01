server {
        listen 80;
        listen [::]:80;

        root /var/www/{{ site_name }}/html;
        index index.html index.htm index.nginx-debian.html;

        server_name {{ site_name }} {{ site_url }};

        location / {
                try_files $uri $uri/ =404;
        }
}