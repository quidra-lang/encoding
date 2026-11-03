# Quidra Encoding

First-party binary/text encoding package for Quidra 0.6.x.

## Installation

```sh
quidra install quidra-encoding
```

## RFC 4648 standard Base64

```quidra
import encoding
string encoded = encoding.base64.encode("Hello".utf8())
bin decoded = encoding.base64.decode(encoded)
```

`base64.encode(bin) -> string | error` rejects input whose bit length is not divisible by eight. `base64.decode(string) -> bin | error` requires the standard alphabet, 4-character groups, correct trailing `=` padding and zero unused pad bits. All non-Base64 text (including whitespace) is rejected. Empty inputs are valid. No silent text/UTF-8 conversion occurs; use `.utf8()` and `string.from_utf8` explicitly.

Base64URL (the `-`/`_` alphabet) is not accepted by the standard decoder. This is binary encoding, not encryption or compression.

## Testing

Run `bash tests/integration.sh /path/to/quidra` against the matching Core compiler.
