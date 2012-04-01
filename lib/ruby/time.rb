def time(&block)
  t = Time.now.to_f
  yield
  Time.now.to_f - t
end