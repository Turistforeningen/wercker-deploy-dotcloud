# dotcloud-deploy

dotCloud deploy step for wercker. Deploy ypur code automaticly to your dotCloud
when all tests are green.

[![wercker status](https://app.wercker.com/status/f6705fc6d007f2d4aa40066bd017a7fc/s "wercker status")](https://app.wercker.com/project/bykey/f6705fc6d007f2d4aa40066bd017a7fc)

# Options

- `keyname` name of SSH key file (required)
- `dcemail` dotCloud user email (required)
- `dcpassword` dotCloud user password (required)
- `appname` dotCloud application name (required)
- `deployname` dotCloud application deploy name (optional)

# Example

```yaml
deploy:
  steps:
    - add-to-known_hosts:
      hostname: dotcloudapp.com
      fingerprint: 8b:1d:ac:91:0c:92:a8:ea:3c:95:1b:d0:fb:df:f3:13

    - starefossen/dotcloud-deploy:
      keyname: SSHKEY
      dcemail: $DC_EMAIL
      dcpassword: $DC_PASSWORD
      appname: $APPNAME
```

# License

The MIT License (MIT)
