#[starknet::component]
mod PausableComponent {
    use openzeppelin::security::interface::IPausable;

    use starknet::ContractAddress;
    use starknet::get_caller_address;

    #[storage]
    struct Storage {
        Pausable_paused: bool
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Paused: Paused,
        Unpaused: Unpaused,
    }

    /// Emitted when the pause is triggered by `account`.
    #[derive(Drop, starknet::Event)]
    struct Paused {
        account: ContractAddress
    }

    /// Emitted when the pause is lifted by `account`.
    #[derive(Drop, starknet::Event)]
    struct Unpaused {
        account: ContractAddress
    }

    mod Errors {
        const PAUSED: felt252 = 'Pausable: paused';
        const NOT_PAUSED: felt252 = 'Pausable: not paused';
    }

    #[embeddable_as(PausableImpl)]
    impl Pausable<
        TContractState, +HasComponent<TContractState>
    > of IPausable<ComponentState<TContractState>> {
        /// Returns true if the contract is paused, and false otherwise.
        fn is_paused(self: @ComponentState<TContractState>) -> bool {
            self.Pausable_paused.read()
        }
    }
