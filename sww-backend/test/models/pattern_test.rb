# == Schema Information
#
# Table name: patterns
#
#  id                   :bigint           not null, primary key
#  archived_at          :datetime
#  craft_type           :string           not null
#  currency             :string
#  difficulty_rating    :integer
#  first_published_date :date             not null
#  gauge_pattern        :string
#  languages            :string           default(["en"]), is an Array
#  likes                :integer
#  name                 :string           not null
#  nbr_rows             :integer          not null
#  nbr_stitches         :integer          not null
#  notes                :string
#  overall_rating       :integer
#  overall_yarn_weight  :string           not null
#  pdf_path             :string           not null
#  pictures_path        :string           not null
#  price                :float
#  release_date         :date
#  repeats              :integer
#  sizes                :string           default([]), is an Array
#  swatch_size          :integer          not null
#  total_yardage        :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_patterns_on_craft_type  (craft_type)
#  index_patterns_on_name        (name)
#  index_patterns_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class PatternTest < ActiveSupport::TestCase
  fixtures :users, :projects, :patterns

  test "should not save pattern without required fields" do
    pattern = Pattern.new
    assert_not pattern.save, "Saved the pattern without required fields"
  end

  test "should validate inclusion of craft_type" do
    pattern = patterns(:one)
    pattern.craft_type = "invalid_type"
    assert_not pattern.valid?
    assert_includes pattern.errors[:craft_type], "invalid_type is not a valid craft type"
  end

  test "should validate inclusion of overall_yarn_weight" do
    pattern = patterns(:one)
    pattern.overall_yarn_weight = "invalid_weight"
    assert_not pattern.valid?
    assert_includes pattern.errors[:overall_yarn_weight], "invalid_weight is not a valid overal yarn weight"
  end

  test "should validate inclusion of sizes" do
    pattern = patterns(:one)
    pattern.sizes = ["invalid_size", "XS"]
    assert_not pattern.valid?
    assert_includes pattern.errors[:sizes], "at least one of the following sizes is invalid: [\"invalid_size\", \"XS\"]"
  end

  test "should validate inclusion of difficulty_rating" do
    pattern = patterns(:one)
    pattern.difficulty_rating = 6
    assert_not pattern.valid?
    assert_includes pattern.errors[:difficulty_rating], "6 is not a valid difficulty rating"
  end

  test "should validate inclusion of overall_rating" do
    pattern = patterns(:one)
    pattern.overall_rating = 0
    assert_not pattern.valid?
    assert_includes pattern.errors[:overall_rating], "0 is not a valid overall rating"
  end

  # Test archive! method
  test "should archive pattern" do
    pattern = patterns(:one)
    assert_nil pattern.archived_at
    pattern.archive!
    assert_not_nil pattern.archived_at
  end

  # Test associations
  test "should belong to user" do
    pattern = patterns(:one)
    assert_not_nil pattern.user
  end

  test "should have many projects" do
    pattern = patterns(:one)
    assert_respond_to pattern, :projects
  end

  test "should have many yarns through patterns_yarns" do
    pattern = patterns(:one)
    assert_respond_to pattern, :yarns
  end

  test "should have many needles through patterns_needles" do
    pattern = patterns(:one)
    assert_respond_to pattern, :needles
  end

  test "should have many categories through patterns_categories" do
    pattern = patterns(:one)
    assert_respond_to pattern, :categories
  end

  test "should have many tags through patterns_tags" do
    pattern = patterns(:one)
    assert_respond_to pattern, :tags
  end

  test "should have many hooks through patterns_hooks" do
    pattern = patterns(:one)
    assert_respond_to pattern, :hooks
  end

  test "should have many favorites as favoritable" do
    pattern = patterns(:one)
    assert_respond_to pattern, :favorites
  end

  test "should have many purchases as purchasable" do
    pattern = patterns(:one)
    assert_respond_to pattern, :purchases
  end
end
