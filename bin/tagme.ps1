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

$PROTOS_PATH = protos/golang/$TARGET

if([string]::IsNullOrEmpty($TARGET)) {
    Write-Host "Target is missing."
    exit 1
}

if([string]::IsNullOrEmpty($VERSION)) {
    Write-Host "Version is missing."
    exit 1
}

if (!(Test-Path $PROTOS_PATH)) {
    Write-Host "Path not found."
    exit 1
}

cd $PROTOS_PATH

if($DELETE -eq 'delete') {
    git tag --delete  $PROTOS_PATH/$VERSION
    git push -d origin $PROTOS_PATH/$VERSION
}

git tag $PROTOS_PATH/$VERSION
git push origin $PROTOS_PATH/$VERSION

cd ..\..\..

Write-Host "Tag successful."
exit 0
