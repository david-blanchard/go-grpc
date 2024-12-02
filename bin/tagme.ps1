<#
.PARAMETER TARGET
.PARAMETER VERSION
.PARAMETER DELETE
#>

param(
    [string] $TARGET,
    [string] $VERSION,
    [string] $DELETE
)

if([string]::IsNullOrEmpty($TARGET)) {
    Write-Host "Target is missing."
    exit 1
}

if([string]::IsNullOrEmpty($VERSION)) {
    Write-Host "Version is missing."
    exit 1
}

cd protos/golang/$TARGET

if($DELETE -eq 'delete') {
    git tag --delete  protos/golang/$TARGET/$VERSION
    git push -d origin protos/golang/$TARGET/$VERSION
}

git tag protos/golang/$TARGET/$VERSION
git push origin protos/golang/$TARGET/$VERSION

cd ..\..\..

Write-Host "Tag successful."
exit 0
