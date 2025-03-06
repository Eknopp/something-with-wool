# TODO: refactor
pattern = Pattern.find_by(name: "Pattern 1")
category = Category.find_by(category_level_1: "Accessories", category_level_2: "Bags & backpacks", category_level_3: "Moneybags")
pattern.categories << category if pattern && category
seed PatternsCategory, {pattern_id: pattern, category_id: category}
