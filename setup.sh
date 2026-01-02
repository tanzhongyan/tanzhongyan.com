#!/bin/bash

# Setup script for Ghost deployment with submodules
set -e

echo "🚀 Starting Ghost deployment setup..."

# Initialize and update git submodules
echo "📦 Initializing git submodules..."
git submodule init
git submodule update --init --recursive

echo "✅ Submodules initialized"

# Check if apps directory exists
if [ ! -d "apps" ]; then
    echo "❌ Error: apps directory not found"
    exit 1
fi

# List available apps
echo "📋 Available apps:"
ls -la apps/

# Docker compose setup
echo "🐳 Setting up Docker environment..."

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  No .env file found. Please create one based on your requirements."
fi

# Build and start services
echo "🔨 Building and starting services..."
docker compose up -d --build

echo "✅ Setup complete!"
echo "📝 Ghost should be available at your configured URL"
echo "📝 Check logs with: docker compose logs -f"
