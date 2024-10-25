# Arch Linux Cleanup Script

A script to automate Arch Linux cleanup by removing cache, orphaned packages, old logs, and unused resources, helping optimize system storage.

## 💪 Features

- Cleans package cache, keeping only the latest three versions of each installed package
- Removes orphaned packages (unused dependencies)
- Cleans old system logs and limits log size to 100MB
- Optionally clears AUR build cache (if using `yay`)
- Optionally removes unused Docker resources (containers, images, and volumes)
- Provides a disk usage summary after cleanup

## 💻 Usage

### Prerequisites
- Arch Linux or an Arch-based distribution
- Optional: `yay` (for cleaning AUR build cache) and Docker (for Docker cleanup)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/arch-linux-cleanup.git
   cd arch-linux-cleanup
   
2. Make the script executable:
```bash
chmod +x clean_arch.sh
```
### Running the Script

To perform the cleanup, run the script with root privileges:
```bash
sudo ./clean_arch.sh
```
### Example Output

The script will output the status of each cleanup step, and a final disk usage summary to confirm reclaimed space.

## ❓ Disclaimer

Use this script carefully and only if you are comfortable with system maintenance tasks. Always review and understand each command within the script, especially if making modifications.

## ℹ️ Contributing

Feel free to open issues or submit pull requests to improve the script. Contributions are welcome!

## 📜 License

This project is [licensed](licensed) under the MIT License.
