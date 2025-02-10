-- task-runner
return {
	cpp_cmake = {
		{ label = "CMake Run", command = "cmake --build build --parallel 4 --target run" },
		{
			label = "CMake Init (Debug)",
			command = "rm -f build/CMakeCache.txt; cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
		},
		{
			label = "CMake Init (Release)",
			command = "rm -f build/CMakeCache.txt; cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release",
		},
		{ label = "CMake Clean", command = "cmake --build build --target clean" },
		{ label = "CMake Build", command = "cmake --build build --parallel 4" },
		{ label = "Clang Format Init", command = "clang-format --style=Google -dump-config > .clang-format" },
		{ label = "Run Tests", command = "cd build && ctest" },
		{ label = "CMake Install", command = "cmake --build build --parallel 4 --target install" },
	},
	cpp = {
		{ label = "Build Single File", command = "g++ -o a.out -std=c++23 " },
		{ label = "Run Single File", command = "./a.out" },
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
