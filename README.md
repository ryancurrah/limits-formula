[![Build Status](https://travis-ci.org/ryancurrah/limits-formula.svg?branch=master)](https://travis-ci.org/ryancurrah/limits-formula)

# limits-formula

SaltStack formula for setting user limits in PAM module

## Description

The pam_limits.so module applies ulimit limits, nice priority and number of simultaneous login sessions
limit to user login sessions. This description of the configuration file syntax applies to the
/etc/security/limits.conf file and *.conf files in the /etc/security/limits.d directory.

## Tests

The Travis CI tests run the state on a Ubuntu server. By running the state it checks that there is no syntax errors and that it works for Ubuntu. Other operating systems are NOT tested therefore have a risk of not working on them. ServerSpec is used to verify that the state installed the proper packages and created limits.conf with the proper owner, group, mode and settings.

## Example Pillar

```yaml
limits:
  users:
    johndoe:
      - limit_type: hard
        limit_item: core
        limit_value: unlimited
      - limit_type: hard
        limit_item: nproc
        limit_value: 1000
    janedoe:
      - limit_type: hard
        limit_item: locks
        limit_value: 300
  groups:
    employees:
      - limit_type: hard
        limit_item: cpu
        limit_value: 5
      - limit_type: hard
        limit_item: nproc
        limit_value: 500
```

## More info about limits

[http://linux.die.net/man/5/limits.conf](http://linux.die.net/man/5/limits.conf)

## Support

* Debian
* Ubuntu
* Centos
* Fedora
* RedHat
* Amazon
* Gentoo
* Mint
* SUSE

## Contributors

* danoe
* tampakrap
* cboltz
