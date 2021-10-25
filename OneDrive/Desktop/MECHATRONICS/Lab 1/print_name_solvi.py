clear all,
close all;
clc;

za_v = -1.21;
sd_v = -0.1987;
Ma = 44.2506;
Md = -97.2313;

A = [0 1 0; 0 za_v 1; 0 Ma 0];
B = [0; zd_v; Md];
C = [0 1 0];
D = 0;
R = 1;

t = linspace(0, 10, 300);

% Check for 