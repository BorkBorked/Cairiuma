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


func mint{syscall_ptr: felt*, range_check_ptr}(recipient: felt, token_id: felt):
    let (prev_owner) = owners.read(token_id)
    assert prev_owner == 0, "Token already minted"

    owners.write(token_id, recipient)
    let (balance) = balances.read(recipient)
    balances.write(recipient, balance + 1)
    return ()
end
