$env:VCPKG_ROOT="D:\BitFactory\vcpkg"
$env:PATH="$env:VCPKG_ROOT;$env:PATH"

to custom_overlay
vcpkg remove virtual_void
vcpkg install virtual-void --overlay-ports=D:\BitFactory\custom_overlay

tp vcpkg.git
Copy-Item -Path D:\BitFactory\custom_overlay\virtual-void -Destination D:\BitFactory\vcpkg\ports\virtual-void 
git add ports/virtual-void
git commit -m "Add virtual-void to vcpkg"
vcpkg format-manifest "D:\BitFactory\vcpkg\ports\virtual-void\vcpkg.json"
vcpkg x-add-version virtual-void
git add versions/v-/virtual_void.json
