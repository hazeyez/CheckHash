# CheckHash / checkhash.sh

## Overview

The `checkhash.sh` script is a Bash script designed to verify the integrity of a file by comparing its hash with an expected hash value. The script supports two hash algorithms: SHA-256 and MD5. It calculates the hash of the specified file using the chosen algorithm and compares it with the provided expected hash. The result is displayed in colored text, indicating whether the hashes match or not.

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

```bash
./checkhash.sh -sha256 abcdef1234567890 <filename>
