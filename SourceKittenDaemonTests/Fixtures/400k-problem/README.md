# swift-demo

Simple demo that helps test code completion

## start daemon

```
sourcekittendaemon start --project path/to/demo/demo.xcodeproj --port 8888 --verbose
```

## get completion

```
curl http://localhost:8888/complete --header "X-Offset: 28" --header "X-Path: path/to/demo/demo/main.swift"
```
