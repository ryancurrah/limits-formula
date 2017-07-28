require 'spec_helper'

describe package('login'), :if => os[:family] == 'debian' do
  it { should be_installed }
end

describe package('login'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe package('pam'), :if => os[:family] == 'centos' do
  it { should be_installed }
end

describe package('pam'), :if => os[:family] == 'fedora' do
  it { should be_installed }
end

describe package('pam'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('pam'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

describe package('sys-libs/pam'), :if => os[:family] == 'gentoo' do
  it { should be_installed }
end

describe package('login'), :if => os[:family] == 'mint' do
  it { should be_installed }
end

describe package('pam'), :if => os[:family] == 'suse' do
  it { should be_installed }
end

describe file('/etc/security/limits.conf') do
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match /^# User limit specification$/ }
  its(:content) { should match /^johndoe    hard    core    unlimited$/ }
  its(:content) { should match /^johndoe    hard    nproc    1000$/ }
  its(:content) { should match /^janedoe    hard    locks    300$/ }
  its(:content) { should match /^# Group limit specification$/ }
  its(:content) { should match /^@employees    hard    cpu         5$/ }
  its(:content) { should match /^@employees    hard    nproc         500$/ }
end
