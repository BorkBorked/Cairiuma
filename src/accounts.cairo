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

        /// custom_81 custom_48 custom_82 custom_41 custom_48 custom_29 custom_54 custom_48 custom_83 custom_51.
        /// custom_84 custom_85 custom_86 custom_87 custom_88 custom_48 custom_89 custom_90 custom_91 `custom_92` custom_56.
        custom_59 custom_93(custom_61: @custom_43<custom_39>, custom_62 custom_47: custom_63<Call>) -> felt252 {
            custom_61.custom_94()
        }

        /// custom_81 custom_95 custom_48 custom_96 custom_29 custom_86 custom_97 custom_54 custom_48 custom_96 custom_98.
        custom_59 custom_99(
            custom_61: @custom_43<custom_39>, custom_98: felt252, custom_29: custom_63<felt252>
        ) -> felt252 {
            if custom_61.custom_100(custom_98, custom_29.custom_101()) {
                custom_0::custom_102
            } else {
                0
            }
        }
    }

    #[custom_35(custom_103)]
    custom_37 custom_104<
        custom_39,
        +custom_40<custom_39>,
        +SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 custom_5::custom_105<custom_43<custom_39>> {
        /// custom_81 custom_48 custom_82 custom_41 custom_48 custom_29 custom_54 custom_48 custom_83 custom_51.
        /// custom_84 custom_85 custom_86 custom_87 custom_88 custom_48 custom_89 custom_90 custom_91 `custom_106` custom_56.
        custom_59 custom_107(
            custom_61: @custom_43<custom_39>, custom_108: felt252
        ) -> felt252 {
            custom_61.custom_94()
        }
    }

    #[custom_35(custom_109)]
    custom_37 custom_110<
        custom_39,
        +custom_40<custom_39>,
        +SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 custom_5::custom_111<custom_43<custom_39>> {
        /// custom_81 custom_48 custom_82 custom_41 custom_48 custom_29 custom_54 custom_48 custom_83 custom_51.
        /// custom_84 custom_85 custom_86 custom_87 custom_88 custom_48 custom_89 custom_90 custom_91 `custom_112` custom_56.
        custom_59 custom_113(
            custom_61: @custom_43<custom_39>,
            custom_108: felt252,
            custom_114: felt252,
            custom_115: felt252
        ) -> felt252 {
            custom_61.custom_94()
        }
    }

    #[custom_35(custom_116)]
    custom_37 custom_117<
        custom_39,
        +custom_40<custom_39>,
        +SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 custom_5::custom_118<custom_43<custom_39>> {
        /// custom_119 custom_48 custom_83 custom_120 custom_121 custom_41 custom_48 custom_4.
        custom_59 custom_122(custom_61: @custom_43<custom_39>) -> felt252 {
            custom_61.custom_13.custom_123()
        }

        /// custom_124 custom_48 custom_120 custom_121 custom_41 custom_48 custom_4 custom_90 `custom_125`.
        ///
        /// custom_49:
        ///
        /// - custom_50 custom_27 custom_52 custom_53 custom_48 custom_126 custom_127.
        ///
        /// custom_128 custom_129 `custom_20` custom_14.
        custom_59 custom_130(custom_131 custom_61: custom_43<custom_39>, custom_125: felt252) {
            custom_61.custom_132();
            custom_61.custom_133(custom_20 { custom_22: custom_61.custom_13.custom_123() });
            custom_61.custom_134(custom_125);
        }
    }

    /// custom_135 custom_136 custom_137 custom_54 `custom_42`.
    #[custom_35(custom_138)]
    custom_37 custom_139<
        custom_39,
        +custom_40<custom_39>,
        +SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 custom_5::custom_140<custom_43<custom_39>> {
        custom_59 custom_141(
            custom_61: @custom_43<custom_39>, custom_98: felt252, custom_29: custom_63<felt252>
        ) -> felt252 {
            custom_61.custom_99(custom_98, custom_29)
        }
    }

    /// custom_135 custom_136 custom_137 custom_54 `custom_142`.
    #[custom_35(custom_143)]
    custom_37 custom_144<
        custom_39,
        +custom_40<custom_39>,
        +SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 custom_5::custom_145<custom_43<custom_39>> {
        custom_59 custom_146(custom_61: @custom_43<custom_39>) -> felt252 {
            custom_61.custom_13.custom_123()
        }

        custom_59 custom_147(custom_131 custom_61: custom_43<custom_39>, custom_148: felt252) {
            custom_61.custom_130(custom_148);
        }
    }

    #[custom_149]
    custom_37 custom_150<
        custom_39,
        +custom_40<custom_39>,
        custom_37 custom_151: SRC5Component::custom_40<custom_39>,
        +custom_16<custom_39>
    > custom_41 InternalTrait<custom_39> {
        /// custom_152 custom_48 custom_4 custom_88 custom_153 custom_48 custom_154 custom_120 custom_121
        /// custom_155 custom_156 custom_48 custom_42 custom_5 custom_157.
        custom_59 custom_158(custom_131 custom_61: custom_43<custom_39>, custom_115: felt252) {
            custom_74 custom_62 custom_159 = custom_160!(custom_131 custom_61, custom_151);
            custom_159.custom_161(custom_5::custom_162);
            custom_61.custom_134(custom_115);
        }

        /// custom_163 custom_95 custom_48 custom_27 custom_86 custom_48 custom_4 custom_127. custom_164 custom_165 custom_166.
        custom_59 custom_132(custom_61: @custom_43<custom_39>) {
            custom_74 custom_27 = get_caller_address();
            custom_74 custom_61 = get_contract_address();
            assert(custom_61 == custom_27, custom_23::custom_33);
        }

        /// custom_163 custom_48 custom_29 custom_54 custom_48 custom_83 custom_51.
        /// custom_119 custom_48 custom_167 custom_168 `custom_169` if custom_97, custom_170 custom_165 custom_166.
        custom_59 custom_94(custom_61: @custom_43<custom_39>) -> felt252 {
            custom_74 custom_78 = get_tx_info().custom_79();
            custom_74 custom_171 = custom_78.custom_172;
            custom_74 custom_29 = custom_78.custom_29;
            assert(custom_61.custom_100(custom_171, custom_29), custom_23::custom_28);
            custom_0::custom_102
        }

        /// custom_124 custom_48 custom_120 custom_121 custom_173 custom_174 custom_48 custom_27.
        /// custom_50 custom_175 custom_41 custom_176 custom_177 custom_178 custom_48 `custom_130` custom_85 custom_86 custom_179.
        ///
        /// custom_128 custom_129 `custom_19` custom_14.
        custom_59 custom_134(custom_131 custom_61: custom_43<custom_39>, custom_125: felt252) {
            custom_61.custom_13.custom_180(custom_125);
            custom_61.custom_133(custom_19 { custom_21: custom_125 });
        }

        /// custom_119 custom_181 custom_48 custom_96 custom_29 custom_86 custom_97 custom_54 custom_48 custom_96 custom_98
        /// custom_182 custom_48 custom_4'custom_183 custom_83 custom_120 custom_121.
        custom_59 custom_100(
            custom_61: @custom_43<custom_39>, custom_98: felt252, custom_29: custom_64<felt252>
        ) -> custom_184 {
            custom_74 custom_185 = custom_29.custom_186() == 2_u32;

            if custom_185 {
                check_ecdsa_signature(
                    custom_98, custom_61.custom_13.custom_123(), *custom_29.custom_187(0_u32), *custom_29.custom_187(1_u32)
                )
            } else {
                custom_188
            }
        }
    }

    custom_59 custom_80(custom_62 custom_47: custom_63<Call>) -> custom_63<custom_64<felt252>> {
        custom_74 custom_62 custom_189 = custom_190::custom_191();
        custom_192 {
            custom_193 custom_47.custom_194() {
                custom_195::custom_196(custom_197) => {
                    custom_74 custom_198 = custom_199(custom_197);
                    custom_189.custom_200(custom_198);
                },
                custom_195::custom_201(custom_202) => { custom_203 (); },
            };
        };
        custom_189
    }

    custom_59 custom_199(custom_197: Call) -> custom_64<felt252> {
        custom_74 Call{custom_90, custom_204, custom_205 } = custom_197;
        custom_0::custom_206(custom_90, custom_204, custom_205.custom_101()).custom_207()
    }
}
