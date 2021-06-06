require 'spec_helper'
　#gitがインストールされているか
describe package('git'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#nginxがインストールされているか
describe package('nginx'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#rubyがインストールされているか
describe package('ruby'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#railsがインストールされているか
describe package('rails'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#railsがインストールされているか
describe package('yarn'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#mariadbがインストールされていないか
describe package('mariadb'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#mysqlがインストールされているか
describe package('mysql-community-client'), :if => os[:family] == 'amazon' do
  it { should be_installed }
end

#nginxが起動しているか
describe service('nginx'), :if => os[:family] == 'amazon' do
  it { should be_enabled }
  it { should be_running }
end

　#22番ポートが空いているか
describe port(22) do
  it { should be_listening }
end

　#80番ポートが空いているか
describe port(80) do
  it { should be_listening }
end

　#3000番ポートが空いているか
describe port(3000) do
  it { should be_listening }
end

 #パブリックルートテーブルのルーティングをテストしたいのですが、記述方法がわかりませんでした。
describe routing_table do
  it do
    should have_entry(
      :destination => '0.0.0.0/0', # ここは設定通り
      :interface   => 'eth1',　　#ここもよくわからず...
      :gateway     => '',　　　#インターネットゲートウェイのプライベートIP？
    )
  end
end


#niginxの設定確認
describe file('/etc/nginx/conf.d/sample_app.conf') do
  it { should exist }
   its(:content) { should match server_name <EC2のPublic IP> }
end

#niginxの設定確認
describe file('config/puma.rb') do
  it { should exist }
   its(:content) { should match bind "unix://#{Rails.root}/tmp/sockets/puma.sock" }
end

