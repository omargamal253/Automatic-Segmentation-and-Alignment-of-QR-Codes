# Automatic-Segmentation-and-Alignment-of-QR-Codes

<h2 align="left">Main Idea</h2>

Quick response (QR) code is a two-dimensional barcode that can hold different type of information. A QR code consists of black squares arranged in a square grid on a white background, which can be read by an imaging device such as a camera1. The QR code system became popular in many applications due to its fast readability and greater storage capacity (e.g. product tracking, item identification, document management, FCIS attendance system… to name a few).
This application aims to automatically segment the QR from an image. Then, correct its alignment so that its three corners aligned to top right, top left and bottom right, as shown in

![3](https://user-images.githubusercontent.com/48572908/147702854-0f0eab42-1866-411f-b847-0b3bdd6e1296.png)

As a start, assume that the camera is perpendicular but of different distances from the QR. The QR can be represented to the camera with any in-plane rotation angle, any backgrounds and on different materials (white paper, poster, image on mobile…etc). The application should be able to automatically segment and align the QR from the given image.

<h2 align="left">Objective</h2> 

 The objective of this project is to detect, segment and align of QR Codes.
 Many condition are considered:
     - Different distances between camera and QR.
     - Picture taken from different camera perspectives.
     - Images with different backgrounds.
     - QR with different in-plane rotation angles.
     - QR on different sources (i.e. different lighting conditions).
     - Picture of more than one QR.
     
<h2 align="left">Sample Input/Output</h2>

![4](https://user-images.githubusercontent.com/48572908/147703286-a38dfda7-3aef-425c-9620-2e789f73c4ef.png)

<h2 align="left">Demo Screen</h2>

![2](https://user-images.githubusercontent.com/48572908/147703450-4a7af524-1bbe-4d5e-ae7f-dc1bc4524ce3.png)





