use starknet::{
    StorageBaseAddress, Store, SyscallResult, storage_read_syscall, storage_write_syscall,
    storage_address_from_base_and_offset
};

// ANCHOR: StorageAccessImpl
impl StoreFelt252Array of Store<Array<felt252>> {
    fn read(address_domain: u32, base: StorageBaseAddress) -> SyscallResult<Array<felt252>> {
        StoreFelt252Array::read_at_offset(address_domain, base, 0)
    }
