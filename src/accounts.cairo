#[starknet::component]
mod AccountComponent {
    use starknet::get_caller_address;
    use starknet::get_contract_address;
    use starknet::get_tx_info;
    use starknet::account::Call;
    use ecdsa::check_ecdsa_signature;
    use openzeppelin::account::interface;
    use openzeppelin::introspection::src5::SRC5Component::InternalTrait as SRC5InternalTrait;
    use openzeppelin::introspection::src5::SRC5Component;



    const TRANSACTION_VERSION: felt252 = 1;
    // 2**128 + TRANSACTION_VERSION
    const QUERY_VERSION: felt252 = 0x100000000000000000000000000000001;

    #[storage]
    struct Storage {
        Clé_publique_compte: felt252
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        AjoutOwner: AjoutOwner,
        RetraitOwner: RetraitOwner
    }

    #[derive(Drop, starknet::Event)]
    struct AjoutOwner {
        Nouveau_Owner: felt252
    }

    #[derive(Drop, starknet::Event)]
    struct RetraitOwner {
        removed_owner_guid: felt252
    }

    mod Errors {
        const INVALID_CALLER: felt252 = 'Account: invalid caller';
        const INVALID_SIGNATURE: felt252 = 'Account: invalid signature';
        const INVALID_TX_VERSION: felt252 = 'Account: invalid tx version';
        const UNAUTHORIZED: felt252 = 'Account: unauthorized';
    }

    #[embeddable_as(SRC6Impl)]
    impl SRC6<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::ISRC6<ComponentState<TContractState>> {
        /// Exécute une liste d'appels depuis le compte.
        ///
        /// Exigences :
        ///
        /// - La version de la transaction doit être `TRANSACTION_VERSION` pour les transactions réelles.
        /// Pour les simulations, la version doit être `QUERY_VERSION`. 

        fn __execute__(
            self: @ComponentState<TContractState>, mut calls: Array<Call>
        ) -> Array<Span<felt252>> {
            // Éviter les appels provenant d'autres contrats
            // https://github.com

            let sender = get_caller_address();
            assert(sender.is_zero(), Errors::INVALID_CALLER);

            // Vérifier la version de la transaction

            let tx_info = get_tx_info().unbox();
            let version = tx_info.version;
            if version != TRANSACTION_VERSION {
                assert(version == QUERY_VERSION, Errors::INVALID_TX_VERSION);
            }

            _execute_calls(calls)
        }

        /// Vérifie la validité de la signature pour la transaction en cours.
        /// Cette fonction est utilisée par le protocole pour vérifier les transactions `invoke`.

        fn __validate__(self: @ComponentState<TContractState>, mut calls: Array<Call>) -> felt252 {
            self.validate_transaction()
        }

        /// Vérifie que la signature donnée est valide pour le hash donné.

