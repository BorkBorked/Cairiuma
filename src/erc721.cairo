%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.registers import get_fp_and_pc
from starkware.cairo.common.serialize import serialize_word

@contract_interface
namespace IERC721:
    func transferFrom(sender: felt, recipient: felt, tokenId: felt):
    end

    func balanceOf(owner: felt) -> (balance: felt):
    end
end

@storage_var
func owners(token_id: felt) -> (owner: felt):
end

@storage_var
func balances(owner: felt) -> (balance: felt):
end
