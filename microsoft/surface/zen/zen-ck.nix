{ callPackage, linuxKernel, lib, ... }: let
    kernel = callPackage ./zen.nix { };
in kernel.override {
    argsOverride = rec {
        version = "${kernel.version}-ck";
        modDirVersion = version;
        kernelPatches = (callPackage ./ck.nix { ignores = [
            # "0001-MultiQueue-Skiplist-Scheduler-v0.210.patch"
            # "0002-Unmask-ondemand-and-conservative-and-allow-schedutil.patch"
            # "0003-Make-preemptible-kernel-default.patch"
            # "0004-Create-highres-timeout-variants-of-schedule_timeout-.patch"
            # "0005-Special-case-calls-of-schedule_timeout-1-to-use-the-.patch"
            # "0006-Convert-msleep-to-use-hrtimers-when-active.patch"
            # "0007-Replace-all-schedule-timeout-1-with-schedule_min_hrt.patch"
            # "0008-Replace-all-calls-to-schedule_timeout_interruptible-.patch"
            # "0009-Replace-all-calls-to-schedule_timeout_uninterruptibl.patch"
            # "0010-Don-t-use-hrtimer-overlay-when-pm_freezing-since-som.patch"
            # "0011-Make-hrtimer-granularity-and-minimum-hrtimeout-confi.patch"
            # "0012-Make-threaded-IRQs-optionally-the-default-which-can-.patch"
            # "0013-Reinstate-default-Hz-of-100-in-combination-with-MuQS.patch"
            # "0014-Swap-sucks.patch"
            # "0015-Make-nohz_full-not-be-picked-up-as-a-default-config-.patch"
            # "0016-Add-ck1-version.patch"
        ]; }) ++ kernel.kernelPatches;
    };
}