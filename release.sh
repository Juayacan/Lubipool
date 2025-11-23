#!/bin/bash

# LubiPool Card - Release Helper Script
# Este script te ayuda a crear una nueva versión del proyecto

set -e

echo "🏊 LubiPool Card - Release Helper"
echo "=================================="
echo ""

# Verificar que estamos en la rama main
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "❌ Error: Debes estar en la rama 'main'"
    exit 1
fi

# Verificar que no hay cambios sin commitear
if [ -n "$(git status --porcelain)" ]; then
    echo "❌ Error: Hay cambios sin commitear"
    echo "Ejecuta: git add . && git commit -m 'tu mensaje'"
    exit 1
fi

# Pedir versión
echo "Versión actual en package.json:"
CURRENT_VERSION=$(node -p "require('./package.json').version")
echo "v$CURRENT_VERSION"
echo ""

read -p "Nueva versión (ej: 1.0.1): " NEW_VERSION

if [ -z "$NEW_VERSION" ]; then
    echo "❌ Error: Debes especificar una versión"
    exit 1
fi

echo ""
echo "📝 Cambios a realizar:"
echo "  - Actualizar package.json: v$CURRENT_VERSION → v$NEW_VERSION"
echo "  - Compilar proyecto"
echo "  - Crear commit"
echo "  - Crear tag v$NEW_VERSION"
echo "  - Push a GitHub"
echo ""
read -p "¿Continuar? (s/n): " CONFIRM

if [ "$CONFIRM" != "s" ] && [ "$CONFIRM" != "S" ]; then
    echo "❌ Cancelado"
    exit 0
fi

echo ""
echo "🔧 Actualizando package.json..."
npm version "$NEW_VERSION" --no-git-tag-version

echo "📦 Compilando proyecto..."
npm run build

echo "📝 Creando commit..."
git add package.json dist/
git commit -m "chore: bump version to v$NEW_VERSION"

echo "🏷️  Creando tag..."
git tag -a "v$NEW_VERSION" -m "Release v$NEW_VERSION"

echo "⬆️  Subiendo a GitHub..."
git push origin main
git push origin "v$NEW_VERSION"

echo ""
echo "✅ ¡Release v$NEW_VERSION creado exitosamente!"
echo ""
echo "📋 Próximos pasos:"
echo "  1. Ve a: https://github.com/TU_USUARIO/lubipool-card/releases"
echo "  2. GitHub Actions compilará automáticamente"
echo "  3. Edita el release y agrega notas desde CHANGELOG.md"
echo ""
echo "🎉 ¡Listo!"
