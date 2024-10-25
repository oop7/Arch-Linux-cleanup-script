#!/bin/bash

echo "Starting Arch Linux cleanup..."

# 1. Clean the package cache, keep the most recent 3 versions of installed packages
echo "Cleaning package cache and keeping the last 3 versions of installed packages..."
sudo paccache -r

# 2. Remove orphaned packages (unused dependencies)
echo "Removing orphaned packages..."
orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
  sudo pacman -Rns $orphans --noconfirm
else
  echo "No orphaned packages found."
fi

# 3. Clean up system logs older than 7 days and limit log size to 100MB
echo "Cleaning up old system logs..."
sudo journalctl --vacuum-time=7d

echo "Limiting log size to 100MB..."
sudo journalctl --vacuum-size=100M

# 4. Clean AUR build cache (if using yay)
if command -v yay &> /dev/null; then
  echo "Cleaning AUR build cache..."
  yay -Sc --noconfirm
else
  echo "AUR helper 'yay' not found. Skipping AUR cache cleanup."
fi

# 5. Clean Docker unused resources (if Docker is installed)
if command -v docker &> /dev/null; then
  echo "Cleaning Docker unused resources (containers, images, and volumes)..."
  docker container prune -f
  docker image prune -a -f
  docker volume prune -f
else
  echo "Docker not installed. Skipping Docker cleanup."
fi

# 6. Display disk usage summary after cleanup
echo "Cleanup complete! Displaying disk usage summary:"
df -h /

echo "Arch Linux cleanup finished."
