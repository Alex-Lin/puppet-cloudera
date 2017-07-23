#!/usr/bin/env rspec

require 'spec_helper'

describe 'cloudera::cdh::sqoop::metastore', :type => 'class' do

#  context 'on a non-supported operatingsystem' do
#    let :facts do {
#      :osfamily        => 'foo',
#      :operatingsystem => 'bar'
#    }
#    end
#    it 'should fail' do
#      expect {
#        should raise_error(Puppet::Error, /Module cloudera is not supported on bar/)
#      }
#    end
#  end

  context 'on a supported operatingsystem, default parameters' do
    context 'CentOS' do
#      let(:params) {{}}
      let :facts do {
        :osfamily        => 'RedHat',
        :operatingsystem => 'CentOS',
        :operatingsystemrelease => '6.3',
        :operatingsystemmajrelease => '6',
        :architecture           => 'x86_64'
      }
      end
      it { should contain_package('sqoop-metastore').with_ensure('present') }
      it { should contain_service('sqoop-metastore').with(
        :ensure     => 'running',
        :enable     => true,
        :hasrestart => true,
        :hasstatus  => true
      )}
    end

    context 'Ubuntu' do
      let :facts do {
        :osfamily        => 'Debian',
        :operatingsystem => 'Ubuntu',
        :operatingsystemrelease => '12.04',
        :architecture           => 'amd64',
        :lsbdistcodename        => 'precise',
        :lsbdistid              => 'Ubuntu',
        :lsbmajdistrelease      => '12'
      }
      end
      it { should_not contain_service('sqoop-metastore') }
    end
  end
end
