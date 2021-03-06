require 'bundler/setup'
require 'webmock/rspec'
require './lib/etherscanio/api'
require './lib/etherscanio/call'

account_balance_response = File.read('./spec/fixtures/account/balance.json')
account_balance_uri = 'http://api.etherscan.io/api?action=balance&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&module=account&tag=latest'

multiple_account_balance_uri = 'http://api.etherscan.io/api?action=balancemulti&address=0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a,0x63a9975ba31b0b9626b34300f7f627147df1f526,0x198ef1ec325a96cc354c7266a038be8b5c558f67&module=account&tag=latest'
multiple_account_balance_response = File.read('./spec/fixtures/account/balance_multiple.json')

account_txlist_uri = 'http://api.etherscan.io/api?action=txlist&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&sort=desc&&startblock=0'
account_txlist_response = File.read('./spec/fixtures/account/txlist.json')

account_txlist_paging_uri = 'http://api.etherscan.io/api?action=txlist&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&page=1&sort=desc&startblock=0'
account_txlist_paging_response = File.read('./spec/fixtures/account/txlist.json')

account_txlist_internal_uri = 'http://api.etherscan.io/api?action=txlistinternal&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&sort=desc&startblock=0'
account_txlist_internal_response = File.read('./spec/fixtures/account/txlist_internal.json')

account_txlist_internal_paging_uri = 'http://api.etherscan.io/api?action=txlistinternal&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&endblock=99999999&module=account&offset=10&page=1&sort=desc&startblock=0'
account_txlist_internal_response = File.read('./spec/fixtures/account/txlist_internal.json')

account_getminedblocks_uri = 'http://api.etherscan.io/api?action=getminedblocks&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&blocktype=block&module=account'
account_getminedblocks_response = File.read('./spec/fixtures/account/getminedblocks.json')

account_getminedblocks_page_uri = 'http://api.etherscan.io/api?action=getminedblocks&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&blocktype=block&module=account&offset=10&page=1'

contract_getabi_uri = 'http://api.etherscan.io/api?action=getabi&address=0xde0b295669a9fd93d5f28d9ec85e40f4cb697bae&module=contract'
contract_getabi_response = File.read('./spec/fixtures/contract_getabi.json')

transaction_getstatus_uri = 'http://api.etherscan.io/api?action=getstatus&module=transaction&txhash=0x15f8e5ea1079d9a0bb04a4c58ae5fe7654b5b2b4463375ff7ffb490aa0032f3a'
transaction_getstatus_response = File.read('./spec/fixtures/transaction_getstatus.json')

block_getblockreward_uri = 'http://api.etherscan.io/api?action=getblockreward&blockno=2165403&module=block'
block_getblockreward_response = File.read('./spec/fixtures/block_getblockreward.json')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.before(:each) do
    stub_request(:get, account_balance_uri)
      .to_return(status: 200, body: account_balance_response, headers: {})

    stub_request(:get, multiple_account_balance_uri)
      .to_return(status: 200, body: multiple_account_balance_response, headers: {})

    stub_request(:get, account_txlist_uri)
      .to_return(status: 200, body: account_txlist_response, headers: {})

    stub_request(:get, account_txlist_paging_uri)
      .to_return(status: 200, body: account_txlist_paging_response, headers: {})

    stub_request(:get, account_txlist_internal_uri)
      .to_return(status: 200, body: account_txlist_internal_response, headers: {})

    stub_request(:get, account_txlist_internal_paging_uri)
      .to_return(status: 200, body: account_txlist_internal_response, headers: {})

    stub_request(:get, account_getminedblocks_uri)
      .to_return(status: 200, body: account_getminedblocks_response, headers: {})

    stub_request(:get, account_getminedblocks_page_uri)
      .to_return(status: 200, body: account_getminedblocks_response, headers: {})

    stub_request(:get, contract_getabi_uri)
      .to_return(status: 200, body: contract_getabi_response, headers: {})

    stub_request(:get, transaction_getstatus_uri)
      .to_return(status: 200, body: transaction_getstatus_response, headers: {})

    stub_request(:get, block_getblockreward_uri)
      .to_return(status: 200, body: block_getblockreward_response, headers: {})
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
