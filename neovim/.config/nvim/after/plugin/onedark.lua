local status_ok, onedark = pcall(require, 'onedark')
if not status_ok then
  print 'Could not find onedark color scheme'
  return
end

onedark.setup {
  style = 'darker'
}
onedark.load()
