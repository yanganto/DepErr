module deperr::constants;

// === Constants ===
const DEFAULT_IMAGE: vector<u8> = b"SomeImage";

public fun image(): vector<u8> { DEFAULT_IMAGE }

