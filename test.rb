require 'spec_helper'

describe package('git'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

describe package('nginx'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

describe package('mysql'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

describe service('nginx'), :if => os[:family] == 'amazon' do
  it { should be_enabled }
  it { should be_running }
end

describe service('puma'), :if => os[:family] == 'amazon' do
  it { should be_enabled }
  it { should be_running }
end

describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe port(80) do
  it { should be_listening }
end

describe port(3000) do
  it { should be_listening }
end

describe routing_table do
  it do
    should have_entry(
      :destination => '192.168.100.0/24',
      :interface   => 'eth1',
      :gateway     => '192.168.10.1',
    )
  end
end


describe 'MySQL config parameters' do
  context mysql_config('innodb-buffer-pool-size') do
    its(:value) { should > 100000000 }
  end

  context mysql_config('socket') do
    its(:value) { should eq '/tmp/mysql.sock' }
  end
end