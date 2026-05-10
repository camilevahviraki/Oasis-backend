# Database Schema & API Documentation

## Store Categories Enhancement

### Overview
Categories are now stored in the database with comprehensive metadata including icons, colors, translations keys, and sort order. This allows for dynamic UI rendering and easy management without code changes.

---

## Database Schema Changes

### Migration: `20260510_enhance_store_categories_list_table.rb`

**New Columns Added to `store_categories_lists` Table:**

```ruby
- key (string, unique)          # Translation key (e.g., 'clothing', 'electronics')
- description (text)             # Category description for UI tooltips
- icon_name (string)             # React Icons MD component name (e.g., 'MdCheckroom')
- icon_color (string)            # Hex color code for icon (default: '#FF6B35')
- sort_order (integer)           # Display order (default: 0)
- active (boolean)               # Category visibility flag (default: true)
```

**Indexes Added:**
- `key` (unique) - Ensures translation keys are unique
- `sort_order` - Enables efficient sorting by display order

---

## Seed Data Structure

### File: `db/seeds_data/stores_categories_list_enhanced.json`

**Sample Record:**
```json
{
  "name": "Clothing",
  "key": "clothing",
  "icon_name": "MdCheckroom",
  "description": "Apparel, dresses, shirts, and fashion items",
  "icon_color": "#FF6B35",
  "sort_order": 1,
  "active": true
}
```

**Available Categories (29 total):**
1. Clothing
2. Electronics
3. Education
4. Books
5. Groceries
6. Home Decor
7. Sports Equipment
8. Beauty and Personal Care
9. Toys and Games
10. Jewelry and Accessories
11. Automotive
12. Pet Supplies
13. Health and Wellness
14. Office Supplies
15. Home Appliances
16. Furniture
17. Music and Instruments
18. Art and Craft Supplies
19. Shoes
20. Baby and Kids
21. Food and Beverages
22. Video Games
23. Watches
24. Cameras and Photography
25. Gifts and Souvenirs
26. Fitness Equipment
27. Outdoor Gear
28. Stationery
29. Garden and Plants

---

## API Endpoints

### GET `/stores_categories_list`
**Returns:** Array of all active store categories

**Response Format:**
```json
[
  {
    "id": 1,
    "name": "Clothing",
    "key": "clothing",
    "description": "Apparel, dresses, shirts, and fashion items",
    "icon_name": "MdCheckroom",
    "icon_color": "#FF6B35",
    "sort_order": 1,
    "active": true,
    "image_url": "https://...",
    "icon": null
  },
  ...
]
```

---

## Model Changes

### `StoreCategoriesList` Model
**File:** `app/models/store_categories_list.rb`

```ruby
class StoreCategoriesList < ApplicationRecord
  has_many :store_categories, foreign_key: 'store_categories_list_id', dependent: :destroy
  has_one_attached :image
end
```

---

## Serializer Changes

### `StoreCategoriesListSerializer`
**File:** `app/serializers/store_categories_list_serializer.rb`

**Attributes Returned:**
- `id`
- `name`
- `key` (for i18n translations)
- `description`
- `icon_name` (for frontend icon mapping)
- `icon_color` (for dynamic icon coloring)
- `sort_order` (for consistent ordering)
- `active` (for visibility control)
- `image_url` (from Active Storage)
- `icon` (legacy field)

---

## Frontend Integration

### Icon Mapping Utility
**File:** `src/utils/iconMapper.js`

Provides mapping between database `icon_name` values and React Icons components:

```javascript
// Get icon component
const IconComponent = getIconComponent('MdCheckroom');

// Render icon
renderIcon('MdCheckroom', 32, '#FF6B35');
```

### Category Component Updates
**File:** `src/client/welcome_page/categories_slider/CatgorySlider.js`

Now fetches categories from Redux store (populated via API) and renders:
- Dynamic icon based on `icon_name`
- Category name
- Icon color from database
- Smooth hover animations

### Translation Integration
**File:** `src/config/locales/en.json`

New section `pages.categories` with all 29 category names in English.

---

## Migration Steps

### 1. Run Database Migration
```bash
cd Oasis-backend
rails db:migrate
```

### 2. Update Seeds
```bash
rails db:seed
```
This will:
- Drop and recreate `store_categories_lists` table with new columns
- Load enhanced category data from `stores_categories_list_enhanced.json`
- Populate all 29 categories with proper metadata

### 3. Frontend Build
```bash
cd ../Oasis
npm install  # Install any new dependencies if needed
npm start
```

---

## Benefits

✅ **No Hardcoding:** Categories are 100% database-driven
✅ **Easy Updates:** Modify categories without code changes
✅ **Internationalization:** Uses i18n keys for multi-language support
✅ **Rich UI:** Icons, colors, descriptions stored with category data
✅ **Performance:** Sorted, indexed for efficient queries
✅ **Scalable:** Easy to add new categories
✅ **Admin-Friendly:** Can be managed via admin panel

---

## Future Enhancements

- [ ] Create admin UI for category management
- [ ] Add category image uploads
- [ ] Category analytics (views, sales by category)
- [ ] Subcategories support
- [ ] Category-based promotions/discounts
- [ ] Category search optimization

---

## Rollback Plan (if needed)

```bash
# If you need to revert to old structure:
rails db:rollback

# This will:
- Remove new columns
- Restore original structure
- Preserve existing data
```

---

## Notes

- All category names are unique identifiers
- Color values must be valid hex codes
- Sort order can be adjusted anytime without migration
- Active flag allows soft-deletion of categories
- Icon names must match available React Icons MD components
