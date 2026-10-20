do "programs/config.do"

capture confirm file "$can_zip"
local havezip = (_rc == 0)

if !`havezip' | "$redownload" != "" {
    copy "$can_url" "$can_zip"
}
