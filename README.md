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
