#!/bin/bash

# Sync Global Orchestration Logic (macOS/Linux)
set -e

SOURCE_DIR="/Users/verakoroleva/Desktop/доработка маркетинг 2/orchestration/.agent"
DEST_DIR="/Users/verakoroleva/.antigravity/global_orchestrator"
BACKUP_DIR="$DEST_DIR/backup/$(date +%Y%m%d_%H%M%S)"

echo "🚀 Starting Global Orchestration Sync..."

# 1. Create Backup
if [ -d "$DEST_DIR" ]; then
    echo "📦 Creating backup of existing config..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$DEST_DIR"/* "$BACKUP_DIR/" 2>/dev/null || true
else
    mkdir -p "$DEST_DIR"
fi

# 2. Sync Files
echo "🔄 Migrating fresh files from $SOURCE_DIR..."

# Copy MD files
cp "$SOURCE_DIR/AGENTS.md" "$DEST_DIR/AGENTS.md"
cp "$SOURCE_DIR/GEMINI.md" "$DEST_DIR/GEMINI.md"

# Copy skills folder (excluding secrets)
if [ -d "$SOURCE_DIR/skills" ]; then
    mkdir -p "$DEST_DIR/skills"
    rsync -av --exclude='.env' --exclude='*.key' --exclude='node_modules' --exclude='.git' "$SOURCE_DIR/skills/" "$DEST_DIR/skills/"
fi

echo "✅ Global Orchestration Logic Updated Successfully!"
echo "📍 Global Storage: $DEST_DIR"
