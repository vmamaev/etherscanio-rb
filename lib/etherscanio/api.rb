module Etherscanio
  class Api
    def initialize(api_key = nil, net_name = 'mainnet')
      @api_key = api_key
      @net_name = net_name
    end

    def account_txlist(address, startblock, endblock = nil, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new(@net_name, 'account', 'txlist')
      call.api_key = @api_key
      call.address = address
      call.startblock = startblock
      call.endblock = endblock
      call.page = page
      call.offset = offset
      call.sort = sort
      call.fetch
    end

    def account_txlistinternal(address, startblock, endblock, sort = 'desc', page = nil, offset = nil)
      call = Etherscanio::Call.new(@net_name, 'account', 'txlistinternal')
      call.api_key = @api_key
      call.address = address
      call.startblock = startblock
      call.endblock = endblock
      call.page = page
      call.offset = offset
      call.sort = sort
      call.fetch
    end

    def account_balance(address, tag)
      call = Etherscanio::Call.new(@net_name, 'account', 'balance')
      call.api_key = @api_key
      call.address = address
      call.tag = tag
      call.fetch
    end

    def account_getminedblocks(address, blocktype, page = nil, offset = nil)
      call = Etherscanio::Call.new(@net_name, 'account', 'getminedblocks')
      call.api_key = @api_key
      call.page = page
      call.offset = offset
      call.address = address
      call.blocktype = blocktype
      call.fetch
    end

    def account_balancemulti(address, tag)
      call = Etherscanio::Call.new(@net_name, 'account', 'balancemulti')
      call.api_key = @api_key
      call.address = address
      call.tag = tag
      call.fetch
    end

    def contract_getabi(address)
      call = Etherscanio::Call.new(@net_name, 'contract', 'getabi')
      call.api_key = @api_key
      call.address = address
      call.fetch
    end

    def transaction_getstatus(txhash)
      call = Etherscanio::Call.new(@net_name, 'transaction', 'getstatus')
      call.api_key = @api_key
      call.txhash = txhash
      call.fetch
    end

    def block_getblockreward(blockno)
      call = Etherscanio::Call.new(@net_name, 'block', 'getblockreward')
      call.api_key = @api_key
      call.blockno = blockno
      call.fetch
    end
  end
end
