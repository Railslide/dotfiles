local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  print 'Could not find Comment plugin'
  return
end

comment.setup()
