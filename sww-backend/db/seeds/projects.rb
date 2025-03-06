seed Project, {name: "Admin's First Project", user_id: User.find_by(email: "admin@test.com").id, pattern_id: Pattern.find_by(name: "Basic Scarf").id}, {
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  notes: "Admin's first knitting project.",
  project_started: Date.new(2021, 6, 1),
  project_finished: Date.new(2021, 7, 1),
  rows: 100,
  size: "M",
  status: "finished",
  stitches: 2000,
  swatch_size: "4x4"
}

seed Project, {name: "Local User's Hat Project", user_id: User.find_by(email: "local@test.com").id, pattern_id: Pattern.find_by(name: "Simple Hat").id}, {
  gauge_pattern: "16 sts and 20 rows = 4 inches in Single Crochet",
  notes: "Local user's first crochet project.",
  project_started: Date.new(2021, 8, 1),
  project_finished: Date.new(2021, 9, 1),
  rows: 50,
  size: "L",
  status: "finished",
  stitches: 750,
  swatch_size: "4x4"
}

seed Project, {name: "Project 1", user_id: User.find_by(email: "user3@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 1").id}, {
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  notes: "Project 1 notes.",
  project_started: Date.new(2021, 8, 1),
  project_finished: Date.new(2021, 9, 1),
  rows: 120,
  size: "M",
  status: "finished",
  stitches: 3000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 2", user_id: User.find_by(email: "user4@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 2").id}, {
  gauge_pattern: "18 sts and 24 rows = 4 inches in Single Crochet",
  notes: "Project 2 notes.",
  project_started: Date.new(2021, 9, 1),
  project_finished: Date.new(2021, 10, 1),
  rows: 80,
  size: "L",
  status: "finished",
  stitches: 1600,
  swatch_size: "4x4"
}

seed Project, {name: "Project 3", user_id: User.find_by(email: "user5@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 1").id}, {
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  notes: "Project 3 notes.",
  project_started: Date.new(2021, 10, 1),
  project_finished: Date.new(2021, 11, 1),
  rows: 120,
  size: "M",
  status: "finished",
  stitches: 3000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 4", user_id: User.find_by(email: "admin@test.com").id, pattern_id: Pattern.find_by(name: "Advanced Sweater").id}, {
  gauge_pattern: "18 sts and 24 rows = 4 inches in Stockinette Stitch",
  notes: "Project 4 notes.",
  project_started: Date.new(2021, 11, 1),
  project_finished: Date.new(2021, 12, 1),
  rows: 200,
  size: "L",
  status: "finished",
  stitches: 6000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 5", user_id: User.find_by(email: "local@test.com").id, pattern_id: Pattern.find_by(name: "Simple Hat").id}, {
  gauge_pattern: "16 sts and 20 rows = 4 inches in Single Crochet",
  notes: "Project 5 notes.",
  project_started: Date.new(2021, 12, 1),
  project_finished: Date.new(2022, 1, 1),
  rows: 50,
  size: "L",
  status: "finished",
  stitches: 750,
  swatch_size: "4x4"
}

seed Project, {name: "Project 6", user_id: User.find_by(email: "local2@test.com").id, pattern_id: Pattern.find_by(name: "Elegant Shawl").id}, {
  gauge_pattern: "22 sts and 30 rows = 4 inches in Lace Weave",
  notes: "Project 6 notes.",
  project_started: Date.new(2022, 1, 1),
  project_finished: Date.new(2022, 2, 1),
  rows: 150,
  size: "L",
  status: "finished",
  stitches: 4500,
  swatch_size: "4x4"
}

seed Project, {name: "Project 7", user_id: User.find_by(email: "local2@test.com").id, pattern_id: Pattern.find_by(name: "Cozy Blanket").id}, {
  gauge_pattern: "12 sts and 16 rows = 4 inches in Garter Stitch",
  notes: "Project 7 notes.",
  project_started: Date.new(2022, 2, 1),
  project_finished: Date.new(2022, 3, 1),
  rows: 250,
  size: "XL",
  status: "finished",
  stitches: 10000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 8", user_id: User.find_by(email: "user3@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 1").id}, {
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  notes: "Project 8 notes.",
  project_started: Date.new(2022, 3, 1),
  project_finished: Date.new(2022, 4, 1),
  rows: 120,
  size: "M",
  status: "finished",
  stitches: 3000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 9", user_id: User.find_by(email: "user4@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 2").id}, {
  gauge_pattern: "18 sts and 24 rows = 4 inches in Single Crochet",
  notes: "Project 9 notes.",
  project_started: Date.new(2022, 4, 1),
  project_finished: Date.new(2022, 5, 1),
  rows: 80,
  size: "L",
  status: "finished",
  stitches: 1600,
  swatch_size: "4x4"
}

seed Project, {name: "Project 10", user_id: User.find_by(email: "user5@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 1").id}, {
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  notes: "Project 10 notes.",
  project_started: Date.new(2022, 5, 1),
  project_finished: Date.new(2022, 6, 1),
  rows: 120,
  size: "M",
  status: "finished",
  stitches: 3000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 11", user_id: User.find_by(email: "admin@test.com").id, pattern_id: Pattern.find_by(name: "Advanced Sweater").id}, {
  gauge_pattern: "18 sts and 24 rows = 4 inches in Stockinette Stitch",
  notes: "Project 11 notes.",
  project_started: Date.new(2022, 6, 1),
  project_finished: Date.new(2022, 7, 1),
  rows: 200,
  size: "L",
  status: "finished",
  stitches: 6000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 12", user_id: User.find_by(email: "local@test.com").id, pattern_id: Pattern.find_by(name: "Simple Hat").id}, {
  gauge_pattern: "16 sts and 20 rows = 4 inches in Single Crochet",
  notes: "Project 12 notes.",
  project_started: Date.new(2022, 7, 1),
  project_finished: Date.new(2022, 8, 1),
  rows: 50,
  size: "L",
  status: "finished",
  stitches: 750,
  swatch_size: "4x4"
}

seed Project, {name: "Project 13", user_id: User.find_by(email: "local2@test.com").id, pattern_id: Pattern.find_by(name: "Elegant Shawl").id}, {
  gauge_pattern: "22 sts and 30 rows = 4 inches in Lace Weave",
  notes: "Project 13 notes.",
  project_started: Date.new(2022, 8, 1),
  project_finished: Date.new(2022, 9, 1),
  rows: 150,
  size: "L",
  status: "finished",
  stitches: 4500,
  swatch_size: "4x4"
}

seed Project, {name: "Project 14", user_id: User.find_by(email: "local2@test.com").id, pattern_id: Pattern.find_by(name: "Cozy Blanket").id}, {
  gauge_pattern: "12 sts and 16 rows = 4 inches in Garter Stitch",
  notes: "Project 14 notes.",
  project_started: Date.new(2022, 9, 1),
  project_finished: Date.new(2022, 10, 1),
  rows: 250,
  size: "XL",
  status: "finished",
  stitches: 10000,
  swatch_size: "4x4"
}

seed Project, {name: "Project 15", user_id: User.find_by(email: "user3@test.com").id, pattern_id: Pattern.find_by(name: "Pattern 1").id}, {
  gauge_pattern: "20 sts and 28 rows = 4 inches in Stockinette Stitch",
  notes: "Project 15 notes.",
  project_started: Date.new(2022, 10, 1),
  project_finished: Date.new(2022, 11, 1),
  rows: 120,
  size: "M",
  status: "finished",
  stitches: 3000,
  swatch_size: "4x4"
}
