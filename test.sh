sleep 5
if curl web; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi