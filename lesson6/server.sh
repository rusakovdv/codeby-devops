#!/bin/bash
mkdir -p /home/vagrant/.ssh
grep -q -f /vagrant/id_rsa.pub /home/vagrant/.ssh/authorized_keys || cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh