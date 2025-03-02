class AddIndicesToTables < ActiveRecord::Migration[8.0]
  def change
    # add_index :projects, :user_id
    # add_index :projects, :pattern_id
    # add_index :patterns, :user_id
    add_index :patterns, :name
    add_index :patterns, :craft_type
    # add_index :patterns_needles, :needle_id
    add_index :tags, :name
    add_index :categories, :type
    add_index :categories, :main_category
    # add_index :patterns_hooks, :hook_id
    # add_index :users_yarns, :user_id
    # add_index :users_yarns, :yarn_id
    # add_index :patterns_tags, :pattern_id
    # add_index :patterns_tags, :tag_id
    # add_index :patterns_yarns, :pattern_id
    # add_index :patterns_yarns, :yarn_id
    # add_index :patterns_categories, :category_id
    # add_index :purchases, :user_id
    add_index :purchases, :purchasable_id
    add_index :purchases, :purchasable_type
    # add_index :favorites, :user_id
    add_index :favorites, :favoritable_id
    add_index :favorites, :favoritable_type
    # add_index :yarns, :user_id
    # add_index :projects_yarns, :project_id
    # add_index :projects_yarns, :yarn_id
    # add_index :projects_categories, :category_id
    # add_index :projects_tags, :project_id
    # add_index :projects_tags, :tag_id
    # add_index :projects_hooks, :hook_id
    # add_index :projects_needles, :needle_id
    # add_index :patterns_magazines, :pattern_id
    # add_index :patterns_magazines, :magazine_id
    # add_index :magazines, :user_id
    # add_index :followers, :followee_id
    # add_index :followers, :follower_id
    # add_index :issues, :magazine_id
    add_index :issues, :name
    add_index :issues, :release_date
    # add_index :yarns_hooks, :hook_id
    # add_index :yarns_needles, :needle_id
  end
end
