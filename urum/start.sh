docker run -d --restart=unless-stopped --memory 2048m --memory-swap 3072m -v /home/turkic/logs:/home/apertium/logs -p 8786:2737 --name apertium-uum apertium-uum
