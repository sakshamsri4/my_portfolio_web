#!/bin/bash

# Firebase Analytics Setup Verification Script
# This script verifies that Firebase Analytics is properly configured

set -e

echo "🔍 Firebase Analytics Setup Verification"
echo "========================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}❌ Error: pubspec.yaml not found. Please run this script from the project root.${NC}"
    exit 1
fi

echo "📋 Checking Firebase dependencies..."

# Check for firebase_core dependency
if grep -q "firebase_core:" pubspec.yaml; then
    VERSION=$(grep "firebase_core:" pubspec.yaml | awk '{print $2}')
    echo -e "${GREEN}✅ firebase_core dependency found: $VERSION${NC}"
else
    echo -e "${RED}❌ firebase_core dependency missing in pubspec.yaml${NC}"
    exit 1
fi

# Check for firebase_analytics dependency
if grep -q "firebase_analytics:" pubspec.yaml; then
    VERSION=$(grep "firebase_analytics:" pubspec.yaml | awk '{print $2}')
    echo -e "${GREEN}✅ firebase_analytics dependency found: $VERSION${NC}"
else
    echo -e "${RED}❌ firebase_analytics dependency missing in pubspec.yaml${NC}"
    exit 1
fi

echo ""
echo "📄 Checking Firebase configuration files..."

# Check for firebase_options.dart
if [ -f "lib/firebase_options.dart" ]; then
    echo -e "${GREEN}✅ lib/firebase_options.dart exists${NC}"
    
    # Verify it contains the correct project ID
    if grep -q "saksham-portfolio-ba828" lib/firebase_options.dart; then
        echo -e "${GREEN}   ✓ Project ID: saksham-portfolio-ba828${NC}"
    else
        echo -e "${YELLOW}   ⚠ Warning: Project ID not found or incorrect${NC}"
    fi
    
    # Verify it contains the measurement ID
    if grep -q "G-VVVFQJL1WD" lib/firebase_options.dart; then
        echo -e "${GREEN}   ✓ Measurement ID: G-VVVFQJL1WD${NC}"
    else
        echo -e "${YELLOW}   ⚠ Warning: Measurement ID not found or incorrect${NC}"
    fi
else
    echo -e "${RED}❌ lib/firebase_options.dart not found${NC}"
    exit 1
fi

# Check for firebase.json
if [ -f "firebase.json" ]; then
    echo -e "${GREEN}✅ firebase.json exists${NC}"
else
    echo -e "${YELLOW}⚠ firebase.json not found (optional for web-only)${NC}"
fi

# Check for .firebaserc
if [ -f ".firebaserc" ]; then
    echo -e "${GREEN}✅ .firebaserc exists${NC}"
    
    if grep -q "saksham-portfolio-ba828" .firebaserc; then
        echo -e "${GREEN}   ✓ Default project configured${NC}"
    fi
else
    echo -e "${YELLOW}⚠ .firebaserc not found (optional for web-only)${NC}"
fi

echo ""
echo "🔧 Checking Bootstrap initialization..."

# Check if bootstrap.dart imports Firebase
if grep -q "firebase_core/firebase_core.dart" lib/bootstrap.dart; then
    echo -e "${GREEN}✅ Firebase Core imported in bootstrap.dart${NC}"
else
    echo -e "${RED}❌ Firebase Core not imported in bootstrap.dart${NC}"
    exit 1
fi

# Check if Firebase is initialized
if grep -q "Firebase.initializeApp" lib/bootstrap.dart; then
    echo -e "${GREEN}✅ Firebase.initializeApp called in bootstrap.dart${NC}"
else
    echo -e "${RED}❌ Firebase.initializeApp not found in bootstrap.dart${NC}"
    exit 1
fi

# Check if DefaultFirebaseOptions is used
if grep -q "DefaultFirebaseOptions" lib/bootstrap.dart; then
    echo -e "${GREEN}✅ DefaultFirebaseOptions configured${NC}"
else
    echo -e "${RED}❌ DefaultFirebaseOptions not used in bootstrap.dart${NC}"
    exit 1
fi

echo ""
echo "📦 Checking Analytics Service..."

# Check for analytics service files
if [ -f "lib/app/services/analytics_service.dart" ]; then
    echo -e "${GREEN}✅ AnalyticsService exists${NC}"
else
    echo -e "${RED}❌ AnalyticsService not found${NC}"
    exit 1
fi

if [ -f "lib/app/services/analytics_service_web.dart" ]; then
    echo -e "${GREEN}✅ Web-specific analytics implementation exists${NC}"
fi

if [ -f "lib/app/services/analytics_service_io.dart" ]; then
    echo -e "${GREEN}✅ Native-specific analytics implementation exists${NC}"
fi

# Check for analytics controller
if [ -f "lib/app/controllers/analytics_controller.dart" ]; then
    echo -e "${GREEN}✅ AnalyticsController exists${NC}"
else
    echo -e "${YELLOW}⚠ AnalyticsController not found${NC}"
fi

echo ""
echo "🌐 Checking Web Configuration..."

# Check web/index.html for Firebase JavaScript SDK
if [ -f "web/index.html" ]; then
    echo -e "${GREEN}✅ web/index.html exists${NC}"
    
    if grep -q "firebase-app.js" web/index.html || grep -q "firebase.google.com" web/index.html; then
        echo -e "${GREEN}   ✓ Firebase JavaScript SDK configured${NC}"
    else
        echo -e "${YELLOW}   ⚠ Firebase JavaScript SDK not found${NC}"
    fi
    
    if grep -q "G-VVVFQJL1WD" web/index.html; then
        echo -e "${GREEN}   ✓ Measurement ID in web config${NC}"
    fi
else
    echo -e "${YELLOW}⚠ web/index.html not found${NC}"
fi

echo ""
echo "🧪 Checking Test Files..."

if [ -f "test/app/services/analytics_service_test.dart" ]; then
    echo -e "${GREEN}✅ Analytics service tests exist${NC}"
else
    echo -e "${YELLOW}⚠ Analytics service tests not found${NC}"
fi

if [ -f "test/app/controllers/analytics_controller_test.dart" ]; then
    echo -e "${GREEN}✅ Analytics controller tests exist${NC}"
else
    echo -e "${YELLOW}⚠ Analytics controller tests not found${NC}"
fi

echo ""
echo "📚 Checking Documentation..."

if [ -f "FIREBASE_ANALYTICS_IMPLEMENTATION.md" ]; then
    echo -e "${GREEN}✅ Implementation documentation exists${NC}"
fi

if [ -f "docs/firebase_analytics_integration.md" ]; then
    echo -e "${GREEN}✅ Integration guide exists${NC}"
fi

if [ -f "docs/analytics_testing_guide.md" ]; then
    echo -e "${GREEN}✅ Testing guide exists${NC}"
fi

echo ""
echo "========================================"
echo -e "${GREEN}✅ All Firebase Analytics checks passed!${NC}"
echo ""
echo "📋 Next Steps:"
echo "   1. Run: flutter pub get"
echo "   2. Build: flutter build web --release --target=lib/main_production.dart"
echo "   3. Deploy: firebase deploy --only hosting"
echo "   4. Verify: Visit https://saksham-portfolio-ba828.web.app/#/home?debug=1"
echo "   5. Monitor: Firebase Console → Analytics → DebugView"
echo ""
echo "For more details, see FIREBASE_ANALYTICS_IMPLEMENTATION.md"
