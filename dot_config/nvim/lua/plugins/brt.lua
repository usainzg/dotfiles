return {
    "badumbatish/brt.nvim",
    -- dir = "~/Developer/nvim_proj/brt.nvim",
    -- dev = { true },
    -- @t
    config = function()
        local project_map = {
            ["sammine-lang/"] = {
                build_command =
                "cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1  && cmake --build build -j4",
                run_command = "./build/src/sammine -f unit-tests/artifacts/valid_grammar.txt --llvm-ir --diagnostics"

                ,
                test_command = "ctest --test-dir build --output-on-failure",
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
