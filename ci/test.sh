sleep 5
if curl http://localhost:80; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi
