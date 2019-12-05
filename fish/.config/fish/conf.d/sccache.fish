### sccache support
# see https://github.com/mozilla/sccache

if command -sq sccache
    set -x RUSTC_WRAPPER sccache
end
