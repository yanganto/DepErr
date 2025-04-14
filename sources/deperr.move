module deperr::demo;

use deperr::constants;


public struct Campaign has key {
    id: UID,
    img: vector<u8>,
}

fun init(ctx: &mut TxContext) {
    transfer::share_object(Campaign {
        id: object::new(ctx),
        img: constants::image(),
    });
}

public fun image(self: &Campaign): vector<u8> {
    self.img
}

// === Test Functions ===
// The setup function can use in the test packages, it is current practice
#[test_only]
public fun init_for_testing(ctx: &mut TxContext) {
    init(ctx);
}
