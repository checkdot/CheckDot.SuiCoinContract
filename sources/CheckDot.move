module cdtToken::cdt {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap, CoinMetadata};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::url;

    const ERR_NOT_ADMIN: u64 = 0x10004;

    const IconUrl: vector<u8> = b"https://checkdot.io/token-256x256.png";

    struct CDT has drop {}

    fun init(witness: CDT, ctx: &mut TxContext) {
        assert_admin_signer(ctx);
        let (treasury_cap, metadata) = create_and_mint(witness, 9897808000000, ctx); // 9 897 808
        transfer::public_freeze_object(metadata);
        transfer::public_share_object(treasury_cap);
    }

    public entry fun burn(
        treasury_cap: &mut TreasuryCap<CDT>,
        coin: Coin<CDT>,
        ctx: &mut TxContext) {
        assert_admin_signer(ctx);
        coin::burn(treasury_cap, coin);
    }

    public entry fun transfer(treasury_cap: TreasuryCap<CDT>, recipient: address) {
        transfer::public_transfer(treasury_cap, recipient);
    }

    fun create_coin(
        witness: CDT,
        ctx: &mut TxContext,
    ): (TreasuryCap<CDT>, CoinMetadata<CDT>) {
        let ascii_url = std::ascii::string(IconUrl);
        let icon_url = url::new_unsafe(ascii_url);
        coin::create_currency(
            witness,
            6, // decimals
            b"CDT", // symbol
            b"CheckDot", // name
            b"", // description
            option::some(icon_url), // icon_url
            ctx
        )
    }

    fun create_and_mint(
        witness: CDT,
        amount: u64,
        ctx: &mut TxContext,
    ): (TreasuryCap<CDT>, CoinMetadata<CDT>) {
        let (treasury_cap, metadata) = create_coin(witness, ctx);
        mint(&mut treasury_cap, amount, ctx);
        (treasury_cap, metadata)
    }

    fun mint(treasury_cap: &mut TreasuryCap<CDT>, amount: u64, ctx: &mut TxContext) {
        coin::mint_and_transfer(treasury_cap, amount, tx_context::sender(ctx), ctx)
    }

    /// helper must admin
    fun assert_admin_signer(ctx: &TxContext) { assert!(tx_context::sender(ctx) == @cdt, ERR_NOT_ADMIN); }

    #[test_only]
    public fun init_for_testing(ctx: &mut TxContext) {
        init(CDT {}, ctx)
    }
}

#[test_only]
module cdtToken::cdt_tests {

    use sui::coin::{Self, TreasuryCap};
    use sui::test_scenario::{Self, Scenario, next_tx};
    use cdtToken::cdt::{Self, CDT};

    #[test]
    fun test_burn_() {
        let test = scenario();
        let scenario_mut = &mut test;

        let (owner, _) = people();

        next_tx(scenario_mut, owner); {
            let treasuryCap = test_scenario::take_shared<TreasuryCap<CDT>>(scenario_mut);
            let treasuryCap_mut = &mut treasuryCap;

            assert!(coin::total_supply<CDT>(treasuryCap_mut) == 100000000, 1);

            test_scenario::return_shared(treasuryCap)
        };
        test_scenario::end(test);
    }

    fun scenario(): Scenario { test_scenario::begin(@0x1) }
    fun people(): (address, address) { (@0xBEEF, @0xA11CE) }
}