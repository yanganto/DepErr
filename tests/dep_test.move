#[test_only]
module deperr::test;

const EINVALIDIMAGE: u64 = 99;

#[test]
fun test_img() {
    use sui::test_scenario;
    use deperr::demo;
    use std::debug;

    let alice: address = @0xA11CE;
    let mut scenario = test_scenario::begin(alice);
    {
        demo::init_for_testing(scenario.ctx())
    };
    scenario.next_tx(alice);
    {
        let campaign = scenario.take_shared<demo::Campaign>();
        debug::print(&campaign.image());
        // [debug] 0x536f6d65496d616765
        assert!(campaign.image() == b"SomeImage", EINVALIDIMAGE);
        test_scenario::return_shared(campaign);
    };

    scenario.end();
}
