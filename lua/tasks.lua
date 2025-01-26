-- task-runner
return {
	cpp = {
		{
			label = "CMake Init (Debug)",
			command = "cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1",
		},
		{ label = "CMake Init (Release)", command = "cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release" },
		{ label = "CMake Build", command = "cmake --build build" },
		{ label = "CMake Clean", command = "cmake --build build --target clean" },
		{ label = "Run Tests", command = "cd build && ctest" },
	},
	python = {
		{ label = "Run Script", command = "python main.py" },
		{ label = "Run Tests", command = "pytest" },
	},
	rust = {
		{ label = "Build", command = "cargo build" },
		{ label = "Run", command = "cargo run" },
		{ label = "Test", command = "cargo test" },
	},
}
