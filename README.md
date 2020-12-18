# QEAMS - Qualitative Eclectic Automated Music Splicer

By Samuel Cabrera Valencia and Daniel Arnott

As part of our final project in Quantitative Engineering Analysis 2 (QEA 2), we explored the possibility of using spectrogram analysis and different signal processing techniques to see if we can write a program that would automatically create a playlist "mashup" given a user-inputted playlist of full-length songs.

<img src="figs/QEAMSlogo.png" width="300" height="200" />

## Introduction

Governing Question: Can matching time frame slices of a song's spectrogram be used to sync up music?

In this project we want to explore the possibility of using spectrogram analysis and different signal processing techniques to see if we can create a program that can automatically find the best fit song to mash up with a user-inputted sing given the frequencies at a defined moment in the user-inputted song.

The popular app "Shazam" is a great example of spectrogram analysis applied to music. Shazam procedurally generates a spectrogram based off the audio input it is getting from the phone's microphone and finds the song that most fits with this generated spectrogram through a large library of spectrograms that the app has saved. In our case, we have a smaller library for mixing songs and the program decides at what point in the current song that it will select a new song to be "mashed in" based off of criteria described in the "Finding Similarity Between Two Songs" section.

This will be more similar to the "AutoMashUpper" detailed in the research paper (cited in the Resources section) by a team at the National Institute of Advanced Industrial Science and Technology (AIST), Japan.

## What is a Spectrogram

<img src="figs/isometric_spect.png" width="600" height="400" />

A spectrogram is a visual representation of the spectrum of frequencies that a signal possesses over time. It technically has three measurable quantities, all 3 of which can be seen on the example spectrogram here (left).

This is an example of a spectrogram for one of the songs we used while gathering data for our prototype. Spectrograms are a powerful tool for analyzing signals that where both the frequencies and the time in which those frequencies appear are important, such as music!

## Function Workflow

<img src="figs/top_level_pipelin.png" width="900" height="200" />

With this pipeline, a user can simply run the program on a folder full of .wav files and produce a mix with ease!

## From Signal to Spectrogram and Back

Using MATLAB's built-in Spectrogram function, we can convert input signals into spectrograms accurately and efficiently. To convert back, we use the IFFT function from the following MATLAB community toolbox by Ph.D. Eng. Hristo Zhivomirov (posted on 12/21/13)

## Algorithm Workflow

<img src="figs/algo_pipeline.png" width="600" height="400" />

## Finding Similarity Between Two Songs

For a generalized formula, we can simply take the difference in value for an i-point DFT at each descrete point in time. For each difference, square it, add all of these together and take the square root. The algorithm then sorts through all of these values to find the minimun of difference and uses this as the index to stop the current song and start the next. 

Below is the equation we implemented for calculating this difference.

![Difference Formula](figs/min_equation.JPG)

## Mashups

Here is one of the mashups we've made using this program. Enjoy! (Unfortunately we can only show a few mashups according to Fair Use. We made a bunch of other mashups that came out really well, however!)

[royalty_free_mix](/royalty_free_mix.wav)

[bilingual_music_mix](/bilingual_pop_n_stuff.wav)

Copyright Disclaimer: Under Section 107 of the Copyright Act 1976, allowance is made for "fair use" for purposes such as criticism, comment, news reporting, teaching, scholarship and research. Fair use is a use permitted by copyright statute that might otherwise be infringing. Non-profit, educational or personal use tips the balance in favor of fair use.

## Conclusion

Going back to the question at the beginning, Can matching time frame slices of a song's spectrogram be used to sync up music?

The answer is yes, just not perfectly. The architecture of music is complex and includes a lot of information like bpm and tempo which is lost when only looking at frequencies at periods of time. That being said, some of the transitions in the some of the mashups are very impressive, almost as if the algorithm knew a lot more than what it does about when to cut and start the song. At the same time, there are a lot of underwhelimg transitions and at its worst the algorithm can produce some very jarring or seemingly illogical transitions between songs. For the limited information the code works with, we were satisfied with the results and it definitly made some awesome if not flawed mashups. 

## Resources

MATLAB Library

Zhivomirov, Hristo. “Isft.” MathWorks Help Center, MathWorks, 26 Dec. 2013, www.mathworks.com/help/signal/ref/istft.html.

Zhivomirov, Hristo. “Stft.” MathWorks Help Center, MathWorks, 26 Dec. 2013, www.mathworks.com/help/signal/ref/stft.html.

Readings / Videos

Davies, Matthew & Hamel, Philippe & Yoshii, Kazuyoshi & Goto, Masataka. (2014). AutoMashUpper: Automatic Creation of Multi-Song Music Mashups. Audio, Speech, and Language Processing, IEEE/ACM Transactions on. 22. 1726-1737. 10.1109/TASLP.2014.2347135. 

Cooper, Trey. “How Shazam Works.” Medium, Medium, 29 Jan. 2018, https://medium.com/@treycoopermusic/how-shazam-works-d97135fb4582.

carykh. “Computer Tries to Replicate My Voice!” YouTube, YouTube, 15 Aug. 2017, www.youtube.com/watch?v=jSsMqjMcRAg.

carykh. “AI Evolves to Compose 3 Hours of Jazz!” YouTube, YouTube, 4 July 2017, www.youtube.com/watch?v=nA3YOFUCn4U.

## How to Run the Code

You'll need a few dependancies, the biggest is the [signal processing tool](https://www.mathworks.com/products/signal.html) box from MATWORKS and the [ISTFT with MATLAB](https://www.mathworks.com/matlabcentral/fileexchange/45577-inverse-short-time-fourier-transform-istft-with-matlab) Add-On by Hristo Zhivomirov both of these can be found in the Add-On tab in the MATLAB Dashboard. 

Once these are downloaded, simply compile a folder full of .wav file music and run the ```Final_run.m``` script, select the folder (remmber to add it to your MATLAB path too) and let it run. This function should export a variable known as ```x```, simply put ```x``` to play run ```Sound(x, fs)``` and to save the song run ```audiowrite("<SONG_NAME>.wav", x, fs)``` and you are set!