        fn is_valid_signature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Array<felt252>
        ) -> felt252 {
            if self._is_valid_signature(hash, signature.span()) {
                starknet::VALIDATED
            } else {
                0
            }
        }
    }

    #[embeddable_as(DeclarerImpl)]
    impl Declarer<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IDeclarer<ComponentState<TContractState>> {
        /// Vérifie la validité de la signature pour la transaction en cours.
        /// Cette fonction est utilisée par le protocole pour vérifier les transactions `declare`.

        fn __validate_declare__(
            self: @ComponentState<TContractState>, class_hash: felt252
        ) -> felt252 {
            self.validate_transaction()
        }
    }

    #[embeddable_as(DeployableImpl)]
    impl Deployable<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IDeployable<ComponentState<TContractState>> {
        /// Vérifie la validité de la signature pour la transaction en cours.
        /// Cette fonction est utilisée par le protocole pour vérifier les transactions de `deploy_account`.

        fn __validate_deploy__(
            self: @ComponentState<TContractState>,
            class_hash: felt252,
            contract_address_salt: felt252,
            public_key: felt252
        ) -> felt252 {
            self.validate_transaction()
        }
    }

    #[embeddable_as(PublicKeyImpl)]
    impl PublicKey<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IPublicKey<ComponentState<TContractState>> {
        /// Renvoie la clé publique actuelle du compte.

        fn get_public_key(self: @ComponentState<TContractState>) -> felt252 {
            self.Clé_publique_compte.read()
        }

        /// Définit la clé publique du compte à `new_public_key`.
        ///
        /// Exigences :
        ///
        /// - L'appelant doit être le contrat lui-même.
        ///
        /// Émet un événement `RetraitOwner`.

        fn set_public_key(ref self: ComponentState<TContractState>, new_public_key: felt252) {
            self.assert_only_self();
            self.emit(RetraitOwner { removed_owner_guid: self.Clé_publique_compte.read() });
            self._set_public_key(new_public_key);
        }
    }

    /// Ajoute le support de camelCase pour `ISRC6`.

    #[embeddable_as(SRC6CamelOnlyImpl)]
    impl SRC6CamelOnly<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::ISRC6CamelOnly<ComponentState<TContractState>> {
        fn isValidSignature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Array<felt252>
        ) -> felt252 {
            self.is_valid_signature(hash, signature)
        }
    }

    /// Ajoute le support de camelCase pour `ISRC6`.

    #[embeddable_as(PublicKeyCamelImpl)]
    impl PublicKeyCamel<
        TContractState,
        +HasComponent<TContractState>,
        +SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of interface::IPublicKeyCamel<ComponentState<TContractState>> {
        fn getPublicKey(self: @ComponentState<TContractState>) -> felt252 {
            self.Clé_publique_compte.read()
        }

        fn setPublicKey(ref self: ComponentState<TContractState>, newPublicKey: felt252) {
            self.set_public_key(newPublicKey);
        }
    }

    #[generate_trait]
    impl InternalImpl<
        TContractState,
        +HasComponent<TContractState>,
        impl SRC5: SRC5Component::HasComponent<TContractState>,
        +Drop<TContractState>
    > of InternalTrait<TContractState> {
        /// Initialise le compte en définissant la clé publique initiale
        /// et en enregistrant l'identifiant de l'interface ISRC6.

        fn initializer(ref self: ComponentState<TContractState>, public_key: felt252) {
            let mut src5_component = get_dep_component_mut!(ref self, SRC5);
            src5_component.register_interface(interface::ISRC6_ID);
            self._set_public_key(public_key);
        }

        /// Vérifie que l'appelant est le compte lui-même. Sinon, cela annule l'opération.

        fn assert_only_self(self: @ComponentState<TContractState>) {
            let caller = get_caller_address();
            let self = get_contract_address();
            assert(self == caller, Errors::UNAUTHORIZED);
        }

        /// Valide la signature pour la transaction en cours.
        /// Retourne la chaîne courte `VALID` si elle est valide, sinon cela annule l'opération.

        fn validate_transaction(self: @ComponentState<TContractState>) -> felt252 {
            let tx_info = get_tx_info().unbox();
            let tx_hash = tx_info.transaction_hash;
            let signature = tx_info.signature;
            assert(self._is_valid_signature(tx_hash, signature), Errors::INVALID_SIGNATURE);
            starknet::VALIDATED
        }

        /// Définit la clé publique sans valider l'appelant.
        /// L'utilisation de cette méthode en dehors de la fonction `set_public_key` est déconseillée.
        ///
        /// Émet un événement `AjoutOwner`.

        fn _set_public_key(ref self: ComponentState<TContractState>, new_public_key: felt252) {
            self.Clé_publique_compte.write(new_public_key);
            self.emit(AjoutOwner { Nouveau_Owner: new_public_key });
        }

        /// Indique si la signature donnée est valide pour le hachage donné
        /// en utilisant la clé publique actuelle du compte.

        fn _is_valid_signature(
            self: @ComponentState<TContractState>, hash: felt252, signature: Span<felt252>
        ) -> bool {
            let valid_length = signature.len() == 2_u32;

            if valid_length {
                check_ecdsa_signature(
                    hash, self.Clé_publique_compte.read(), *signature.at(0_u32), *signature.at(1_u32)
                )
            } else {
                false
            }
        }
    }

    fn _execute_calls(mut calls: Array<Call>) -> Array<Span<felt252>> {
        let mut res = ArrayTrait::new();
        loop {
            match calls.pop_front() {
                Option::Some(call) => {
                    let _res = _execute_single_call(call);
                    res.append(_res);
                },
                Option::None(_) => { break (); },
            };
        };
        res
    }

    fn _execute_single_call(call: Call) -> Span<felt252> {
        let Call{to, selector, calldata } = call;
        starknet::call_contract_syscall(to, selector, calldata.span()).unwrap()
    }
}
