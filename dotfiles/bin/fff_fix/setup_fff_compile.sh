# source this file instead of executing it
#
# install rust
# sudo yum install
#
# check the right command
# nix profile install nixpkgs#zig
# nix profile install nixpkgs#rustc nixpkgs#cargo

# use zig wrapper
export PATH=~/bin/fff_fix:${PATH}

for dir in "/usr/lib64/llvm17/lib/clang/17/include" \
  "/opt/rh/gcc-toolset-13/root/usr/lib/gcc/x86_64-redhat-linux/13/include" \
  "/opt/rh/gcc-toolset-11/root/usr/lib/gcc/x86_64-redhat-linux/11/include" \
  "/usr/lib/gcc/x86_64-redhat-linux/8/include"; do
  if [ -d "$dir" ]; then
    export BINDGEN_EXTRA_CLANG_ARGS="-isystem $dir"
    break
  fi
done
