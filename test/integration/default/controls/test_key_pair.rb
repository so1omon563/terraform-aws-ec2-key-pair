# frozen_string_literal: true

include_controls 'inspec-aws'
require './test/library/common'

tfstate = StateFileReader.new
ec2_key_pair_id = tfstate.read['outputs']['ec2-key-pair']['value']['ec2_key_pair']['id'].to_s
imported_ec2_key_pair_id = tfstate.read['outputs']['imported-ec2-key-pair']['value']['ec2_key_pair']['id'].to_s

control 'default' do
  describe aws_secretsmanager_secret(secret_id: ec2_key_pair_id) do
    it { should exist }
  end
  describe aws_secretsmanager_secret(secret_id: imported_ec2_key_pair_id) do
    it { should exist }
  end
end
