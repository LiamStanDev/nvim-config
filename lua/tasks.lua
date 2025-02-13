-- task-runner
return {
	cpp_cmake = {
		{ label = "Run", command = "cmake --build build --parallel 4 --target run" },
		{
			label = "Init",
			command = "clang-format --style=Google -dump-config > .clang-format; rm -f build/CMakeCache.txt; cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
		},
		{
			label = "Init (Release)",
			command = "rm -f build/CMakeCache.txt; cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release",
		},
		{ label = "Run Tests", command = "cmake --build build --parallel 4 && (cd build && ctest; cd ..)" },
		{ label = "Build", command = "cmake --build build --parallel 4" },
		{ label = "Clean", command = "cmake --build build --target clean" },
		{ label = "CMake Install", command = "cmake --build build --parallel 4 --target install" },
	},
	cpp = {
		{ label = "Build Single File", command = "g++ -o a.out -std=c++23 " },
		{ label = "Run Single File", command = "./a.out" },
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
