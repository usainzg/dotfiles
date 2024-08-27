return {
  "badumbatish/brt.nvim",
  -- dir = "~/Developer/nvim_proj/brt.nvim",
  -- dev = { true },
  config = function()
    local project_map = {
      ["samminelang-workspace/"] = {
        build_command =
        "ssh sammine-wp 'cd sammine-lang && cmake -S . -B build_ssh -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1  && cmake --build build_ssh -j4'",
        run_command = "",
        test_command = "ssh sammine-wp 'cd sammine-lang && ctest --test-dir build_ssh --output-on-failure'",
        name = "sammine-lang"
      },
      ["Shuriken-Analyzer/"] = {
        build_command =
        "cmake -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DDEX_TESTS=ON -DCMAKE_BUILD_TYPE=Debug && cmake --build build -j4",
        run_command = "",
        test_command = "ctest --test-dir build --output-on-failure",
        name = "Shuriken"
      }

    }
    local brt = require("brt")
    brt.set_project_map(project_map)

    require("brt").setup()
  end
}
