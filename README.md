# RingCentral Desktop Softphone Mode Switcher
Script to simplify toggling RingCentral Desktop Softphone between production and sandbox modes

**Operating Systems Supported**

* MacOS

## Installation

1. Download or clone this repository
2. Change directories into where you downloaded or cloned this repository
    ```
    cd <path/to/repository>
    ```
3. Either copy, move this file to `$HOME/bin` and rename to `rcmode.sh`
    ```
    # Copy
    cp ringcentralSoftphoneToggler.sh $HOME/bin/rcmode.sh

    # Move
    mv ringcentralSoftphoneToggler.sh $HOME/bin/rcmode.sh
    ```
4. Create an alias to the executable with proper parameters
    ```
    # In .profile (or your preferred location for aliases) add a new line
    alias rcprod="$HOME/bin/rcmode.sh production"
    alias rcdev="$HOME/bin/rcmode.sh"
    ```
5. Re-initialize your shell
    ```
    source ~/.profile
    ```
6. Now you are ready to start using this script:

* To turn your soft phone on for use with your RingCentral Sandbox account, from the terminal issue the command `rcsand`
* To turn your soft phone on for use with your RingCentral Production account, from the terminal issue the command `rcprod`

## What is happening under the hood

This utility provides three functions for developers working with the RingCentral Platform and their Desktop Softphone:

1. Creates the `config.ini` file for you if you're just getting started with the RingCentral Platform
    ```
    // If you followed the above installation instructions
    rcdev

    // If you want to execute the file without the above setup
    ./ringcentralSoftphoneToggler.sh
    ```
2. Switches the name of the `config.ini` file to `configTMP.ini` which acts like a toggle for production mode
    ```
    // If you followed the above installation instructions
    rcprod

    // If you want to execute the file without the above setup
    ./ringcentralSoftphoneToggler.sh production
    ```
3. Switches the name of the `configTMP.ini` file to `config.ini` which acts like a toggle for sandbox mode
    ```
    // If you followed the above installation instructions
    rcdev

    // If you want to execute the file without the above setup
    ./ringcentralSoftphoneToggler.sh sandbox
    ```

## Contributing

### Before writing code

* Confirm the issue is new by reviewing the [issue tracker](https://github.com/bdeanindy/ringcentral-toggle-softphone-dev-mode.git)
* If your issue is not in the [issue tracker](https://github.com/bdeanindy/ringcentral-toggle-softphone-dev-mode.git), then please [create a new issue](https://github.com/bdeanindy/ringcentral-toggle-softphone-dev-mode/issues/new)

### Submitting Pull Requests

* Write meaningful commit messages.
* Submit a pull request from your github fork, mentioning the issue your changes fix.
* Follow your pull request answering questions and making adjustments as appropriate until it is merged.

## Issues

* Confirm the issue is new by reviewing the [issue tracker](https://github.com/bdeanindy/ringcentral-toggle-softphone-dev-mode.git)
* If your issue is not in the [issue tracker](https://github.com/bdeanindy/ringcentral-toggle-softphone-dev-mode.git), then please [create a new issue](https://github.com/bdeanindy/ringcentral-toggle-softphone-dev-mode/issues/new)

## LICENSE

Copyright &copy; 2015 Benjamin Dean
[MIT License](/LICENSE)
