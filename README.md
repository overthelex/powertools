# powertools

Power management scripts for LocalRouter.

## Install

```bash
echo 'deb [trusted=yes] http://apt.highfunk.uk /' | sudo tee /etc/apt/sources.list.d/powertools.list
sudo apt update && sudo apt install -y powertools
```

## Usage

```bash
gotosave              # power save mode (default: --laptop)
gotosave --router     # router-optimized power save
gotosave --maxsave    # extreme power saving
gotosave --ultrasave  # ultra-extreme (experimental)
gotoperf              # restore performance mode
gotosleep             # suspend system
powermode             # show current power mode
```

Tab completion works for `gotosave` options.

## Compatibility

### Tested on

| Component | Details |
|-----------|---------|
| Motherboard | ASUS ProArt X870E-CREATOR WIFI |
| CPU | AMD Ryzen 7 9800X3D (Zen 5) |
| OS | Ubuntu 24.04 LTS |
| Kernel | 6.17.x |

### Requirements

- **CPU**: AMD or Intel with `cpufreq` scaling support
  - AMD: `amd-pstate` or `acpi-cpufreq` driver
  - Intel: `intel_pstate` or `acpi-cpufreq` driver
- **BIOS**: ACPI-compliant, CPU frequency scaling not locked by BIOS
- **Kernel**: 5.x+ (needs `/sys/devices/system/cpu/cpufreq/` sysfs interface)
- **Packages**: `ethtool` (installed automatically as a dependency)

### Kernel features used

| sysfs path | Feature |
|------------|---------|
| `/sys/devices/system/cpu/cpufreq/boost` | CPU turbo boost toggle |
| `/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor` | CPU frequency governor |
| `/sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference` | EPP (AMD pstate / Intel HWP) |
| `/sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq` | Max frequency cap |
| `/sys/devices/system/cpu/cpu*/online` | CPU hotplug (core disable) |
| `/sys/module/pcie_aspm/parameters/policy` | PCIe power management |
| `/proc/sys/vm/laptop_mode` | VM writeback optimization |
| `/sys/power/state` | System suspend |

### Should work on

- **Distros**: Ubuntu 22.04+, Debian 12+, Fedora 38+, Arch (any recent)
- **CPUs**: AMD Ryzen (all generations), Intel Core 6th gen+, any CPU with cpufreq
- **Motherboards**: Any with standard ACPI support (ASUS, MSI, Gigabyte, ASRock, etc.)

Scripts gracefully skip features that aren't available on a given system (`2>/dev/null`).
