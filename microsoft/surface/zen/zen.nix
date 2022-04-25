{ lib, callPackage, fetchFromGitHub, linuxKernel, ... }: with builtins; let
    kernel = callPackage ./linux-5.16.11.nix { };
    ref = "${kernel.version}-zen1";
in kernel.override {
    argsOverride = {
        version = ref;
        modDirVersion = ref;
        src = fetchGit {
            url = "https://github.com/zen-kernel/zen-kernel.git";
            ref = "refs/tags/v${ref}";
        };
        kernelPatches = linuxKernel.kernels.linux_zen.kernelPatches ++ (kernel.kernelPatches or []);
        structuredExtraConfig = linuxKernel.kernels.linux_zen.structuredExtraConfig // (kernel.structuredExtraConfig or {});
    };
}
