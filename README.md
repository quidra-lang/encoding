# Quidra Encoding

First-party binary/text encoding package for Quidra 0.6.x.

Use [Core `43328df`](https://github.com/quidra-lang/quidra/commit/43328df98bfb17df13b27b852068263a0453c687) or later for `#value` and `.len()` on binary values, strings, and arrays. The compatibility workflow pins that baseline.

On `develop`, `#value` is the ordinary zero-argument `value.len()` call. It also works automatically for custom classes and visible extensions that provide `len`; return types, errors and access/effect checks are unchanged. Standard array, string and binary lengths remain `nat`.

## Installation

```sh
quidra install quidra-encoding
```

## RFC 4648 standard Base64

```quidra
import encoding
encoded := encoding.base64.encode("Hello".utf8())
decoded := encoding.base64.decode(encoded)
```

`base64.encode(bin) -> string | error` rejects input whose bit length is not divisible by eight. `base64.decode(string) -> bin | error` requires the standard alphabet, 4-character groups, correct trailing `=` padding and zero unused pad bits. All non-Base64 text (including whitespace) is rejected. Empty inputs are valid. No silent text/UTF-8 conversion occurs; use `.utf8()` and `string.from_utf8` explicitly.

Base64URL (the `-`/`_` alphabet) is not accepted by the standard decoder. This is binary encoding, not encryption or compression.

## Testing

Run `bash tests/integration.sh /path/to/quidra` against the matching Core compiler.
