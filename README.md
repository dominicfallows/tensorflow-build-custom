# tensorflow-build-custom

Build Tensorflow from source.

Based on example from [Sasha Nikiforov](https://knowm.org/compiling-tensorflow-from-source-on-macos/) and [here](https://stackoverflow.com/questions/41293077/how-to-compile-tensorflow-with-sse4-2-and-avx-instructions).

## Install on Mac

1. Run `git submodule init` to get the TensorFlow repo
2. Install Xcode via Mac App Store
3. Install Bazel

   ```bash
   brew install bazel
   bazel version
   brew upgrade bazel
   ```

4. Install build dependencies

   ```bash
   pip3 install six numpy wheel
   brew install coreutils
   ```

5. Update file permissions

   ```bash
   chmod +x build_tensorflow_clean.sh build_tensorflow_incremental.sh cpu_flags.sh
   ```

## Build on Mac

1. If your first build, or you need to reconfigure/build a clean package

   ```bash
   ./build_tensorflow_clean.sh
   ```

2. If an incremental build

   ```bash
   ./build_tensorflow_incremental.sh
   ```
