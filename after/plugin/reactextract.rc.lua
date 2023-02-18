local status, reactextract = pcall(require, "react-extract")
if not status then
  return
end

reactextract.setup()
