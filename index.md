---
layout: default
title: VidStruction
description: Jesse Dill, Saarang Prabhuram, Ish Mehta
---
# What is VidStruction?

*Vid Struction* is an open-source platform that allows you to scan the word around you and create accurate 3D models using just your phone. We do this by leveraging state of the art NeRF models. The best part is that there is no black-boxed AI model, the platform is completely scalable and 100% open source (which means its FREEE) !!!

# Excited? Want to learn more?

Since the introduction of Neural Radiance Fields (NeRF) in 2020, there has been an explosion of interest in neural implicit representations for capturing 3D geometry. There are numerous versions of the original NeRF created 


# How do we do this?

![Architecture](architecture.png)
<div align="center"><sub>Overview of project design</sub></div>

It starts out with an intervactive front end where you can takea video of the object or scene you wish to take a video of. After which, the 


# How to use VidStruction?
A user starts off by either choosing a video of any object from their gallery or recording an object using an in-built camera software. After this, the video is then pipelined through Firebase and into GCP where a NeRF model renders the video into a 3D model of the object. This is then sent back through firebase as a GLB file and is shown in the app as interactive model. This file can be further be used for analysis or CAD purposes.
ew

sf