enum WindowSize { compact, medium, expanded }

WindowSize getWindowSize(double width) {
  if (width < 600) return WindowSize.compact;
  if (width < 840) return WindowSize.medium;
  return WindowSize.expanded;
}
