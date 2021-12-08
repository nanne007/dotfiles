set -l sys (uname)
if test $sys = "Darwin"
    and test -d /usr/local/opt/openssl
    set -a fish_user_paths /usr/local/opt/openssl/bin
    set -gxa LDFLAGS "-L/usr/local/opt/openssl/lib"
    set -gxa CPPFLAGS "-I/usr/local/opt/openssl/include"
    set -gxa PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig"
end

