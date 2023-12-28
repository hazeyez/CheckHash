# CheckHash / checkhash.sh
```bash
# CheckHash v1.0 
# Author: hazeyez
# Copywright: a/k/a hazeyez (2023)
# License: GNU GPL Version 3, dated June 29, 2007 ("GPL3"). You can obtain a copy of the license at https://www.gnu.org/licenses/gpl-3.0-standalone.html
# Dual License: This software is distributed under GPL3 with additional restrictions; conveying commercial use or resale of any verbatim copies,...
##############  modified source versions, or non-source forms as defined within GPL3 sections 4, 5, and 6, are strictly prohibited without express...
##############  written consent and a previously agreed-upon compensation or licensing agreement with the original author. Any such reissuance...
##############  of this software under the aforementioned GPL3 sections, or other, in a non-commercial use or resale form must cite the original copywright.
##############  By downloading or copying the software as a whole or in part, you agree to these terms. If any provision of this Dual License conflicts...
##############  with the terms of GPL3, the terms of this Dual License shall supersede any such terms in GPL3 for legal means.

#####################################################
####  _                                          ####
#### | |                                         ####
#### | |__    __ _  ____  ___  _   _   ___  ____ ####
#### | '_ \  / _` ||_  / / _ \| | | | / _ \|_  / ####
#### | | | || (_| | / / |  __/| |_| ||  __/ / /  ####
#### |_| |_| \__,_|/___| \___| \__, | \___|/___| ####
####                            __/ |            ####
####                           |___/             ####
##################################################### 
```

## Overview

The `checkhash.sh` script is a Bash script designed to verify the integrity of a file by comparing its hash with an expected hash value. The script supports two hash algorithms: SHA-256 and MD5. It calculates the hash of the specified file using the chosen algorithm and compares it with the provided expected hash. 

The result is displayed in colored text, indicating whether the hashes match or not. It will also validate the hash cipher and alert you if it is an invalid SHA-256 or MD5 hash, and also alerts if the file you're testing does not exist. 

## Usage

### Running the Script

To use the script, follow these steps:

1. Save the `checkhash.sh` script to your local machine.
2. Make the script executable:

    ```bash
    chmod +x checkhash.sh
    ```

3. Run the script with the desired hash algorithm, expected hash, and filename:

    ```bash
    ./checkhash.sh -sha256 <expected_sha256_hash> <filename>
    ```

    or

    ```bash
    ./checkhash.sh -md5 <expected_md5_hash> <filename>
    ```

### Example
![Example shell file](/images/checkhash_shell.PNG)

***

# Create an alias in linux

## Overview

Creating an alias in linux allows you to run the file as a simple command, from any working directory, instead of having to use the full file name and path for it to run.
You can accomplish this by editing your ~home user's `.rc` file. In this case, I am using `Z shell` in Kali Linux. Therefore my `.rc` file is `.zshrc` in my ~home directory. 

### How-to

Use your preferred text editor to open the `.rc` file in your home dir. In this case, I use `nano` text editor:

1. `nano ~/.zshrc`
2. You can create a new line anywhere in the file, but I like to create a new section commented-out as `# User-created aliases:`
3. Under this section, add the alias line and replace `'checkhash'` with whatever you want the alias command to be that will call the file. (E.g. 'check' or 'ch')

   ```bash
   alias checkhash='/path/to/file/checkhash.sh'
   ```
### Example
![Example alias](/images/alias.PNG)

4. Save the edited file, then refresh your shell using the `source` command:

   ```bash
   source ~/.zshrc
   ```
5. Then simply repeat the same steps of usage, except now you can call the file from any directory you're in with the `checkhash` command (or 'check' or 'ch' - whichever you used in your alias) and without a full file path to execute the script.
### Example
![Example command](/images/checkhash_alias.PNG)

# ENJOY!



