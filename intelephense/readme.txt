To encrypt:
... | openssl enc -aes256 -pbkdf2 -base64

To decrypt:
... | openssl aes-256-cbc -d -pbkdf2 -a

