-- task-runner
return {
	cpp_cmake = {
		{
			label = "Config",
			command = "icpp config debug",
		},
		{
			label = "Config (Release)",
			command = "icpp config release",
		},
		{ label = "Run Tests", command = "icpp test" },
		{ label = "Build", command = "icpp build" },
		{ label = "CMake Install", command = "icpp install" },
		{ label = "Run", command = "cmake --build build --parallel 4 --target run" },
	},
	cpp = {
		{ label = "Build Single File", command = "g++ -o /tmp/a.out -std=c++23 " },
		{ label = "Run Single File", command = "/tmp/a.out" },
		{ label = "Clang Format Init", command = "clang-format --style=Google -dump-config > .clang-format" },
	},
	python = {
		{ label = "Run Script", command = "python " },
		{ label = "Run Tests", command = "pytest" },
	},
	rust = {
		{ label = "Build", command = "cargo build" },
		{ label = "Run", command = "cargo run" },
		{ label = "Test", command = "cargo test" },
	},
}
