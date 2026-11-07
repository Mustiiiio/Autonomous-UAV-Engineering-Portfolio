# Add Test Videos to GitHub

There are two test-video categories: **inert mine-mockup detection** and **geometric shape detection**. Their principal home is the separate *YOLO Mine & Shape Detection* repository; this UAV repo can link to them when discussing the EFES or TEKNOFEST vision tracks.

## Recommended: YouTube Unlisted

1. Export short MP4 demonstrations with overlays; blur faces, addresses, license plates and exact sensitive locations.
2. Upload to YouTube using visibility **Unlisted**.
3. Put a clickable thumbnail or text link in each project's `README.md`:

```md
[Watch the inert mockup detection test](https://www.youtube.com/watch?v=REPLACE_ME)
[Watch the shape detection test](https://www.youtube.com/watch?v=REPLACE_ME)
```

Unlisted does not mean access-controlled: anyone with the link can view it.

## Alternative: GitHub Releases

Create a release in the computer-vision repository, upload videos as release assets, and link each asset's real URL from the matching project section. This keeps bulky `.mp4` files out of normal Git history. For a *short, small* clip, committing an MP4 is possible but is usually a poor long-term choice.

## Reproducibility metadata

For each video add a date, camera type/resolution, model filename, inference device, confidence setting, whether detections are real-time or post-processed, and whether objects are **inert 3D-printed mockups**. Include the video duration, input/output FPS and a note if no ground-truth evaluation was performed.

## Do not overclaim

Detection of a printed mockup is not evidence of detecting a real explosive device; video overlays are qualitative, not substitutes for held-out precision/recall/mAP results.
