{ fetchTarball, lib, ignores, ... }: with builtins; with lib; let
    ck = fetchTarball {
        url = http://ck.kolivas.org/patches/5.0/5.12/5.12-ck1/5.12-ck1-broken-out.tar.xz;
        sha256 = "1x56xh1r01i33k06ig7s7zd06h6hwcqiidy842426mla4h7x3yvq";
    };
in (map (name: {
    inherit name;
    patch = "${toString ck}/${name}";
}) (pipe ck [
    readDir
    attrNames
    (filter (p: !elem p (flatten [
        "series"
        ignores
    ])))
]))