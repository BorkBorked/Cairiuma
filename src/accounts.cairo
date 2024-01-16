#[custom_0::custom_1]
mod AccountComponent {
    use custom_2::check_ecdsa_signature;
    use custom_3::custom_4::custom_5;
    use custom_3::custom_6::custom_7::SRC5Component::InternalTrait as custom_8;
    use custom_3::custom_6::custom_7::SRC5Component;
    use custom_0::custom_4::Call;
    use custom_0::get_caller_address;
    use custom_0::get_contract_address;
    use custom_0::get_tx_info;

    const custom_9: felt252 = 1;
    // 2**128 + custom_9
    const custom_10: felt252 = 0x100000000000000000000000000000001;

    #[custom_11]
    struct custom_12 {
        custom_13: felt252
    }

    #[custom_14]
    #[custom_15(custom_16, custom_0::custom_17)]
    custom_18 custom_17 {
        custom_19: custom_19,
        custom_20: custom_20
    }

    #[custom_15(custom_16, custom_0::custom_17)]
    struct custom_19 {
        custom_21: felt252
    }

    #[custom_15(custom_16, custom_0::custom_17)]
    struct custom_20 {
        custom_22: felt252
    }

    mod custom_23 {
        const custom_24: felt252 = 'custom_25: custom_26 custom_27';
        const custom_28: felt252 = 'custom_25: custom_26 custom_29';
        const custom_30: felt252 = 'custom_25: custom_26 custom_31 custom_32';
        const custom_33: felt252 = 'custom_25: custom_34';
    }

    #[custom_35(custom_36)]
    custom_37 custom_38<
        custom_39,
        +custom_40<custom_39>,
        +SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 custom_5::custom_42<custom_43<custom_39>> {
        /// custom_44 custom_45 custom_46 custom_41 custom_47 from custom_48 custom_4.
        ///
        /// custom_49:
        ///
        /// - custom_50 custom_51 custom_32 custom_52 custom_53 `custom_9` custom_54 custom_55 custom_56.
        /// custom_57 custom_58, custom_48 custom_32 custom_52 custom_53 `custom_10`.
        custom_59 custom_60(
            custom_61: @custom_43<custom_39>, custom_62 custom_47: custom_63<Call>
        ) -> custom_63<custom_64<felt252>> {
            // custom_65 custom_47 from custom_66 custom_67
            // custom_68://custom_69.custom_70/custom_71/custom_72-custom_67/custom_73/344
            custom_74 custom_75 = get_caller_address();
            assert(custom_75.custom_76(), custom_23::custom_24);

            // custom_77 custom_31 custom_32
            custom_74 custom_78 = get_tx_info().custom_79();
            custom_74 custom_32 = custom_78.custom_32;
            if custom_32 != custom_9 {
                assert(custom_32 == custom_10, custom_23::custom_30);
            }

            custom_80(custom_47)
        }
